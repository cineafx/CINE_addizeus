#include "script_component.hpp"
/*
 * Author: cineafx
 * Updates the zeus camera height read from the CBA settings.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_main_fnc_update_zeus_camera_height
 *
 * Public: [No]
 */


[{!isNull (getAssignedCuratorLogic player)}, {
  _height = GVAR(zeus_camera_height);
  _height = _height call BIS_fnc_parseNumber;
  if (_height >= 0) then {
    _height = _height max 2000;
    _height = _height min 40000;
  } else {
    //reset to default value
    [QGVAR(zeus_camera_height), "2000", false, ["server", "client"] select isDedicated, true] call CBA_settings_fnc_set;
  };
  [(getAssignedCuratorLogic player), _height] remoteExecCall ["setCuratorCameraAreaCeiling", 2, false];
}] call CBA_fnc_waitUntilAndExecute;

true;
