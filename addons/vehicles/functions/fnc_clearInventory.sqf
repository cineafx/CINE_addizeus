#include "script_component.hpp"
/*
 * Author: cineafx
 * Clearing the inventory of vehicles. Only vehicles are affected.
 *
 * Arguments:
 * 0: Vehicles to clear the inventory of. <Array> (default: [])
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [_units] call CINE_addizeus_vehicles_fnc_clear_all_inventories
 *
 * Public: [No]
 */

params [["_units", []]];

TRACE_1("params",_units);

{
  if (_x isKindOf "AllVehicles") then {
    clearWeaponCargoGlobal _x;
    clearMagazineCargoGlobal _x;
    clearItemCargoGlobal _x;
    clearBackpackCargoGlobal _x;
  }
} forEach _units;

true;
