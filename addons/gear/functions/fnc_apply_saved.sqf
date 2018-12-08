#include "script_component.hpp"
/*
 * Author: cineafx
 * [Description] TODO
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_apply_saved
 *
 * Public: [No]
 */

["CINE Gear", "Predefined gear",
{

  _units = [];
  if (isNull (_this select 1)) then {
    _units = ["units"] call Achilles_fnc_SelectUnits;
  } else {
    _units = [_this select 1];
  };

  //get previously used loadouts
  _gearLeader = profileNamespace getVariable [QGVAR(gearLeader), []];
  _gearAT = profileNamespace getVariable [QGVAR(gearAT), []];
  _gearAA = profileNamespace getVariable [QGVAR(gearAA), []];
  _gearAR = profileNamespace getVariable [QGVAR(gearAR), []];
  _gearDefault = profileNamespace getVariable [QGVAR(gearDefault), []];

  //Create dialog
  private _dialogResult = [
    "Set Gear",
    [
      ["Leader", "", _gearLeader],
      ["AT", "", _gearAT],
      ["AA", "", _gearAA],
      ["AR", "", _gearAR],
      ["Default", "", _gearDefault]
    ]
  ] call Ares_fnc_showChooseDialog;

  //did the dialog return empty
  if (_dialogResult isEqualTo []) exitWith{};
  //_dialogResult is an array of string. This converts the strings into arrays.
  _dialogResult apply {parseSimpleArray _x};
  _dialogResult params ["_gearLeader", "_gearAT", "_gearAA", "_gearAR", "_gearDefault"];

  //save loadouts to be able to use it later
  profileNamespace setVariable [QGVAR(gearLeader), _gearLeader];
  profileNamespace setVariable [QGVAR(gearAT), _gearAT];
  profileNamespace setVariable [QGVAR(gearAA), _gearAA];
  profileNamespace setVariable [QGVAR(gearAR), _gearAR];
  profileNamespace setVariable [QGVAR(gearDefault), _gearDefault];

  {
    systemChat str _x;
  } forEach _dialogResult;

  {
    /* TODO */

  } forEach _units;

  ["Applied module"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;
