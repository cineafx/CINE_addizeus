#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Unarmed becomes captive module to the zeus module menu.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_moduleUnarmedBecomesCaptive
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE AI",
    "Unarmed becomes captive",
    {
      [] call FUNC(unarmedBecomesCaptive);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE AI",
    "Unarmed becomes captive",
    {
      [] call FUNC(unarmedBecomesCaptive);
    },
    "\z\ace\addons\captives\UI\captive_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
