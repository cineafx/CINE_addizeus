#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds the Zombie AI version 1.0 to the zeus module menu.
 * Makes zombies out of all selected units. Zombies will use the independent faction.
 * TODO: add more precise description
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_ai_fnc_zombieAi
 *
 * Public: [No]
 */


params ["_units", "_args"];
_args params ["_nearestdist"];

private _groups = [];
{
  private _group = group _x;
  if (_group != grpNull) then {
    _groups pushBackUnique _group;
  }
} forEach _units;

{
  _SideZMB = missionNamespace getVariable ["SideZMB", createCenter independent];
  _SideZMB setFriend [west, 0];
  _SideZMB setFriend [east, 1];
  _SideZMB setFriend [civilian, 1];
  west setFriend [_SideZMB, 0];
  east setFriend [_SideZMB, 1];
  civilian setFriend [_SideZMB, 1];
  missionNamespace setVariable ["SideZMB",_SideZMB]; //TODO QGVAR

  _groupZMB = createGroup _SideZMB;
  (units _x) join _groupZMB;

  {
    [_x, "ACE_NoVoice"] remoteExecCall ["setSpeaker", 0, _x];
    [{
      params["_args","_handle"];
      _args params ["_unit"];
      _target = (group _unit) getVariable ["target", null];

      if (!isNull _target && animationState _unit != "awoppercmstpsgthwnondnon_end") then {
        if (_unit distance getposATL _target < 2.5 && alive _target  && _target != _unit) then {
          _unit switchMove "AwopPercMstpSgthWnonDnon_end";
          [_target, 0.15, selectRandom ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"], selectRandom ["bullet", "grenade", "explosive", "shell", "vehiclecrash", "backblast", "stab", "punch", "falling", "ropeburn", "unkown"]] call ace_medical_fnc_addDamageToUnit;
        };
      };
      if (!alive _unit) then {
        [_handle] call CBA_fnc_removePerFrameHandler;
      };
    }, 0.5, [_x]] call CBA_fnc_addPerFrameHandler;
  } forEach units _groupZMB;


  _handle = [{
    params["_parm","_handle"];

    _group = _parm select 0;
    _nearestdist = _parm select 1;

    _leader = leader _group;

    if ({ alive _x } count units _group == 0) exitWith {
      if (EGVAR(common,debug)) then {
        systemChat format["All units from group are dead. Removing PerFrameHandler: %1", _handle];
      };
      [_handle] call CBA_fnc_removePerFrameHandler;
    };

    _group setbehaviour "CARELESS";
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
    _group setVariable ["target", _target];
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

  }, 5, [_groupZMB, _nearestdist]] call CBA_fnc_addPerFrameHandler;
} forEach _groups;
