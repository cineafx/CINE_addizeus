#include "script_component.hpp"
/*
 * Author: cineafx
 * Module function to apply the predefine loadouts to units.
 *
 * Arguments:
 * 0: The Module Logic <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [objNull, [], true] call CINE_addizeus_gear_fnc_moduleApplySaved
 *
 * Public: [No]
 */
params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

if (!_activated) exitWith {};
//if (!isServer) exitWith {};

private _unit = attachedTo _logic;

if (!isNull _logic) then {
    deleteVehicle _logic;
};

if (!isNull _unit) exitWith {
    [[_unit]] call FUNC(applySaved);
    [objNull, "Loadouts applied"] call bis_fnc_showCuratorFeedbackMessage;
};

["units"] call EFUNC(common,selectUnits);
[{
  // Wait for done
  !isNil QEGVAR(common,selectedUnits)
},{
  // Do stuff if done
  [EGVAR(common,selectedUnits)] call FUNC(applySaved);
  [objNull, "Loadouts applied"] call bis_fnc_showCuratorFeedbackMessage;

}] call CBA_fnc_waitUntilAndExecute;

true;
