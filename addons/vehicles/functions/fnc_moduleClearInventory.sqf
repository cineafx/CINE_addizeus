#include "script_component.hpp"
/*
 * Author: cineafx
 * Zeus module handler for clearing a selected vehicles inventory.
 *
 * Arguments:
 * 0: Module logic. <Logic> (default: null)
 * 1: Attached units. <Array> (default: null)
 * 2: Activated. <Boolean> (default: null)
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_clear_inventory
 *
 * Public: [No]
 */

params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

if (!_activated) exitWith {};
//if (!isServer) exitWith {};

private _unit = attachedTo _logic;

if (!isNull _logic) then {
    deleteVehicle _logic;
};

if (!isNull _unit) exitWith {
    [[_unit]] call FUNC(clearInventory);
    [objNull, "Inventory cleared."] call bis_fnc_showCuratorFeedbackMessage;
    playSound "FD_Start_F";
};

["units"] call EFUNC(common,selectUnits);
[{
  // Wait for done
  !isNil QEGVAR(common,selectedUnits)
},{
  // Do stuff if done
  [EGVAR(common,selectedUnits)] call FUNC(clearInventory);
  [objNull, "Inventory cleared."] call bis_fnc_showCuratorFeedbackMessage;
  playSound "FD_Start_F";

}] call CBA_fnc_waitUntilAndExecute;

true;
