#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which disables the ai of a driver.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_moduleImmobiliseVehicle
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE vehicles",
    "Immobilise vehicle (disable Driver AI)",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(immobiliseVehicle), "Immobilised vehicle.",[], "Vehicles"] call EFUNC(common,moduleHandler);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE vehicles",
    "Immobilise vehicle (disable Driver AI)",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(immobiliseVehicle), "Immobilised vehicle.",[], "Vehicles"] call EFUNC(common,moduleHandler);
    },
    "\a3\missions_f_oldman\Data\img\HoldActions\holdAction_follow_stop_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
