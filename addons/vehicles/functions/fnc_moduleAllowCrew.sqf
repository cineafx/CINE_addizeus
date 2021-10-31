#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which forces AI to stay in immobile vehicles.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_modulellowCrew
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE vehicles",
    "Allow crew in immobile vehicles (toggle) (achilles)",
    {
      [] call FUNC(allowCrew);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE vehicles",
    "Allow crew in immobile vehicles (toggle) (zen)",
    {
      [] call FUNC(allowCrew);
    },
    "\a3\ui_f\data\igui\cfg\Actions\getout_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
