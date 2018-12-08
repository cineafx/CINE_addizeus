#include "script_component.hpp"
/*
 * Author: cineafx
 * Adds a zeus module which forces AI to stay in immobile vehicles.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_allow_crew
 *
 * Public: [No]
 */

["CINE Vehicles", "Allow crew in immobile vehicles", {
  if (missionNamespace getvariable ["allow_crew_loop",false]) then {
    missionNamespace setVariable ["allow_crew_loop",false];
    ["Crew is no longer allowed to stay in immobile vehicles."] call Ares_fnc_ShowZeusMessage;
    {
      _x allowCrewInImmobile false;
    } forEach vehicles;
  } else {
    missionNamespace setVariable ["allow_crew_loop",true];
    ["Crew is now allowed to stay in immobile vehicles."] call Ares_fnc_ShowZeusMessage;
    [] spawn {
      while {missionNamespace getvariable ["allow_crew_loop",false]} do {
          {
              _x allowCrewInImmobile true;
          } forEach vehicles;
          sleep 30;
      };
    };
  };
}] call Ares_fnc_RegisterCustomModule;
