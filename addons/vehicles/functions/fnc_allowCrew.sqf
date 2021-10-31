#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which forces AI to stay in immobile vehicles.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_allowCrew
 *
 * Public: [No]
 */

if (isNil QGVAR(allowCrew_EH)) then {
  GVAR(allowCrew_EH) = [{
    {
        _x allowCrewInImmobile true;
    } forEach vehicles;
  }, 15, []] call CBA_fnc_addPerFrameHandler;
  [objNull, "Enabled: Allow crew in immobile vehicles"] call bis_fnc_showCuratorFeedbackMessage;
} else {
  [GVAR(allowCrew_EH)] call CBA_fnc_removePerFrameHandler;
  GVAR(allowCrew_EH) = nil;
  [objNull, "Disabled: Allow crew in immobile vehicles"] call bis_fnc_showCuratorFeedbackMessage;
};

true;
