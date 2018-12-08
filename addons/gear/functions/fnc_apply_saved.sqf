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
  _gearLeader = profileNamespace getVariable [QVAR(gearLeader), []];
  _gearAT = profileNamespace getVariable [QVAR(gearAT), []];
  _gearAA = profileNamespace getVariable [QVAR(gearAA), []];
  _gearAR = profileNamespace getVariable [QVAR(gearAR), []];
  _gearDefault = profileNamespace getVariable [QVAR(gearDefault), []];

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
  profileNamespace setVariable [QVAR(gearLeader), _gearLeader];
  profileNamespace setVariable [QVAR(gearAT), _gearAT];
  profileNamespace setVariable [QVAR(gearAA), _gearAA];
  profileNamespace setVariable [QVAR(gearAR), _gearAR];
  profileNamespace setVariable [QVAR(gearDefault), _gearDefault];

  {
    systemChat str _x;
  } forEach _dialogResult;

  {
    /* TODO */

  } forEach _units;

  ["Applied module"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;
