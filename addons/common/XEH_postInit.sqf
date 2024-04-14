#include "script_component.hpp"

[LINKFUNC(set_zeus_radios),[], 5] call CBA_fnc_waitAndExecute;
[LINKFUNC(set_zeus_radios),[], 30] call CBA_fnc_waitAndExecute;
[LINKFUNC(set_zeus_radios), 60] call CBA_fnc_addPerFrameHandler;

GVAR(selectedUnits) = [];

//["unit", {
//  params ["_newUnit", "_oldUnit"];
//  if (!isNull (getAssignedCuratorLogic player)) then {
//    if (!isNull (remotecontrolled ACE_PLAYER)) then {
//
//    };
//    _newUnit setVariable ["WBK_DAH_DisableAnim_Hit", 1];
//    _oldUnit setVariable ["WBK_DAH_DisableAnim_Hit", 0];
//  };
//}, true] call CBA_fnc_addPlayerEventHandler;
