#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Hunter Ai aggressive version 2.3 to the zeus module menu.
 * Automatically detects Ares Achilles and ZEN.
 *
 * Arguments:
 * nothing
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_moduleHunterAiAggressive
 *
 * Public: [No]
 */

if (isClass (configFile >> 'cfgPatches' >> "achilles_modules_f_achilles")) then {
  [
    "CINE AI",
    "Hunter AI: Aggressive",
    {
      params ["_pos", "_attachedObject"];

      _seekRange = GVAR(hunterAi_seek_range);

      private _dialogResult = [
        "Set search distance",
        [
          ["Search distance", "", "400"]
        ]
      ] call Ares_fnc_showChooseDialog;
      if !(_dialogResult isEqualTo []) then {
        _dialogResult params ["_nearestdist"];
        _seekRange = parseNumber _nearestdist;
      };

      [_attachedObject, DFUNC(hunterAi), "Hunter Ai enabled", ["AGGRESSIVE_PUSH", _seekRange], "Units"] call EFUNC(common,moduleHandler);
    }
  ] call Ares_fnc_RegisterCustomModule;
};

if (isClass (configFile >> 'cfgPatches' >> "zen_modules")) then {
  [
    "CINE AI",
    "Hunter AI: Aggressive",
    {
      params ["_pos", "_attachedObject"];

      [_attachedObject, DFUNC(hunterAi), "Hunter Ai enabled", ["AGGRESSIVE_PUSH", GVAR(hunterAi_seek_range)], "Units"] call EFUNC(common,moduleHandler);
    },
    "\a3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa"
  ] call zen_custom_modules_fnc_register;
};

true;
