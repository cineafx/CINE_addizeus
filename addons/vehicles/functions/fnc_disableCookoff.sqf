#include "script_component.hpp"
/*
 * Author: cineafx
 * Zeus module handler for disabling ACE cookoff missione wide.
 * !!! Currently there is no way to turn it back on through a module !!!
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
 * [] call CINE_addizeus_vehicles_fnc_moduleDisableCookoff
 *
 * Public: [No]
 */
missionNamespace setVariable ["ace_cookoff_enable",false];
missionNamespace setVariable ["ace_cookoff_enableAmmoCookoff",false];
[objNull, "Disabled ACE Cookoff."] call bis_fnc_showCuratorFeedbackMessage;

true;
