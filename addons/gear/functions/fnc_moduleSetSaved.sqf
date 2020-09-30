#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a module to set predefined loadouts to the zeus module menu.
 * The dialog will take "getUnitLoadout" formatted arrays
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_moduleSetSaved
 *
 * Public: [No]
 */

params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

createDialog QGVAR(RscSetSaved);

if (!isNull _logic) then {
    deleteVehicle _logic;
};

true;
