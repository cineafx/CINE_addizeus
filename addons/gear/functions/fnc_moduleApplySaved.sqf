#include "script_component.hpp"
/*
 * Author: cineafx
 * Module function to apply the predefine loadouts to units.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_moduleApplySaved
 *
 * Public: [No]
 */

[{
  // Wait for done
  !isNil QEGVAR(common, selectedUnits)
},{
  // Do stuff if done
  systemChat str EGVAR(common, selectedUnits)
  [EGVAR(common, selectedUnits)] call FUNC(apply_saved);
  [objNull, "Loadouts applied"] call bis_fnc_showCuratorFeedbackMessage;

}] call CBA_fnc_waitUntilAndExecute;
["units"] call EFUNC(common, selectedUnits);

true;
