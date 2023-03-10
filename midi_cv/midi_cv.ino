
#include <SPI.h>

#include "src/Array/src/Array.h"  // https://github.com/janelia-arduino/Array because I miss the STL too much
#include "src/arduino_midi_library/src/MIDI.h"  // https://github.com/FortySevenEffects/arduino_midi_library
#include "curve.h"

// Outputs max values from all jacks. 10V from pitch, and 5V from velocity and breath
#define TEST_MODE 0

// Default instance is bound to the HW serial port
MIDI_CREATE_DEFAULT_INSTANCE();

struct MidiNote {
    byte note;
    byte velocity;  // 0-127
};

// CONSTANTS

// Pins
constexpr int LTC_CS = 10;
constexpr int MCP_CS = 9;
constexpr int MCP_LDAC = 8;
constexpr int GATE = 3;
constexpr int MIDI_ACTIVITY = 2;
const Array<int, 4> CHANNEL_SELECTOR_SWITCH_PINS({4, 5, 6, 7});  // in binary order: 1, 2, 4, 8

constexpr unsigned long MIDI_ACTIVITY_WINDOW_MS = 5;  // Length of time that the midi LED flashes for
constexpr byte BREATH_CC = 2;
constexpr byte MIN_MIDI_NOTE = 24;  // C1 == 32.70 Hz == 0 V
constexpr byte MAX_MIDI_NOTE = 127;  // G9 == 12543.85 Hz == 8.583 V
// The hardware can only output a maximum of 10V, so the midi range above can only be 10 octaves wide
static_assert(MIN_MIDI_NOTE < MAX_MIDI_NOTE);
static_assert((MAX_MIDI_NOTE - MIN_MIDI_NOTE) <= 120);
constexpr uint8_t BEND_SEMITONES = 2;

// STATES
unsigned long now_ms = 0;
unsigned long last_midi_ms = 0;

// Latest MIDI Inputs
byte midi_channel = 1;  // 1-16
byte midi_breath = 0;  // 0-127
int midi_bend = 0;  // "bend" is centered at 0 by the MIDI library for us. Range is [-8192, 8191]
Array<MidiNote, 10> midi_notes;


//
// Misc Utils
//

class MovingAverage {
public:
    MovingAverage(size_t window_size) : window_size_(window_size) {};
    int operator()(int sample) {
        avg_ += (sample - avg_) / window_size_;
        return avg_;
    }
private:
    int avg_ = 0;
    const int window_size_ = 1;
};

class SlewDown {
public:
    // Higher devisor = longer/slower slew
    SlewDown(size_t slew_divisor) : slew_divisor_(slew_divisor) {};
    int operator()(int sample) {
        if (sample < value_) {
            // Note that we max(1, x) to protect against cases where either the
            // slew_divisor_ is large, or the sample difference is small. Both
            // cases are liable to produce an interval of zero.
            value_ -= max(1, ((value_ - sample) / slew_divisor_));
        } else {
            // On up-slopes, this filter is transparent
            value_ = sample;
        }
        return value_;
    }
private:
    int value_;
    const int slew_divisor_;
};

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

uint16_t seven_to_ten_bit(uint16_t value) {
    value = min(value, 127);
    // Multiply the value by 8 to re-range into [0, 1016], and use the top 3 bits to fill in the 3 zero bits that shifting created.
    //
    // Input bits:  [6, 5, 4, 3, 2, 1, 0]
    // Output bits: [6, 5, 4, 3, 2, 1, 0, 6, 5, 4]
    return (value << 3) | (value >> 4);
}

// Safely subtracts two millis timestamps accounting for rollover
// Precondition: if the datatypes were infinitely wide: a >= b
// Returns: a - b
unsigned long subtract_millis(unsigned long a, unsigned long b) {
    if (a < b) {
        constexpr unsigned long MILLIS_MAX = -1;
        return (MILLIS_MAX - b) + a;
    }
    // The simple case
    return a - b;
}

void blink_midi_act_led() {
    // We actually don't do any blinking here. We consolidate our blinking into 5ms windows.
    // Note that we don't read millis() again. The rollover math requires that last_midi_ms
    // is never larger than "now".
    last_midi_ms = now_ms;
}

void run_midi_act_led() {
    const unsigned long duration = subtract_millis(now_ms, last_midi_ms);
    digitalWrite(MIDI_ACTIVITY, (duration <= MIDI_ACTIVITY_WINDOW_MS) ? HIGH : LOW);
}

//
// DAC Handling
//

