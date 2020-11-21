#include "script_component.hpp"
/*
 * Author: cineafx
 *
 * Arguments:
 * 0: The Module Logic <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [objNull, [], true] call CINE_addizeus_gear_fnc_moduleZombieAi
 *
 * Public: [No]
 */

[_this, DFUNC(zombieAi), "Zombie Ai enabled", [GVAR(zombieAi_seek_range)], "Units"] call EFUNC(common,moduleHandler);

true;
