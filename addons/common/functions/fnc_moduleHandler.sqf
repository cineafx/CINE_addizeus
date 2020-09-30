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
 * [objNull, [], true] call CINE_addizeus_gear_fnc_moduleApplySaved
 *
 * Public: [No]
 */
params [["_moduleParams", [objNull, [], true]], ["_function", {}], ["_message", ""], ["_args", []], ["_selectType", "Objects"]];
_moduleParams params ["_logic", "_units", "_activated"];

TRACE_4("params",_logic,_units,_activated,_message);

//if (!_activated) exitWith {};
//if (!isServer) exitWith {};

private _unit = attachedTo _logic;

if (!isNull _logic) then {
    deleteVehicle _logic;
};

if (!isNull _unit) exitWith {
    [[_unit], _args] call _function;
    [objNull, _message] call bis_fnc_showCuratorFeedbackMessage;
    playSound "FD_Start_F";
};

[_selectType] call EFUNC(common,selectUnits);
[{
  // Wait for done
  !isNil QEGVAR(common,selectedUnits)
},{
  // Do stuff if done
  [EGVAR(common,selectedUnits), this # 1] call _this # 0;
  [objNull, _message] call bis_fnc_showCuratorFeedbackMessage;
  playSound "FD_Start_F";
}, [_function, _args]] call CBA_fnc_waitUntilAndExecute;

true;
