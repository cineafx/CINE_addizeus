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
  [0, 10000, 350, 0],
  2
] call CBA_settings_fnc_init;

