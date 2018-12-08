#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which disables ACE cookoff missione wide.
 * !!! Currently there is no way to turn it back on through a module !!!
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_disable_cook_off
 *
 * Public: [No]
 */

["CINE Vehicles", "Disable Cook-off", {
  missionNamespace setVariable ["ace_cookoff_enable",false];
  missionNamespace setVariable ["ace_cookoff_enableAmmoCookoff",false];
}] call Ares_fnc_RegisterCustomModule;
