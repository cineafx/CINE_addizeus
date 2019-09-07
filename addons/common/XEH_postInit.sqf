#include "script_component.hpp"

[{call FUNC(set_zeus_radios)},[], 5] call CBA_fnc_waitAndExecute;
[{call FUNC(set_zeus_radios)},[], 30] call CBA_fnc_waitAndExecute;
[{call FUNC(set_zeus_radios)}, 60] call CBA_fnc_addPerFrameHandler;
