#include "script_component.hpp"
/*
 * Author: cineafx
 * Sets the radios as read from the CBA settings.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_common_fnc_set_zeus_radios
 *
 * Public: [No]
 */

#define BASIC_RADIO QUOTE(ItemRadio)
#define SW_WEST QUOTE(TFAR_anprc152)
#define SW_EAST QUOTE(TFAR_fadak)
#define SW_INDEPENDENT QUOTE(TFAR_anprc148jem)
#define SW_ALL [ARR_3(SW_WEST, SW_EAST, SW_INDEPENDENT)]

//check that mission has started
[{time > 0 && !(isNull player) && (getClientStateNumber == 0 || getClientStateNumber >= 10)}, {
 /*
  private ["_SWradios"]
  _SWradios = TFAR_currentUnit call TFAR_fnc_radiosList;
  GVAR(radio_SW)*/

  private _LrType = GVAR(radio_keep_LR);
  private _SwType = GVAR(radio_keep_SW);

  private _autoDetectType = call FUNC(get_side_with_most_players);

  if (_autoDetectType == -1) then {
    [FUNC(set_zeus_radios), [], 120] call CBA_fnc_waitAndExecute;
    if (EGVAR(common,debug)) then {
      systemChat format["No other players connected. Trying again in 120 seconds..."];
    };
  };

  _LrType = [_LrType, _autoDetectType] select (_LrType == 8);
  _SwType = [_SwType, _autoDetectType] select (_SwType == 8);

  _LrArray = [_LrType, 3] call FUNC(get_bool_array_from_base10);
  _SwArray = [_SwType, 3] call FUNC(get_bool_array_from_base10);

  //West
  if (_LrArray # 0) then {
    TF_curator_backpack_1 = TFAR_DefaultRadio_Airborne_West createVehicleLocal [0, 0, 0];
  } else {
    deleteVehicle TF_curator_backpack_1;
    TF_curator_backpack_1 = nil;
  };
  //East
  if (_LrArray # 1) then {
    TF_curator_backpack_2 = TFAR_DefaultRadio_Airborne_East createVehicleLocal [0, 0, 0];
  } else {
    deleteVehicle TF_curator_backpack_2;
    TF_curator_backpack_2 = nil;
  };
  //Independent
  if (_LrArray # 2) then {
    TF_curator_backpack_3 = TFAR_DefaultRadio_Airborne_Independent createVehicleLocal [0, 0, 0];
  } else {
    deleteVehicle TF_curator_backpack_3;
    TF_curator_backpack_3 = nil;
  };



  systemChat "---";

  _SW_items = items ACE_PLAYER apply {
    _parent = configName inheritsFrom (configFile >> "CfgWeapons" >> _x);
    if (_parent == BASIC_RADIO) then {
      configName (configFile >> "CfgWeapons" >> _x);
    } else {
      _parent;
    };
  };
  //TODO

  systemChat str _SW_items;

  [FUNC(set_zeus_radios), [], 120] call CBA_fnc_waitAndExecute;

}, []] call CBA_fnc_waitUntilAndExecute;
