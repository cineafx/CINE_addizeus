#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Hunter Ai version 2.3 to the zeus module menu.
 * TODO: add more precise description
 *
 * Arguments:
 * 0: Selected units. <object[]>
 * 1: Further arguments. <array>
 *
 * Further arguments:
 * 0: nearestdistance. <number>
 * 1: Ai type. <string> (TACTICAL or AGGRESSIVE_PUSH)
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_ai_fnc_HunterAi2_3s
 *
 * Public: [No]
 */

params ["_units", "_args"];
_args params ["_nearestdist", "_aiType"];

private _groups = [];
{
  private _group = group _x;
  if (_group != grpNull) then {
    _groups pushBackUnique _group;
  }
} forEach _units;

{

  _handle = [{
    params["_param","_handle"];
    _param params["_group", "_nearestdist", "_aiType"];

    _leader = leader _group;

    if ({ alive _x } count units _group == 0) exitWith {
      if (EGVAR(common,debug)) then {
        systemChat format["All units from group are dead. Removing PerFrameHandler: %1", _handle];
      };
      [_handle] call CBA_fnc_removePerFrameHandler;
    };

    switch (_aiType) do {
      case ("TACTICAL"): {
        _group setbehaviour "COMBAT";
        _group setCombatMode "RED";
        _group setSpeedMode "NORMAL"
      };
      case ("AGGRESSIVE_PUSH"): {
        _group setbehaviour "AWARE";
        _group setCombatMode "YELLOW";
        _group setSpeedMode "FULL";
        {
          _x disableAI "COVER";
        } foreach units _group;
      };
    };

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
    switch (_aiType) do {
      case ("TACTICAL"): {
        /* ------------------------- START ------------------------- */
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
        /* ------------------------- END ------------------------- */
      };
      case ("AGGRESSIVE_PUSH"): {
        /* ------------------------- START ------------------------- */
        if (!isNull _target) then {

          if ( ([_target] call ace_common_fnc_isInBuilding || getPosatl _target #2 > 1) && (_leader distance _target) < 50 ) then {
            {deleteWaypoint _x} forEach (waypoints _group);
            _wp = _group addWaypoint [getPosATL _target, 0];
            _wp setWaypointSpeed "FULL";
            _wp setWaypointType "SAD";
            _wp setWaypointBehaviour "AWARE";
            _wp setWaypointCombatMode "RED";
            _wp setWaypointCompletionRadius 1;
            if (_leader distance _target < 10) then {
              {deleteWaypoint _x} forEach (waypoints _group);
              {_x doMove getPosATL _target} forEach units _group;
            };
          } else {
            _group move getPos _target
          };
        } else {
          {deleteWaypoint _x} forEach (waypoints _group);
        };
        /* ------------------------- END ------------------------- */
      };
    };


  }, 5, [_x, _nearestdist, _aiType]] call CBA_fnc_addPerFrameHandler;
} forEach _groups;
