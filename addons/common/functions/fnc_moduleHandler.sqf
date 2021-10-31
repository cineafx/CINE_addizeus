#include "script_component.hpp"
/*
 * Author: cineafx
 * Module function to apply the predefine loadouts to units.
 *
 * Arguments:
 * 0: The Module Logic <OBJECT>
 * TODO
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [_attachedObject, DFUNC(unterAi), "Hunter Ai enabled", ["AGGRESSIVE_PUSH", GVAR(hunterAi_seek_range)], "Units"] call CINE_addizeus_gear_fnc_moduleHandler
 *
 * Public: [No]
 */
params ["_attachedObject", ["_function", {}], ["_message", ""], ["_args", []], ["_selectType", "Objects"]];

TRACE_4("params",_logic,_units,_activated,_message);

//if (!isServer) exitWith {};

if (!isNull _attachedObject) exitWith {
    [[_attachedObject], _args] call _function;
    [objNull, _message] call bis_fnc_showCuratorFeedbackMessage;
    playSound "FD_Start_F";
};

[_selectType] call EFUNC(common,selectUnits);
[{
  // Wait for done
  !isNil QEGVAR(common,selectedUnits)
},{
  // Do stuff if done
  [EGVAR(common,selectedUnits), _this # 1] call _this # 0;
  [objNull, _message] call bis_fnc_showCuratorFeedbackMessage;
  playSound "FD_Start_F";
}, [_function, _args]] call CBA_fnc_waitUntilAndExecute;

true;
