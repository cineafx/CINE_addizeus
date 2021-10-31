#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds apply gear module to the zeus module menu.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_moduleApplySaved
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE Gear",
    "Apply saved loadout (achilles)",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(applySaved), "Loadouts applied", [], "Units"] call EFUNC(common,moduleHandler);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE Gear",
    "Apply saved loadout (zen)",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(applySaved), "Loadouts applied", [], "Units"] call EFUNC(common,moduleHandler);
    },
    "\a3\ui_f\data\igui\cfg\Actions\reammo_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
