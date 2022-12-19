// Because apparently templates don't work in the .ino file...

#include "src/Array/src/Array.h"

// Piece-wise-linear control point
struct PWLPoint {
    uint16_t input;
    uint16_t output;
};

/**
 * Applies the given PWL curve to the input value.
 * Preconditions:
 *   - curve must be sorted by input value
 *   - curve must have points at the start/end of the possible input range for the input value
 */
template<size_t MAX_SIZE>
uint16_t apply_curve(uint16_t value, const Array<PWLPoint, MAX_SIZE>& curve) {
    // Find the appropriate segment of the curve
    return value;
}
