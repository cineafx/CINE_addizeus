#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Module Function to make a unit surrender (can be called from editor)
 * Also used for threeden attribute expression with dummy Logic Object
 *
 * Arguments:
 * 0: The Module Logic <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objNull, [player], true] call ace_captives_fnc_moduleSurrender
 *
 * Public: No
 */

params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

if (!_activated) exitWith {};
//if (!isServer) exitWith {};

private _unit = attachedTo _logic;

if (isNull _unit) exitWith {
    ["NothingSelected"] call ACE_ZEUS_fnc_showMessage;
    if (!isNull _logic) then {
        deleteVehicle _logic;
    };
};
if (!alive _unit) exitWith {
    ["OnlyAlive"] call ACE_ZEUS_fnc_showMessage;
    if (!isNull _logic) then {
        deleteVehicle _logic;
    };
};

systemChat str _unit;


(missionNamespace getVariable ["bis_fnc_curatorObjectPlaced_mouseOver",[""]]) params ["_mouseOverType", "_mouseOverUnit"];

if (_mouseOverType != "OBJECT") then {
    ["NothingSelected"] call ACE_ZEUS_fnc_showMessage;
} else {
    if !(alive _mouseOverUnit) then {
        ["OnlyAlive"] call ACE_ZEUS_fnc_showMessage;
    } else {
        systemChat str _mouseOverUnit;
    };
};

if (!isNull _logic) then {
    deleteVehicle _logic;
};

/*
https://github.com/acemod/ACE3/tree/master/addons/zeus/functions
https://github.com/acemod/ACE3/blob/master/addons/zeus/CfgVehicles.hpp
https://github.com/acemod/ACE3/blob/master/addons/zeus/ui/RscAttributes.hpp
https://community.bistudio.com/wiki/Modules
https://ace3mod.com/wiki/development/coding-guidelines.html


https://github.com/ArmaAchilles/Achilles/blob/master/%40AresModAchillesExpansion/addons/functions_f_ares/common/fn_GetUnitUnderCursor.sqf
https://github.com/ArmaAchilles/Achilles/blob/master/%40AresModAchillesExpansion/addons/functions_f_achilles/functions/init/fn_onCuratorStart.sqf
https://github.com/ArmaAchilles/Achilles/blob/master/%40AresModAchillesExpansion/addons/ui_f/functions/keyEvents/fn_HandleCuratorObjectPlaced.sqf
https://github.com/ArmaAchilles/Achilles/tree/master/%40AresModAchillesExpansion/addons/functions_f_achilles
*/

true;