// SPI protocol for the MCP4812 DAC. It has a 16-bit shift register that can update one of the two
// outputs at a time, so updating both DACs takes two commands. Note that the members of this struct
// are upside-down compared to the datasheet. This is because of the combination of C bitfields and
// the MSB-first setting on the SPI port.
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
    MCP4812Command command_a = {};
    command_a.fields.mcp_value = mcp_a;
    command_a.fields.mcp_output_shutdown = MCP4812Command::Fields::MCP_OUTPUT_ACTIVE;
    command_a.fields.mcp_gain_select = MCP4812Command::Fields::MCP_GAIN_2X;
    command_a.fields.mcp_ab_select = MCP4812Command::Fields::MCP_DAC_A;

    MCP4812Command command_b = {};
    command_b.fields.mcp_value = mcp_b;
    command_b.fields.mcp_output_shutdown = MCP4812Command::Fields::MCP_OUTPUT_ACTIVE;
    command_b.fields.mcp_gain_select = MCP4812Command::Fields::MCP_GAIN_2X;
    command_b.fields.mcp_ab_select = MCP4812Command::Fields::MCP_DAC_B;

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

//
// MIDI Handlers
//

// Use the generic "all messages" callback to blink the activity LED. This will have the LED
// responding to all messages on the channel, even ones that don't update the outputs.
void handleMesssage(const decltype(MIDI)::MidiMessage& message) {
    // Ignore active sensing messages, periodically sent every 300ms from the wind controller.
    if (message.type == midi::ActiveSensing) {
        return;
    }
    blink_midi_act_led();
}

void handleNoteOn(byte channel, byte note, byte velocity)
{
    // Ingore notes that are out of range
    if ((note < MIN_MIDI_NOTE) || (note > MAX_MIDI_NOTE)) {
        return;
    }

    if (velocity == 0) {
        // NOTE ON with zero velocity is a NOTE OFF
        handleNoteOff(channel, note, velocity);
        return;
    }

    // Push the note into the precedence array. Note that this can take one of two forms:
    //   - If the array has room in it, simple push_back()
    //   - If the array is full, we evict the zeroth element and still push_back()
    if (midi_notes.size() < midi_notes.max_size()) {
        midi_notes.push_back(MidiNote{
            .note = note,
            .velocity = velocity
        });
    } else {
        for (size_t i = 1; i < midi_notes.size(); i++) {
            midi_notes[i-1] = midi_notes[i];
        }
        midi_notes.back() = MidiNote{
            .note = note,
            .velocity = velocity
        };
    }
}

void handleNoteOff(byte channel, byte note, byte velocity) {
    // Ingore notes that are out of range
    if ((note < MIN_MIDI_NOTE) || (note > MAX_MIDI_NOTE)) {
        return;
    }

    // Search for the note in the midi_notes table and remove it if found
    int found = -1;
    for (size_t i = 0; i < midi_notes.size(); i++) {
        if (midi_notes[i].note == note) {
            found = i;
            break;
        }
    }

    if (found == -1) {
        return;  // Spurious NOTE OFF, or we evicted this note from the precedence buffer
                 // (held down too many keys, so we stopped tracking the oldest note)
    }

    midi_notes.remove(found);

    // If we're turning off gate, also turn off breath. Note that we do this by zeroing
    // midi_breath, not dac_breath, since we want the smoothing to run on the downslope.
    if (midi_notes.empty()) {
        midi_breath = 0;
    }
}

void handleControlChange(byte channel, byte control, byte value) {
    if (control != BREATH_CC) {
        return;
    }

    midi_breath = value;
}

void handlePitchBend(byte channel, int bend) {
    midi_bend = bend;
}

//
// MIDI-to-DAC converters
//

uint16_t compute_dac_pitch(byte note, int bend) {
    // Volt/Octave is already an exponential space (each volt doubles the frequency),
    // so each semitone is simply 1/12 of a volt (don't need to deal with any
    // 12th-root-of-2 business). Our hardware has a 16-bit DAC [0, 65535] that covers
    // a 0-10V range, so each semitone is exactly 546.125 DAC steps.
    //
    // Pitch bend is [-8192, 8191] from the MIDI lib, and normally covers +/- 2 semitone
    // So a semitone bend is 4096 "midi units".
    //
    // It's tempting to use floating point for this, but not only would that be slower,
    // I've also encountered bugs in the various Arduino compilers for floating point.
    // Instead, we do everything in fixed-point math with a wider integer.
    //
    // Our raw midi note values need a bit-depth of 19 to perfectly represent the 0.125
    // decimal carries (1/8 == 3 extra bits). This makes a semitone exactly 4369 wide.
    // This value is also larger than our semitone bend value of 4096, so 19-bits has
    // enough precision for both inputs.
    note = constrain(note, MIN_MIDI_NOTE, MAX_MIDI_NOTE);
    bend = constrain(bend, MIDI_PITCHBEND_MIN, MIDI_PITCHBEND_MAX);

    constexpr uint32_t SEMITONE = 4369;  // 546.125 DAC steps * 8
    constexpr uint32_t WIDE_PITCH_MAX = ((uint32_t(0b1) << 19) - 1);
    uint32_t wide_pitch = (note - MIN_MIDI_NOTE) * SEMITONE;  // 19-bits, range [0, 524287]
    const int32_t wide_bend = map(bend,
                                  // from
                                  MIDI_PITCHBEND_MIN, MIDI_PITCHBEND_MAX,
                                  // to
                                  SEMITONE * -BEND_SEMITONES, SEMITONE * BEND_SEMITONES);
    // wide_bend might be negative, so clamp pitch at zero to prevent underflow.
    // Overflow is prevented simply because we're only using 19 bits of a
    // 32 bit type, and we have a min() below.
    if ((wide_bend < 0) && (abs(wide_bend) > wide_pitch)) {
        wide_pitch = 0;
    } else {
        wide_pitch += wide_bend;
    }

    // Round the value to the nearest 16-bit value for minimal error
    if ((wide_pitch & 0b111) > 3) {
        wide_pitch += 0b1000;
    }
    // Clamp to 19-bit max value after the round (thankfully we're working in a 32-bit type)
    wide_pitch = min(wide_pitch, WIDE_PITCH_MAX);
    return wide_pitch >> 3;  // chop off the 3 LSB to range back into 16-bits for DAC output
}

