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

//TODO: https://github.com/michail-nikolaev/task-force-arma-3-radio/blob/1.0/addons/core/functions/fnc_getSideRadio.sqf
#define BASIC_RADIO QUOTE(ItemRadio)
#define SW_WEST QUOTE(TFAR_anprc152)
#define SW_EAST QUOTE(TFAR_fadak)
#define SW_INDEPENDENT QUOTE(TFAR_anprc148jem)
#define CURATOR_UNIT (ACE_PLAYER)

//check that mission has started
[{time > 0 && !(isNull player) && (getClientStateNumber == 0 || getClientStateNumber >= 10)}, {

  private _LrType = GVAR(radio_keep_LR);
  private _SwType = GVAR(radio_keep_SW);

  private _autoDetectType = call FUNC(get_side_with_most_players);

  if (_autoDetectType == 7) then {
    [FUNC(set_zeus_radios), [], 120] call CBA_fnc_waitAndExecute;
    if (EGVAR(common,debug)) then {
      systemChat format["No other players connected. Trying again in 120 seconds..."];
    };
  };

  /* Longrange */
  if (_LrType >= 0) then {
    _LrType = [_LrType, _autoDetectType] select (_LrType == 8);
    _LrArray = [_LrType, 3] call FUNC(get_bool_array_from_base10);

    //West
    if (_LrArray # 0) then {
      if (isNil "TF_curator_backpack_1") then {
        TF_curator_backpack_1 = TFAR_DefaultRadio_Airborne_West createVehicleLocal [0, 0, 0];
      };
    } else {
      deleteVehicle TF_curator_backpack_1;
      TF_curator_backpack_1 = nil;
    };
    //East
    if (_LrArray # 1) then {
      if (isNil "TF_curator_backpack_2") then {
        TF_curator_backpack_2 = TFAR_DefaultRadio_Airborne_East createVehicleLocal [0, 0, 0];
      };
    } else {
      deleteVehicle TF_curator_backpack_2;
      TF_curator_backpack_2 = nil;
    };
    //Independent
    if (_LrArray # 2) then {
      if (isNil "TF_curator_backpack_3") then {
        TF_curator_backpack_3 = TFAR_DefaultRadio_Airborne_Independent createVehicleLocal [0, 0, 0];
      };
    } else {
      deleteVehicle TF_curator_backpack_3;
      TF_curator_backpack_3 = nil;
    };
  };

  if (!isNull (getAssignedCuratorLogic CURATOR_UNIT)) then {
    /* Shortwave */
    if (_SwType >= 0) then {
      _SwType = [_SwType, _autoDetectType] select (_SwType == 8);
      _SwArray = [_SwType, 3] call FUNC(get_bool_array_from_base10);

      [CURATOR_UNIT, SW_WEST,        BASIC_RADIO, _SwArray # 0] call FUNC(manage_inventory_item);
      [CURATOR_UNIT, SW_EAST,        BASIC_RADIO, _SwArray # 1] call FUNC(manage_inventory_item);
      [CURATOR_UNIT, SW_INDEPENDENT, BASIC_RADIO, _SwArray # 2] call FUNC(manage_inventory_item);
    };
  };

}, []] call CBA_fnc_waitUntilAndExecute;
