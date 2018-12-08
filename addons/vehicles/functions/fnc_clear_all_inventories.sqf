#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which allows for clearing of all vehicles inventories at once.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_clear_all_inventories
 *
 * Public: [No]
 */

["CINE Vehicles", "Clear all vehicles inventories", {
    {
        clearWeaponCargoGlobal _x;
        clearMagazineCargoGlobal _x;
        clearItemCargoGlobal _x;
        clearBackpackCargoGlobal _x;
    } forEach vehicles;
}] call Ares_fnc_RegisterCustomModule;
