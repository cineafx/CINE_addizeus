#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;


/* SETTINGS */

[
  QGVAR(hunterAi_seek_range),
  "SLIDER",
  ["Hunter Ai seek radius", "Number above 0"],
  ["CINE Additional Zeus","Ai"],
  [0, 10000, 400, 0],
  2
] call CBA_settings_fnc_init;

[
  QGVAR(zombieAi_seek_range),
  "SLIDER",
  ["Zombie Ai seek radius", "Number above 0"],
  ["CINE Additional Zeus","Ai"],
  [0, 10000, 200, 0],
  2
] call CBA_settings_fnc_init;

[
  QGVAR(unarmedBecomesCaptive_requiredTime),
  "SLIDER",
  ["Unarmed becomes captive time", "Number above 0"],
  ["CINE Additional Zeus","Ai"],
  [0, 300, 60, 0],
  2
] call CBA_settings_fnc_init;

[
  QGVAR(unarmedBecomesCaptive_target),
  "LIST",
  "Unarmed unit type",
  ["CINE Additional Zeus","Ai"],
  [[0,1,2], ["All units", "Only players", "Only Ai"], 1],
  2
] call CBA_settings_fnc_init;
