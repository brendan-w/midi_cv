// Because apparently templates don't work in the .ino file...

#include "src/Array/src/Array.h"

// Piece-wise-linear control point
struct PWLPoint {
    uint16_t input;
    uint16_t output;
};

/**
 * Applies the given PWL curve to the input value. Values that lie outside of any defined curve points will LERP to zero or maximum
 * Preconditions:
 *   - curve must be sorted by input value
 */
template<size_t MAX_SIZE>
uint16_t apply_curve(uint16_t value, const Array<PWLPoint, MAX_SIZE>& curve) {
    constexpr uint16_t MAX_VALUE = ~uint16_t(0);

    // Empty curve is a linear relationship
    if (curve.size() == 0) {
        return value;
    }

    // Find the appropriate segment of the curve. We could do something fancier like a binary
    // search, but realistically this list will never have more than ~10 entries in it. Keep it simple.
    size_t i = 0;
    while((i < curve.size()) && curve[i].input < value) {
        i++;
    }

    if (value == curve[i].input) {
        // Explicit on-point case in order to not have the LERP's below break on zero-input-range cases,
        // where the user *has* defined points at the extremes of the int values.
        return curve[i].output;
    } else if (i == curve.size()) {
        // If we fell out of the loop because the value given is past all of the control points given, the lerp to max
        return map(value, curve[i-1].input, MAX_VALUE, curve[i-1].output, MAX_VALUE);
    } else if (i == 0) {
        // If the first point in the list is already >= to the given value, then lerp from zero
        return map(value, 0, curve[i].input, 0, curve[i].output);
    }

    // else, we're between two control points in the curve
    const PWLPoint& upper_point = curve[i];
    const PWLPoint& lower_point = curve[i - 1];
    return map(value, lower_point.input, upper_point.input, lower_point.output, upper_point.output);
}
