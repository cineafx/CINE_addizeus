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

["CINE Gear", "Predefined gear: Set",
{
  [] call FUNC(setSaved);

  [objNull, "Loadouts saved"] call bis_fnc_showCuratorFeedbackMessage;
}] call Ares_fnc_RegisterCustomModule;

true;
