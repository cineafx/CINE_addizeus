#include "script_component.hpp"

private _actions = [];

private _target = vehicle (curatorSelected # 0 # 0);
private _sensors = listVehicleSensors _target;

if ((count _sensors) == 0) exitWith { _actions; };

{
  private _sensorClassName = _x select 0;
  private _sensorComponentType = _x select 0;
  private _sensorDisplayName = "";

  switch (_sensorComponentType) do {
    case "IRSensorComponent": { _sensorDisplayName = "Infrared"; };
    case "NVSensorComponent": { _sensorDisplayName = "Night vision"; };
    case "LaserSensorComponent": { _sensorDisplayName = "Laser"; };
    case "ActiveRadarSensorComponent": { _sensorDisplayName = "Active radar"; };
    case "PassiveRadarSensorComponent": { _sensorDisplayName = "Passive radar"; };
    case "VisualSensorComponent": { _sensorDisplayName = "Visual"; };
    case "ManSensorComponent": { _sensorDisplayName = "Man"; };
    case "DataLinkSensorComponent": { _sensorDisplayName = "Data link"; };
    default { _sensorDisplayName = _sensorComponentType };
  };

  private _action_1 = [
                      format ["Action: %1_1", _x],
                      _sensorDisplayName,
                      "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa",
                      {
                        params ["_target", "_player", "_sensorClassName"];
                        [_target, [_sensorClassName, true]] remoteExecCall ["enableVehicleSensor", 0, _target];
                      }, {
                        params ["_target", "_player", "_sensorClassName"];
                        !((_target isVehicleSensorEnabled _sensorClassName) # 0 # 1);
                      }, {}, _sensorClassName] call ace_interact_menu_fnc_createAction;
  private _action_0 = [
                      format ["Action: %1_0", _x],
                      _sensorDisplayName,
                      "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa",
                      {
                        params ["_target", "_player", "_sensorClassName"];
                        [_target, [_sensorClassName, false]] remoteExecCall ["enableVehicleSensor", 0, _target];
                      }, {
                        params ["_target", "_player", "_sensorClassName"];
                        (_target isVehicleSensorEnabled _sensorClassName) # 0 # 1;
                      }, {}, _sensorClassName] call ace_interact_menu_fnc_createAction;
  _actions pushBack [_action_1, [], _target];
  _actions pushBack [_action_0, [], _target];
} forEach _sensors;

_actions
