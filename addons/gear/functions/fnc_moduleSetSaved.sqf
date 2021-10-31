#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds set gear module to the zeus module menu.
 * Automatically detects Ares Achilles and ZEN.
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


if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE Gear",
    "Set saved loadout",
    {
      createDialog QGVAR(RscSetSaved);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE Gear",
    "Set saved loadout",
    {
      createDialog QGVAR(RscSetSaved);
    },
    //"\a3\ui_f\data\igui\cfg\Actions\gear_ca.paa"
    "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
