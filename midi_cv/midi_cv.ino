
#include <SPI.h>

#include "src/Array/src/Array.h"  // https://github.com/janelia-arduino/Array because I miss the STL too much

const Array<int, 4> CHANNEL_SELECTOR_SWITCH_PINS({A0, A1, A2, A3});

// SPI Protocol for the daisy-chained LTC1655IN8 and MCP4812 DACs
struct DACCommand {
    // Command for the MCP4812
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
    uint16_t ltc_value;
} __attribute__((packed));

static_assert(sizeof(DACCommand) == 4);


void update_dacs(uint16_t ltc, uint16_t mcp_a, uint16_t mcp_b) {
    DACCommand command = {
        mcp_ab_select: DACCommand::MCP_DAC_A,
        mcp_gain_select: DACCommand::MCP_GAIN_2X,
        mcp_output_shutdown: DACCommand::MCP_OUTPUT_ACTIVE,
        mcp_value: mcp_a,
        ltc_value: ltc,
    };

    // Slow down the SPI clock to <= 500khz
    SPISettings settings(500000, MSBFIRST, SPI_MODE0);
    SPI.beginTransaction(settings); // Configures SPI and disables interrupts
    SPI.transfer(reinterpret_cast<uint8_t*>(&command), sizeof(command));
    command.mcp_ab_select = DACCommand::MCP_DAC_B;
    command.mcp_value = mcp_b;
    // Leave everything else the same
    SPI.transfer(reinterpret_cast<uint8_t*>(&command), sizeof(command));    
    SPI.endTransaction(); // re-enables interrupts
}






void setup() {
    for (int pin : CHANNEL_SELECTOR_SWITCH_PINS) {
        pinMode(pin, INPUT_PULLUP);
    }

    SPI.begin();
}

void loop() {

}
