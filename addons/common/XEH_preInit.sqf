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

  //check compabilty
  if(!(isNil QGVAR(radio_keep_LR))) then {
    switch(GVAR(radio_LR)) do {
      //Keep all
      case (-1) : {
        GVAR(radio_keep_LR) = 7;
      };
      //blue
      case (0) : {
        GVAR(radio_keep_LR) = 1;
      };
      //red
      case (1) : {
        GVAR(radio_keep_LR) = 2;
      };
      //independent
      case (2) : {
        GVAR(radio_keep_LR) = 4;
      };
      //remove all
      case (3) : {
        GVAR(radio_keep_LR) = 0;
      };
      //automatic
      case (4) : {
        GVAR(radio_keep_LR) = 8;
      };
    };
    GVAR(radio_LR) = nil;
  };

  //ISNILS(GVAR(radio_keep_SW), GVAR(radio_SW));
  //ISNILS(GVAR(radio_keep_LR), GVAR(radio_LR));

  [
    QGVAR(radio_keep_SW),
    "LIST",
    ["Keep SW radio", "Which TFAR shortwave radio to keep"],
    ["CINE Additional Zeus","Radios"],
    [[7,1,2,4, 3,5,6, 0,8],[ "Keep all",
                              "Keep blufor only",
                              "Keep opfor only",
                              "Keep independent only",

                              "Keep blufor and opfor",
                              "Keep blufor and independent",
                              "Keep opfor and independent",

                              "Remove all",
                              "Keep side with most players"
                            ], 0],
    2,
    {call FUNC(set_zeus_radios)}
  ] call CBA_settings_fnc_init;

  [
    QGVAR(radio_keep_LR),
    "LIST",
    ["Keep LR radio", "Which TFAR longrange radio to keep"],
    ["CINE Additional Zeus","Radios"],
    [[7,1,2,4, 3,5,6, 0,8],[ "Keep all",
                              "Keep blufor only",
                              "Keep opfor only",
                              "Keep independent only",

                              "Keep blufor and opfor",
                              "Keep blufor and independent",
                              "Keep opfor and independent",

                              "Remove all",
                              "Keep side with most players"
                            ], 0],
    2,
    {call FUNC(set_zeus_radios)}
  ] call CBA_settings_fnc_init;
};
