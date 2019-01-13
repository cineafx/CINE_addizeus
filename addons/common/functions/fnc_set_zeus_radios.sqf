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
 * [] call CINE_addizeus_main_fnc_set_zeus_radios
 *
 * Public: [No]
 */

/*
private ["_SWradios"]
_SWradios = TFAR_currentUnit call TFAR_fnc_radiosList;

GVAR(radio_SW)*/

switch (GVAR(radio_LR)) do {
  case (-1): {
    //Keep all (create them again if they don't exist)
    if (isnil "TF_curator_backpack_1") then {
      TF_curator_backpack_1 = TFAR_DefaultRadio_Airborne_West createVehicleLocal [0, 0, 0];
    };
    if (isnil "TF_curator_backpack_2") then {
      TF_curator_backpack_2 = TFAR_DefaultRadio_Airborne_East createVehicleLocal [0, 0, 0];
    };
    if (isnil "TF_curator_backpack_3") then {
      TF_curator_backpack_3 = TFAR_DefaultRadio_Airborne_Independent createVehicleLocal [0, 0, 0];
    };
  };
  case (0): {
    //keep west
    if (isnil "TF_curator_backpack_1") then {
      TF_curator_backpack_1 = TFAR_DefaultRadio_Airborne_West createVehicleLocal [0, 0, 0];
    };
    if (!isnil "TF_curator_backpack_2") then {
      deleteVehicle TF_curator_backpack_2;
      TF_curator_backpack_2 = nil;
    };
    if (!isnil "TF_curator_backpack_3") then {
      deleteVehicle TF_curator_backpack_3;
      TF_curator_backpack_3 = nil;
    };
  };
  case (1): {
    //keep east
    if (!isnil "TF_curator_backpack_1") then {
      deleteVehicle TF_curator_backpack_1;
      TF_curator_backpack_1 = nil;
    };
    if (isnil "TF_curator_backpack_2") then {
      TF_curator_backpack_2 = TFAR_DefaultRadio_Airborne_East createVehicleLocal [0, 0, 0];
    };
    if (!isnil "TF_curator_backpack_3") then {
      deleteVehicle TF_curator_backpack_3;
      TF_curator_backpack_3 = nil;
    };
  };
  case (2): {
    //keep independent
    if (!isnil "TF_curator_backpack_1") then {
      deleteVehicle TF_curator_backpack_1;
      TF_curator_backpack_1 = nil;
    };
    if (!isnil "TF_curator_backpack_2") then {
      deleteVehicle TF_curator_backpack_2;
      TF_curator_backpack_2 = nil;
    };
    if (isnil "TF_curator_backpack_3") then {
      TF_curator_backpack_3 = TFAR_DefaultRadio_Airborne_Independent createVehicleLocal [0, 0, 0];
    };
  };
  case (3): {
    //keep none
    if (!isnil "TF_curator_backpack_1") then {
      deleteVehicle TF_curator_backpack_1;
      TF_curator_backpack_1 = nil;
    };
    if (!isnil "TF_curator_backpack_2") then {
      deleteVehicle TF_curator_backpack_2;
      TF_curator_backpack_2 = nil;
    };
    if (!isnil "TF_curator_backpack_3") then {
      deleteVehicle TF_curator_backpack_3;
      TF_curator_backpack_3 = nil;
    };
  };
};
