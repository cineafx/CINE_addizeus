#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a module to apply the predefine loadouts to the zeus module menu.
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

["CINE Gear", "Apply predefined gear",
{

  //select units
  _units = [];
  if (isNull (_this select 1)) then {
    _units = ["units"] call Achilles_fnc_SelectUnits;
  } else {
    _units = [_this select 1];
  };

  //get previously used loadouts
  _gearDefault = profileNamespace getVariable [QGVAR(gearDefault), "[]"];
  _gearLeader = profileNamespace getVariable [QGVAR(gearLeader), "[]"];
  _gearAT = profileNamespace getVariable [QGVAR(gearAT), "[]"];
  _gearAA = profileNamespace getVariable [QGVAR(gearAA), "[]"];
  _gearAR = profileNamespace getVariable [QGVAR(gearAR), "[]"];

  //apply the loadout to all units
  {
    //select the loadout to use
    _loadoutString = _dialogResult select ([typeOf _x] call FUNC(unitType));
    //remove spaces from the _loadoutString so parseSimpleArray doesn't fail
    _loadoutString = _loadoutString splitString " " joinString "";
    _x setUnitLoadout (parseSimpleArray _loadoutString);
  } forEach _units;

  ["Loadouts applied"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;
