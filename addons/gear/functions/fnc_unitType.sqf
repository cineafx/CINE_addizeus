#include "script_component.hpp"
/*
 * Author: cineafx
 * [Description]
 *
 * Arguments:
 * 0: unit <object>
 *
 * Return Value:
 * unitType <SCALAR>
 * 0: Default
 * 1: Leader
 * 2: AT
 * 3: AA
 * 4: AR
 *
 * Example:
 * [player] call CINE_addizeus_fnc_unitType
 *
 * Public: [No]
 */

params ["_unitType"];

_type = 0;

if (["AR", _unitType] call BIS_fnc_inString) then {
  _type = 4;
};
if (["AA", _unitType] call BIS_fnc_inString) then {
  _type = 3;
};
if (["AT", _unitType] call BIS_fnc_inString) then {
  _type = 2;
};
if (["SL", _unitType] call BIS_fnc_inString || ["TL", _unitType] call BIS_fnc_inString) then {
  _type = 1;
};

_type;
