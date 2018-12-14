#include "script_component.hpp"
/*
 * Author: cineafx
 * Set predefined loadouts.
 * The dialog will take "getUnitLoadout" formatted arrays
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_set_saved
 *
 * Public: [No]
 */

//get previously used loadouts
_gearDefault = profileNamespace getVariable [QGVAR(gearDefault), "[]"];
_gearLeader = profileNamespace getVariable [QGVAR(gearLeader), "[]"];
_gearAT = profileNamespace getVariable [QGVAR(gearAT), "[]"];
_gearAA = profileNamespace getVariable [QGVAR(gearAA), "[]"];
_gearAR = profileNamespace getVariable [QGVAR(gearAR), "[]"];

//Create dialog to allow entering of the loadout array
private _dialogResult = [
  "Set Gear",
  [
    ["Default", "", _gearDefault],
    ["Leader", "", _gearLeader],
    ["AT", "", _gearAT],
    ["AA", "", _gearAA],
    ["AR", "", _gearAR]
  ]
] call Ares_fnc_showChooseDialog;

//did the dialog return empty
if (_dialogResult isEqualTo []) exitWith{};
_dialogResult params ["_gearDefault", "_gearLeader", "_gearAT", "_gearAA", "_gearAR"];

//save loadouts to be able to use them later
profileNamespace setVariable [QGVAR(gearDefault), _gearDefault];
profileNamespace setVariable [QGVAR(gearLeader), _gearLeader];
profileNamespace setVariable [QGVAR(gearAT), _gearAT];
profileNamespace setVariable [QGVAR(gearAA), _gearAA];
profileNamespace setVariable [QGVAR(gearAR), _gearAR];

true;
