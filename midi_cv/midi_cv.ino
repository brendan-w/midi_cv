
#include <SPI.h>

#include "src/Array/src/Array.h"  // https://github.com/janelia-arduino/Array because I miss the STL too much
#include "src/Arduino_Endian/src/endian.h"  // https://github.com/lathoub/Arduino_Endian

const int MCP_LDAC = 9;
const Array<int, 4> CHANNEL_SELECTOR_SWITCH_PINS({A0, A1, A2, A3});

// SPI protocol for the daisy-chained LTC1655IN8 and MCP4812 DACs. They each have 16-bit shift
// registers, so this struct contains back-to-back commands to fill out the total 32 bits of
// configuration. The MCP4812 command is placed first in the struct, because it is at the end
// of the shift register chain. Note that the MCP4812 can also only update one channel at a time,
// so it takes two of these commands to update all three outputs. This is slightly inefficient
// (we're updating the LTC twice), but not noticable when running at >= 1MHz baudrates.
struct DACCommand {
    // Command for the MCP4812
    // ----------------------------------
    uint8_t mcp_ab_select:1;
    static constexpr uint8_t MCP_DAC_A = 0;
    static constexpr uint8_t MCP_DAC_B = 1;

    uint8_t _:1;  // unused

    uint8_t mcp_gain_select:1;
    static constexpr uint8_t MCP_GAIN_2X = 0;
    static constexpr uint8_t MCP_GAIN_1X = 1;

    uint8_t mcp_output_shutdown:1;
    static constexpr uint8_t MCP_OUTPUT_ACTIVE = 1;
    static constexpr uint8_t MCP_OUTPUT_SHUTDOWN = 0;

    uint16_t mcp_value:10;

    uint8_t __:2;  // unused

    // Command for the LTC1655IN8
    // ----------------------------------
    uint16_t ltc_value;
} __attribute__((packed));

static_assert(sizeof(DACCommand) == 4);


void update_dacs(uint16_t ltc, uint16_t mcp_a, uint16_t mcp_b) {
    // Clamp the 16-bit integers for the MCP4812 to 10-bits
    mcp_a = min(mcp_a, 1023);
    mcp_b = min(mcp_b, 1023);

    DACCommand command = {
        mcp_ab_select: DACCommand::MCP_DAC_A,
        mcp_gain_select: DACCommand::MCP_GAIN_2X,
        mcp_output_shutdown: DACCommand::MCP_OUTPUT_ACTIVE,
        mcp_value: mcp_a,
        ltc_value: htobe16(ltc),
    };

    // Slow down the SPI clock to <= 500khz
    SPISettings settings(500000, MSBFIRST, SPI_MODE0);
    SPI.beginTransaction(settings); // Configures SPI and disables interrupts

    digitalWrite(SS, LOW);
    SPI.transfer(reinterpret_cast<uint8_t*>(&command), sizeof(command));
    digitalWrite(SS, HIGH);

    // Populate the MCP's B-side register
    command.mcp_ab_select = DACCommand::MCP_DAC_B;
    command.mcp_value = mcp_b;
    // Leave everything else the same

    // digitalWrite() is slow enough that its actually been 5usec since we set it high
    digitalWrite(SS, LOW);
    SPI.transfer(reinterpret_cast<uint8_t*>(&command), sizeof(command));
    digitalWrite(SS, HIGH);

    // Trigger the MCP to load/output the new value
    digitalWrite(MCP_LDAC, LOW);
    digitalWrite(MCP_LDAC, HIGH);

    SPI.endTransaction(); // re-enables interrupts
}






void setup() {
    pinMode(SS, OUTPUT);
    pinMode(MCP_LDAC, OUTPUT);
    digitalWrite(SS, HIGH);
    digitalWrite(MCP_LDAC, HIGH);
    for (int pin : CHANNEL_SELECTOR_SWITCH_PINS) {
        pinMode(pin, INPUT_PULLUP);
    }

    SPI.begin();
}

uint16_t ltc_value = 0;
// uint16_t mcp_a_value = 0;
// uint16_t mcp_b_value = 0;

void loop() {
    update_dacs(ltc_value, 0, 0);
    delay(100);
    ltc_value++;
}
