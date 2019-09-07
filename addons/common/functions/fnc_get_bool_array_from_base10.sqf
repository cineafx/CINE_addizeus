#include "script_component.hpp"
/*
 * Author: cineafx
 * Convert an integer to an array filled with with booleans
 * The return is in Big-endian format!
 * 6 --> (1*4 + 1*2 + 0*1) would return [false, true, true]
 *
 * Arguments:
 * 0: input <NUMBER>
 * 1: _ouputSize <NUMBER>
 *
 * Return Value:
 * Converted bool array <ARRAY>
 *
 * Example:
 * [4+2+1] call CINE_addizeus_common_fnc_get_bool_array_from_base10
 *
 * Public: [No]
 */

params["_quotient", "_outputSize"];
private _remainder;
private _array = [];

while {_quotient > 0} do {
  _remainder = _quotient % 2;
  _quotient = floor (_quotient / 2);
  _array pushBack _remainder;
};
for "_i" from count _array + 1 to _outputSize do {
  _array pushBack 0;
};
//reverse _array;

_array apply { _x != 0 };
