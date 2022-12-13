
#include <SPI.h>

#include "src/Array/src/Array.h"  // https://github.com/janelia-arduino/Array because I miss the STL too much
#include "src/arduino_midi_library/src/MIDI.h"  // https://github.com/FortySevenEffects/arduino_midi_library

// Default instance is bound to the HW serial port
MIDI_CREATE_DEFAULT_INSTANCE();

// CONSTANTS
const int LTC_CS = 10;
const int MCP_CS = 9;
const int MCP_LDAC = 8;
const int GATE = 3;
const int MIDI_ACTIVITY = 2;
const Array<int, 4> CHANNEL_SELECTOR_SWITCH_PINS({4, 5, 6, 7});  // in binary order: 1, 2, 4, 8

// STATE
byte midi_channel = 1;  // 1-16

// SPI protocol for the MCP4812 DAC. It has a 16-bit shift register that can update one of the two
// outputs at a time, so updating both DACs takes two commands. Note that the members of this struct are upside-down compared to the datasheet. This is because the 
union MCP4812Command {
    struct Fields {
        uint8_t __:2;  // unused

        uint16_t mcp_value:10;

        uint8_t mcp_output_shutdown:1;
        static constexpr uint8_t MCP_OUTPUT_ACTIVE = 1;
        static constexpr uint8_t MCP_OUTPUT_SHUTDOWN = 0;

        uint8_t mcp_gain_select:1;
        static constexpr uint8_t MCP_GAIN_2X = 0;
        static constexpr uint8_t MCP_GAIN_1X = 1;

        uint8_t _:1;  // unused

        uint8_t mcp_ab_select:1;
        static constexpr uint8_t MCP_DAC_A = 0;
        static constexpr uint8_t MCP_DAC_B = 1;
    } __attribute__((packed)) fields;
    uint16_t value;
};

static_assert(sizeof(MCP4812Command) == 2);


void update_dacs(uint16_t ltc, uint16_t mcp_a, uint16_t mcp_b) {
    // Clamp the 16-bit integers for the MCP4812 to 10-bits
    mcp_a = min(mcp_a, 1023);
    mcp_b = min(mcp_b, 1023);

    // NOTE: These structs are overwritten with input data by the SPI.transfer API,
    // so we prepare two of them rather than re-using one.
    MCP4812Command command_a = {
        fields: {
            mcp_value: mcp_a,
            mcp_output_shutdown: MCP4812Command::Fields::MCP_OUTPUT_ACTIVE,
            mcp_gain_select: MCP4812Command::Fields::MCP_GAIN_2X,
            mcp_ab_select: MCP4812Command::Fields::MCP_DAC_A,
        }
    };

    MCP4812Command command_b = {
        fields: {
            mcp_value: mcp_b,
            mcp_output_shutdown: MCP4812Command::Fields::MCP_OUTPUT_ACTIVE,
            mcp_gain_select: MCP4812Command::Fields::MCP_GAIN_2X,
            mcp_ab_select: MCP4812Command::Fields::MCP_DAC_B,
        }
    };

    // Slow down the SPI clock to <= 500khz
    SPISettings settings(2500000, MSBFIRST, SPI_MODE0);
    SPI.beginTransaction(settings); // Configures SPI and disables interrupts

    digitalWrite(LTC_CS, LOW);
    SPI.transfer16(ltc);
    digitalWrite(LTC_CS, HIGH);

    // digitalWrite() is slow enough that its actually been 5usec since we set it high

    digitalWrite(MCP_CS, LOW);
    SPI.transfer16(command_a.value);
    digitalWrite(MCP_CS, HIGH);

    digitalWrite(MCP_CS, LOW);
    SPI.transfer16(command_b.value);
    digitalWrite(MCP_CS, HIGH);

    // Trigger the MCP to load the new value and update its outputs
    digitalWrite(MCP_LDAC, LOW);
    digitalWrite(MCP_LDAC, HIGH);

    SPI.endTransaction(); // re-enables interrupts
}

byte read_16_switch(const Array<int, 4> &pins) {
    byte value = 0;
    for (int i = 0; i < pins.size(); i++) {
        // LOW/HIGH are technically #defines, and so value is uncertain.
        // Convert to 0/1 and invert, since LOW means active in our circuit.
        byte pin_value = digitalRead(pins[i]) == HIGH ? 0 : 1;
        value |= (pin_value << i);
    }
    return value;
}

void handleNoteOn(byte channel, byte pitch, byte velocity)
{
    // Do whatever you want when a note is pressed.

    // Try to keep your callbacks short (no delays ect)
    // otherwise it would slow down the loop() and have a bad impact
    // on real-time performance.
    digitalWrite(MIDI_ACTIVITY, HIGH);
    delay(5);
    digitalWrite(MIDI_ACTIVITY, LOW);
}

void handleNoteOff(byte channel, byte pitch, byte velocity)
{
    digitalWrite(MIDI_ACTIVITY, HIGH);
    delay(5);
    digitalWrite(MIDI_ACTIVITY, LOW);
}

void setup() {
    pinMode(LTC_CS, OUTPUT);
    pinMode(MCP_CS, OUTPUT);
    pinMode(MCP_LDAC, OUTPUT);
    pinMode(GATE, OUTPUT);
    pinMode(MIDI_ACTIVITY, OUTPUT);
    digitalWrite(LTC_CS, HIGH);
    digitalWrite(MCP_CS, HIGH);
    digitalWrite(MCP_LDAC, HIGH);
    digitalWrite(GATE, LOW);
    digitalWrite(MIDI_ACTIVITY, LOW);

    // MIDI channel selector
    for (int pin : CHANNEL_SELECTOR_SWITCH_PINS) {
        pinMode(pin, INPUT_PULLUP);
    }
    midi_channel = read_16_switch(CHANNEL_SELECTOR_SWITCH_PINS) + 1;

    // Start main IO
    SPI.begin();

    MIDI.setHandleNoteOn(handleNoteOn);
    MIDI.setHandleNoteOff(handleNoteOff);
    MIDI.begin(MIDI_CHANNEL_OMNI);
}

uint16_t ltc_value = 0;
uint16_t mcp_value = 0;
// uint16_t mcp_b_value = 0;

void loop() {
    update_dacs(ltc_value, mcp_value, mcp_value);
    delay(10);
    ltc_value+=128;
    mcp_value+=2;
    if (mcp_value == 1024) {
      mcp_value = 0;
    }
    digitalWrite(GATE, (mcp_value % 4 == 0) ? HIGH : LOW);
    MIDI.read();
}
