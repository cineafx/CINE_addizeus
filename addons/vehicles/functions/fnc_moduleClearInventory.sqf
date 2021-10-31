#include "script_component.hpp"
/*
 * Author: cineafx
 * Zeus module handler for clearing a selected vehicles inventory.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_moduleClearInventory
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE vehicles",
    "Clear vehicle inventory (selection)",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(clearInventory), "Inventory cleared.",[], "Vehicles"] call EFUNC(common,moduleHandler);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE vehicles",
    "Clear vehicle inventory (selection)",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(clearInventory), "Inventory cleared.",[], "Vehicles"] call EFUNC(common,moduleHandler);
    },
    "\a3\ui_f\data\igui\cfg\Actions\unloadVehicle_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
