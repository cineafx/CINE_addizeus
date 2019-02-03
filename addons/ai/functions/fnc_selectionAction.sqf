#include "script_component.hpp"
/*
 * Author: cineafx
 * Selection action for Hunter Ai
 *
 * Arguments:
 * none
 *
 * Return Value:
 * [_groups, _nearestdist]
 *
 * Example:
 * [] call CINE_addizeus_ai_fnc_selectionAction
 *
 * Public: [No]
 */


_groups = [];
if (isNull (_this select 1)) then  {
  _units = ["units"] call Achilles_fnc_SelectUnits;
  {
    _groups pushBackUnique (group _x);
  } forEach _units;
} else {
  _groups = [group (_this select 1)];
};

private _dialogResult = [
  "Set search distance",
  [
    ["Search distance", "", "750"]
  ]
] call Ares_fnc_showChooseDialog;

if (_dialogResult isEqualTo []) exitWith{};
_dialogResult params ["_nearestdist"];
_nearestdist = parseNumber _nearestdist;

[_groups, _nearestdist]
