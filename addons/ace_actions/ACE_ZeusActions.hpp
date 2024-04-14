class ACE_ZeusActions {
  class GVAR(cellphone) {
      displayName = "Cellphone";
      condition = "true";
      statement = "closeDialog 0; createDialog 'Rsc_ACE_PhoneInterface';";
      icon = "\z\ace\addons\explosives\Data\UI\Cellphone_UI.paa";
  };
  class ZeusUnits {
    class GVAR(gear) {
      displayName = "Gear";
      condition = "false";
      statement = "_player action ['Gear', ((curatorSelected select 0) select 0)];";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };
    class GVAR(arsenal) {
      displayName = "Arsenal";
      condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
      statement = "[curatorSelected # 0 # 0, curatorSelected # 0 # 0, true] call ace_arsenal_fnc_openBox";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };
    class GVAR(pylons) {
      displayName = "Configure pylons";
      condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
      statement = "[((curatorSelected select 0) select 0), true] call ace_pylons_fnc_showDialog;";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\spaceGarage_ca.paa";
      class GVAR(pylons_full) {
        displayName = "Configure any pylons";
        condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
        statement = QUOTE([ARR_2((curatorSelected select 0) select 0,true)] call FUNC(showFullPylonsDialog));
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\spaceGarage_ca.paa";
      };
    };
    #include "ACE_ZeusActions_DangerZone.hpp"
    #include "ACE_ZeusActions_Ai.hpp"
    #include "ACE_ZeusActions_Vehicles.hpp"
  };
};
