#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Hunter Ai version 2.3 to the zeus module menu.
 * TODO: add more precise description
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_ai_fnc_HunterAi2_3
 *
 * Public: [No]
 */

["CINE AI", "Hunter AI: Tactical movement",
{
  _selectionParams = _this call FUNC(selectionAction);
  _selectionParams params ["_groups", "_nearestdist"];
  [_groups, _nearestdist, "TACTICAL"] call FUNC(HunterAi2_3);

  ["Applied module"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;

["CINE AI", "Hunter AI: Aggressive push",
{
  _selectionParams = _this call FUNC(selectionAction);
  _selectionParams params ["_groups", "_nearestdist"];
  [_groups, _nearestdist, "AGGRESSIVE_PUSH"] call FUNC(HunterAi2_3);

  ["Applied module"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;
