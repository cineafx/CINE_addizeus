#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

/* SETTINGS */

[
  QGVAR(zeus_camera_height),
  "EDITBOX",
  ["Zeus camera height", "Number between 2000 and 40000"],
  ["CINE Additional Zeus","General"],
  "2000",
  2,
  {call FUNC(update_zeus_camera_height)}
] call CBA_settings_fnc_init;

[
  QGVAR(debug),
  "CHECKBOX",
  ["Show debug output", "Shows systemChat messages with debug infomations"],
  ["CINE Additional Zeus","Debug"],
  false,
  2,
  {}
] call CBA_settings_fnc_init;

if (isClass (configFile >> 'cfgPatches' >> "TFAR_core")) then {
  /*
  [
    QGVAR(radio_SW),
    "LIST",
    ["Keep SW radio", "Which TFAR shortwave radio to keep"],
    ["CINE Additional Zeus","Radios"],
    [[-1,0,1,2,3], ["Keep all", "Keep blufor only", "Keep opfor only", "Keep independent only", "Remove all"], 0],
    2,
    {call FUNC(set_zeus_radios)}
  ] call CBA_settings_fnc_init;*/

  [
    QGVAR(radio_LR),
    "LIST",
    ["Keep LR radio", "Which TFAR longrange radio to keep"],
    ["CINE Additional Zeus","Radios"],
    [[-1,0,1,2,3,4], ["Keep all", "Keep blufor only", "Keep opfor only", "Keep independent only", "Remove all", "Keep side with most players"], 0],
    2,
    {call FUNC(set_zeus_radios)}
  ] call CBA_settings_fnc_init;
};
