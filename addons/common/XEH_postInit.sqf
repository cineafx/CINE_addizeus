#include "script_component.hpp"

[LINKFUNC(set_zeus_radios),[], 5] call CBA_fnc_waitAndExecute;
[LINKFUNC(set_zeus_radios),[], 30] call CBA_fnc_waitAndExecute;
[LINKFUNC(set_zeus_radios), 60] call CBA_fnc_addPerFrameHandler;

GVAR(selectedUnits) = [];
