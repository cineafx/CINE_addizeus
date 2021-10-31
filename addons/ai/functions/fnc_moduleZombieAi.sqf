#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Zombie Ai 1.0 to the zeus module menu.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_moduleZombieAi
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE AI",
    "Zombie AI",
    {
      params ["_pos", "_attachedObject"];

      _seekRange = GVAR(zombieAi_seek_range);

      private _dialogResult = [
        "Set search distance",
        [
          ["Search distance", "", "200"]
        ]
      ] call Ares_fnc_showChooseDialog;
      if !(_dialogResult isEqualTo []) then {
        _dialogResult params ["_nearestdist"];
        _seekRange = parseNumber _nearestdist;
      };

      [_attachedObject, DFUNC(zombieAi), "Zombie Ai enabled", [GVAR(zombieAi_seek_range)], "Units"] call EFUNC(common,moduleHandler);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE AI",
    "Zombie AI",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(zombieAi), "Zombie Ai enabled", [GVAR(zombieAi_seek_range)], "Units"] call EFUNC(common,moduleHandler);
    },
    "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