uint16_t compute_dac_velocity(byte velocity) {
    return seven_to_ten_bit(velocity);
}

// Breath handling

// Constants used by this function
constexpr unsigned long BREATH_SAMPLE_PERIOD_MS = 1;
const Array<PWLPoint, 11> BREATH_CURVE({
    // Linearly interpolated control points of the form:
    //   {input, output}
    // with a possible value range of:
    //   [0, 1023] (10-bits)

    // This curve was sampled from a VL1 synthesizer by issuing a linear ramp
    // of breath CC's and observing the linear amplitude of the output.
    PWLPoint{0, 0},
    PWLPoint{8, 11},
    PWLPoint{17, 64},
    PWLPoint{25, 103},
    PWLPoint{41, 174},
    PWLPoint{73, 246},
    PWLPoint{145, 342},
    PWLPoint{323, 528},
    PWLPoint{484, 656},
    PWLPoint{709, 848},
    PWLPoint{1023, 1023},
});

// States used by this function
unsigned long last_breath_ms = 0;
MovingAverage breath_smoothing(50 /* Window Size */);
SlewDown slew_down(2 /* Slew Divisor */);

// Note: unlike the other midi-to-DAC converter functions,
// the one for breath must be called every loop for the filtering/smoothing to work.
uint16_t compute_dac_breath(int breath) {
    // Compute smoothed breath using a rolling average. Note that we advance the sliding window
    // in the loop() function because the controller only sends CC2 on changes in the breath value,
    // so we always insert the latest value.
    if (subtract_millis(now_ms, last_breath_ms) < BREATH_SAMPLE_PERIOD_MS) {
        return;
    }
    last_breath_ms = now_ms;

    // Re-range from MIDI's [0,127] to the DACs [0,1023]
    breath = seven_to_ten_bit(breath);
    // Smooth out the fluttering noise. This is more effective when done before expanding to 10-bit
    breath = breath_smoothing(breath);
    // Apply sensitivity curve
    breath = apply_curve(breath, BREATH_CURVE);
    // Slew-down to prevent hard breath releases from popping
    breath = slew_down(breath);

    return breath;
}


//
// Main Arduino API
//

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

    MIDI.setHandleMessage(handleMesssage);
    MIDI.setHandleNoteOn(handleNoteOn);
    MIDI.setHandleNoteOff(handleNoteOff);
    MIDI.setHandleControlChange(handleControlChange);
    MIDI.setHandlePitchBend(handlePitchBend);
    MIDI.begin(MIDI_CHANNEL_OMNI);
}

// Previous DAC output values (to persist outputs even when no note is pressed)
uint16_t dac_pitch = 0;
uint16_t dac_velocity = 0;
uint16_t dac_breath = 0;

void loop() {
    now_ms = millis();
    MIDI.read(midi_channel);  // Runs callbacks

#if TEST_MODE
    update_dacs(65535, 1023, 1023);
    digitalWrite(GATE, HIGH);
    delay(10);
    run_midi_act_led();
    return;
#endif  // TEST_MODE

    // Always run breath computations, this has time-based smoothing in it.
    dac_breath = compute_dac_breath(midi_breath);

    // Run on-note-change computations
    if (!midi_notes.empty()) {
        dac_pitch = compute_dac_pitch(midi_notes.back().note, midi_bend);
        dac_velocity = compute_dac_velocity(midi_notes.back().velocity);
    }  // else, leave DAC outputs wherever they are

    update_dacs(dac_pitch,      // LTC
                dac_breath,     // MCP_A
                dac_velocity);  // MCP_B

    digitalWrite(GATE, (midi_notes.empty() ? LOW : HIGH));

    run_midi_act_led();
}
