#include "script_component.hpp"

GVAR(allPylonMags) = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configName _x};
GVAR(allPylonMags) = GVAR(allPylonMags) apply {[gettext (configfile >> "CfgMagazines" >> _x >> "displayName"),_x]};
GVAR(allPylonMags) sort true;
GVAR(allPylonMags) = GVAR(allPylonMags) apply {_x select 1};
GVAR(validDispNames) = GVAR(allPylonMags) apply {getText (configfile >> "CfgMagazines" >> _x >> "displayName")};

["ace_pylons_setPylonLoadOutEvent", {
    params ["_aircraft", "_pylonIndex", "_pylon", "_turret", "_weaponToRemove"];

    private _compatibleMags = _aircraft getCompatiblePylonMagazines _pylonIndex;
    if (_pylon in _compatibleMags) exitWith {};
    systemChat format ["Forcing pylon: %1 %2", _pylonIndex, _pylon];

    [{
      params ["_aircraft", "_pylonIndex", "_pylon", "_turret"];
      [_aircraft, [_pylonIndex, _pylon, true, _turret]] remoteExecCall ["setPylonLoadOut", _aircraft];
    }, [_aircraft, _pylonIndex, _pylon, _turret]] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addEventHandler;
