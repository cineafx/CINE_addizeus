#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a module to apply the predefine loadouts to the zeus module menu.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_apply_saved
 *
 * Public: [No]
 */

["CINE Gear", "Predefined gear: Apply",
{

  //select units
  _units = [];
  if (isNull (_this select 1)) then {
    _units = ["units"] call Achilles_fnc_SelectUnits;
  } else {
    _units = [_this select 1];
  };

  [_units] call FUNC(apply_saved);

  [objNull, "Loadouts applied"] call bis_fnc_showCuratorFeedbackMessage;
}] call Ares_fnc_RegisterCustomModule;
