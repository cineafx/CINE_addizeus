#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Hunter Ai version 2.0 to the zeus module menu.
 * TODO: add more precise description
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_ai_fnc_HunterAi2_0
 *
 * Public: [No]
 */

["CINE AI", "Hunter AI 2.0",
{
  _handle = [{
    params["_unit","_handle"];

    _group = group _unit;
    _leader = leader _group;

    if ({ alive _x } count units _group == 0) exitWith {
      systemChat format["All units from group are dead. Removing PerFrameHandler: %1", _handle];
      [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _group setbehaviour "AWARE";
    {
      _x disableAI "AUTOCOMBAT";
      _x disableAI "SUPPRESSION";
      _x setSkill ["endurance", 1];
      _x setSkill ["courage", 1];
      _x setSkill ["commanding", 1];
      _x allowFleeing 0;
      vehicle _x allowCrewInImmobile true;
    } foreach units _group;


    _isWestHostile = (side _group getFriend west) <= 0.6;
    _isEastHostile = (side _group getFriend east) <= 0.6;
    _isIndependentHostile = (side _group getFriend independent) <= 0.6;
    _isCivilianHostile = (side _group getFriend civilian) <= 0.6;

    _nearest = objNull;
    _target = objNull;
    _nearestdist = 750;
    {
      if (side _x != sideLogic) then {

        if ( side _x == west && _isWestHostile
          || side _x == east && _isEastHostile
          || side _x == independent && _isIndependentHostile
          || side _x == civilian && _isCivilianHostile
        ) then {

          _dist = vehicle _x distance _leader;
          if (_dist < _nearestdist) then {
              _nearest = _x;
              _nearestdist = _dist;
          };
        };

      };

    } forEach allUnits - allDead;

    if (!isNull _nearest) then {
      _target = _nearest;
    };
    {deleteWaypoint _x} forEach (waypoints _group);
    if (!isNull _target) then {

      {
        if ((_leader distance _x) > 25 && (_leader distance _target) > 75 && !(_x isEqualTo _leader)) then {
          _dir = [_leader, _target] call BIS_fnc_dirTo;
          _moveToPos = _leader getRelPos [30, _dir];
          _x doMove _moveToPos;
        } else {
          _x doMove getPosATL _target;
        };
      } forEach units _group;

    } else {
      {doStop _x; _x doFollow leader _group;} forEach units _group;
    };

  }, 5, _this select 1] call CBA_fnc_addPerFrameHandler;

  ["Applied module"] call Achilles_fnc_showZeusErrorMessage;
}] call Ares_fnc_RegisterCustomModule;
