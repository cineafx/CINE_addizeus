#include "script_component.hpp"
/*
 * Author: cineafx
 * Disable the ai of a drivers of vehicles.
 *
 * Arguments:
 * 0: Vehicles to clear the inventory of. <Array> (default: [])
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [_units] call CINE_addizeus_vehicles_fnc_immobiliseVehicle
 *
 * Public: [No]
 */

params [["_units", []]];

TRACE_1("params",_units);

{
  if (_x isKindOf "AllVehicles") then {
    if !(isPlayer _x) then {
      (driver _x) disableAI "all";
      //(driver _x) setBehaviour "CARELESS";
    }
  }
} forEach _units;

true;
