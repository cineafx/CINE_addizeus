#include "script_component.hpp"
/*
 * Author: cineafx
 * Zeus module handler for clearing of all vehicles inventories at once.
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
 * [] call CINE_addizeus_vehicles_fnc_clear_all_inventories
 *
 * Public: [No]
 */

params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

[vehicles] call FUNC(clearInventory);
[objNull, "Cleared all vehicles inventories"] call bis_fnc_showCuratorFeedbackMessage;

if (!isNull _logic) then {
    deleteVehicle _logic;
};

true;
