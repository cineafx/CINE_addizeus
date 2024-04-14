#include "script_component.hpp"
/*
 * Author: cineafx
 * Applies the predefine loadouts to all units given.
 *
 * Arguments:
 * 0: Units to apply the loadouts <Array> (default: [])
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_apply_saved
 *
 * Public: [No]
 */

params [["_units", [], [[objNull]] ]];

TRACE_1("applySavedUnits",_units);

//get previously used loadout
_gearDefault = profileNamespace getVariable [QGVAR(gearDefault), "[]"];
_gearLeader = profileNamespace getVariable [QGVAR(gearLeader), "[]"];
_gearAT = profileNamespace getVariable [QGVAR(gearAT), "[]"];
_gearAA = profileNamespace getVariable [QGVAR(gearAA), "[]"];
_gearAR = profileNamespace getVariable [QGVAR(gearAR), "[]"];

//create loadouts array to be able to use select later on
_loadouts = [_gearDefault, _gearLeader, _gearAT, _gearAA, _gearAR];

TRACE_5("loadout",_gearDefault,_gearLeader,_gearAT,_gearAA,_gearAR);

//apply the loadout to all units
{
  //select the loadout to use
  _loadoutString = _loadouts select ([typeOf _x] call FUNC(unitType));
  //remove spaces from the _loadoutString so parseSimpleArray doesn't fail
  _loadoutString = _loadoutString splitString " " joinString "";
  _loadoutBeginning = _loadoutString select [0, 3];
  if (_loadoutBeginning == "[[[") then {
    _x setUnitLoadout ((parseSimpleArray _loadoutString) # 0);
  } else {
    _x setUnitLoadout (parseSimpleArray _loadoutString);
  }
} forEach _units;

true;
