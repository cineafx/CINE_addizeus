#include "script_component.hpp"
/*
 * Author: cineafx
 * Zeus module handler for disabling ACE cookoff missione wide.
 * Automatically detects Ares Achilles and ZEN.
 * !!! Currently there is no way to turn it back on through a module !!!
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_moduleDisableCookoff
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE vehicles",
    "Globally disable ACE cookoff",
    {
      missionNamespace setVariable ["ace_cookoff_enable",false];
      missionNamespace setVariable ["ace_cookoff_enableAmmoCookoff",false];
      [objNull, "Disabled ACE Cookoff."] call bis_fnc_showCuratorFeedbackMessage;
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE vehicles",
    "Globally disable ACE cookoff",
    {
      missionNamespace setVariable ["ace_cookoff_enable",false];
      missionNamespace setVariable ["ace_cookoff_enableAmmoCookoff",false];
      [objNull, "Disabled ACE Cookoff."] call bis_fnc_showCuratorFeedbackMessage;
    },
    "\a3\ui_f\data\igui\cfg\Actions\Obsolete\ui_action_fire_put_down_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
