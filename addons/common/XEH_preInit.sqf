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
