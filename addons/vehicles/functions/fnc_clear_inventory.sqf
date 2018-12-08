#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which allows for clearing a selected vehicle.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_clear_inventory
 *
 * Public: [No]
 */

//clear inventory of vehicle unter cursor
["CINE Vehicles", "Clear vehicle inventory", {
     _unit = [_logic, false] call Ares_fnc_GetUnitUnderCursor;

    if (isNull _unit) exitWith {
        [localize "STR_NO_OBJECT_SELECTED"] call Ares_fnc_ShowZeusMessage;
        playSound "FD_Start_F";
    };

    _unit = vehicle _unit;

    if (!(_unit isKindOf "AllVehicles")) exitWith {
        ["Object is not a vehicle"] call Ares_fnc_ShowZeusMessage;
        playSound "FD_Start_F";
    };

    clearWeaponCargoGlobal _unit;
    clearMagazineCargoGlobal _unit;
    clearItemCargoGlobal _unit;
    clearBackpackCargoGlobal _unit;
}] call Ares_fnc_RegisterCustomModule;
