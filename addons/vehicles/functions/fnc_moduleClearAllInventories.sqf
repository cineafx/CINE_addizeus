#include "script_component.hpp"
/*
 * Author: cineafx
 * Zeus module handler for clearing of all vehicles inventories at once.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_moduleClearAllInventories
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE vehicles",
    "Clear all vehicles inventories",
    {
      [vehicles] call FUNC(clearInventory);
      [objNull, "Cleared all vehicles inventories"] call bis_fnc_showCuratorFeedbackMessage;
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE vehicles",
    "Clear all vehicles inventories",
    {
      [vehicles] call FUNC(clearInventory);
      [objNull, "Cleared all vehicles inventories"] call bis_fnc_showCuratorFeedbackMessage;
    },
    "\a3\ui_f\data\igui\cfg\Actions\unloadAllVehicles_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
