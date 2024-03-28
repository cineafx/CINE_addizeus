#include "script_component.hpp"

params["_units"];


private _unitsOnFoot = [];
private _vehicles = [];
{
  // Don't kill curators
  if (side _x == sideLogic) then { continue; };

  // Vehicles
  if (_x isKindOf "AllVehicles" and !(_x isKindOf "Man")) then {
    _vehicles pushBackUnique _x;
    continue;
  };

  // Infantry not inside a vehicle
  if (_x == vehicle _x && _x isKindOf "Man") then {
    _unitsOnFoot pushBackUnique _x;
    continue;
  };

  // else
  // All the other stuff we don't care about like buildings and objects.
  // Most importanlty infantry inside a vehicle. We are already neutralizing the vehicle itself.

} forEach _units;

{
  [{
    _this call BIS_fnc_neutralizeUnit;
  }, _x, random 1] call CBA_fnc_waitAndExecute;
} forEach _vehicles;

{
  [{
    _this call BIS_fnc_neutralizeUnit;
  }, _x, random 3] call CBA_fnc_waitAndExecute;
} forEach _unitsOnFoot;

true
