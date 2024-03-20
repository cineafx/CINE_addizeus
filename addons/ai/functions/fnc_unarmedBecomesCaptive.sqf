#include "script_component.hpp"
/*
 * Author: cineafx
 * This module turns units which have not had a weapon equipped for X minutes to captive
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_vehicles_fnc_unarmedBecomesCaptive
 *
 * Public: [No]
 */

if (isNil QGVAR(unarmedBecomesCaptive_EH)) then {
  GVAR(unarmedBecomesCaptive_EH) = [{

    private _effectedUnits = [];
    switch (GVAR(unarmedBecomesCaptive_target)) do {
      case 0: { _effectedUnits = allUnits; };
      case 1: { _effectedUnits = (call BIS_fnc_listPlayers); };
      case 2: { _effectedUnits = (allUnits - (call BIS_fnc_listPlayers)); };
      default {};
    };

    {
      private _isUnarmed = primaryWeapon _x == "" && secondaryWeapon _x == "" && handgunWeapon _x == "";
      private _captiveStatusEffect = [_x, "setCaptive"] call ace_common_fnc_statusEffect_get;
      private _hasEffectFromThisScript =
        (_captiveStatusEffect select 0) &&
        (_captiveStatusEffect select 1) findIf { _x == QGVAR(unarmedBecomesCaptive_reason); } != -1; // case insensitive

      if (!_isUnarmed && !_hasEffectFromThisScript ||
           _isUnarmed &&  _hasEffectFromThisScript) then {
        // no change required
        continue;
      };

      if (!_isUnarmed && _hasEffectFromThisScript) then {
        // reset
        //[_x, "setCaptive", QGVAR(unarmedBecomesCaptive_reason), false] call ace_common_fnc_statusEffect_set;
        ["ace_common_setStatusEffect", [_x, "setCaptive", QGVAR(unarmedBecomesCaptive_reason), false]] call CBA_fnc_globalEvent;
        _x setVariable [QGVAR(unarmedBecomesCaptive_timeOfUnarmedStart), 0];
        systemChat format ["reset: %1", _x];
        continue;
      };

      private _timeOfUnarmedStart = _x getVariable [QGVAR(unarmedBecomesCaptive_timeOfUnarmedStart), 0];

      if (_timeOfUnarmedStart == 0) then {
        // freshly unarmed
        _x setVariable [QGVAR(unarmedBecomesCaptive_timeOfUnarmedStart), time];
        systemChat format ["fresh: %1", _x];
        continue;
      };

      if (time - _timeOfUnarmedStart > GVAR(unarmedBecomesCaptive_requiredTime)) then {
        //[_x, "setCaptive", QGVAR(unarmedBecomesCaptive_reason), true] call ace_common_fnc_statusEffect_set;
        ["ace_common_setStatusEffect", [_x, "setCaptive", QGVAR(unarmedBecomesCaptive_reason), true]] call CBA_fnc_globalEvent;
        systemChat format ["apply: %1", _x];
        continue;
      };

    } forEach _effectedUnits;
  }, 1, []] call CBA_fnc_addPerFrameHandler;
  [objNull, "Enabled: Unarmed becomes captive"] call bis_fnc_showCuratorFeedbackMessage;
} else {
  [GVAR(unarmedBecomesCaptive_EH)] call CBA_fnc_removePerFrameHandler;
  GVAR(unarmedBecomesCaptive_EH) = nil;
  {
    //[_x, "setCaptive", QGVAR(unarmedBecomesCaptive_reason), false] call ace_common_fnc_statusEffect_set;
    ["ace_common_setStatusEffect", [_x, "setCaptive", QGVAR(unarmedBecomesCaptive_reason), false]] call CBA_fnc_globalEvent;
  } forEach (allUnits + (call BIS_fnc_listPlayers));
  [objNull, "Disabled: Unarmed becomes captive"] call bis_fnc_showCuratorFeedbackMessage;
};

true;
