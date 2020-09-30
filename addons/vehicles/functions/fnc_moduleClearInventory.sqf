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

[_this, DFUNC(clearInventory), "Inventory cleared.",[], "Vehicles"] call EFUNC(common,moduleHandler);

true;
