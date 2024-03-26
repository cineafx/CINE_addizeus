class ACE_ZeusActions {
  class ZeusUnits {
    class zeus_Gear {
      displayName = "Gear";
      condition = "false";
      statement = "_player action ['Gear', ((curatorSelected select 0) select 0)];";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };
    class zeus_Arsenal {
      displayName = "Arsenal";
      condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
      statement = "[curatorSelected # 0 # 0, curatorSelected # 0 # 0, true] call ace_arsenal_fnc_openBox";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };
    class zeus_pylons {
      displayName = "Configure pylons";
      condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
      statement = "[((curatorSelected select 0) select 0), true] call ace_pylons_fnc_showDialog;";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\spaceGarage_ca.paa";
    };
    class zeus_dangerZone {
      displayName = "Danger zone";
      condition = "true";
      statement = "";
      icon = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_park_ON_ca.paa";
      class zeus_Neutralize {
        displayName = "Neutralize";
        condition = "true";
        statement = "[((curatorSelected select 0) select 0)] call BIS_fnc_neutralizeUnit;";
        icon = "\a3\ui_f\data\gui\Cfg\Debriefing\endDeath_ca.paa";
      };
      class zeus_InflictDamage_light_few {
        displayName = "Inflict Damage (light, few)";
        condition = "true";
        statement = QUOTE([ARR_3((curatorSelected select 0), 0.05, 5)] call FUNC(InflictDamage));
        icon = "";
      };
      class zeus_InflictDamage_heavy_few {
        displayName = "Inflict Damage (heavy, few)";
        condition = "true";
        statement = QUOTE([ARR_3((curatorSelected select 0), 0.95, 5)] call FUNC(InflictDamage));
        icon = "";
      };
      class zeus_InflictDamage_light_many {
        displayName = "Inflict Damage (light, many)";
        condition = "true";
        statement = QUOTE([ARR_3((curatorSelected select 0), 0.05, 50)] call FUNC(InflictDamage));
        icon = "";
      };
      class zeus_InflictDamage_heavy_many {
        displayName = "Inflict Damage (heavy, many)";
        condition = "true";
        statement = QUOTE([ARR_3((curatorSelected select 0), 0.95, 50)] call FUNC(InflictDamage));
        icon = "";
      };
      class zeus_CookOff {
        displayName = "Cook Off";
        condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
        statement = "[((curatorSelected select 0) select 0)] call ace_cookoff_fnc_cookOff;";
        icon = "\a3\ui_f\data\IGUI\Cfg\MPTable\armored_ca.paa";
      };
    };
    class zeus_VCOM {
      displayName = "VCOM";
      condition = "isClass(configFile >> 'CfgPatches' >> 'VCOM_AI')";
      statement = "";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayMain\menu_options_ca.paa";
      class zeus_VCOM_enable {
        displayName = "Enable VCOM";
        condition = "true";
        statement = "{_x setvariable ['VCOM_NOAI',false];} forEach (curatorSelected select 0);";
        icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
      };
      class zeus_VCOM_disable {
        displayName = "Disable VCOM";
        condition = "true";
        statement = "{_x setvariable ['VCOM_NOAI',true];} forEach (curatorSelected select 0);";
        icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
      };
      class zeus_VCOM_enable_wp {
        displayName = "Enable VCOM creating waypoints";
        condition = "true";
        statement = "{_x setvariable ['VCOM_NOPATHING_Unit',false];} forEach (curatorSelected select 0);";
        icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
      };
      class zeus_VCOM_disable_wp {
        displayName = "Disable VCOM creating waypoints";
        condition = "true";
        statement = "{_x setvariable ['VCOM_NOPATHING_Unit',true];} forEach (curatorSelected select 0);";
        icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
      };
    };
    class zeus_vehicle_locking {
      displayName = "Vehicle lock";
      condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
      statement = "";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayDynamicGroups\Lock.paa";
      class zeus_vehicle_unlocked {
        displayName = "Unlocked";
        condition = "true";
        statement = "{_x setVehicleLock 'UNLOCKED';} forEach (curatorSelected select 0);";
        icon = "";
      };
      class zeus_vehicle_default {
        displayName = "Default";
        condition = "true";
        statement = "{_x setVehicleLock 'DEFAULT';} forEach (curatorSelected select 0);";
        icon = "";
      };
      class zeus_vehicle_locked {
        displayName = "Locked";
        condition = "true";
        statement = "{_x setVehicleLock 'LOCKED';} forEach (curatorSelected select 0);";
        icon = "";
      };
      class zeus_vehicle_locked_player {
        displayName = "Locked player";
        condition = "true";
        statement = "{_x setVehicleLock 'LOCKEDPLAYER';} forEach (curatorSelected select 0);";
        icon = "";
      };
    };
    class zeus_vehicle_sensorList {
      displayName = "Vehicle sensors";
      condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'Air') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
      statement = "true;";
      icon = "\a3\ui_f\data\IGUI\Cfg\Actions\RadarOn_ca.paa";
      insertChildren = QUOTE(call FUNC(insertVehicleSensorList));
    };
    class zeus_rating {
      displayName = "Rating";
      condition = "true";
      statement = "";
      icon = "\a3\ui_f\data\gui\Rsc\RscDisplayCreateJIRAIssue\jira_ca.paa";
      class zeus_rating_minus_1000 {
        displayName = "Rating -10000";
        condition = "true";
        statement = "{_x addRating -10000;} forEach (curatorSelected select 0);";
        icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
      };
      class zeus_rating_reset {
        displayName = "Rating reset";
        condition = "true";
        statement = "{_x addRating -(rating _x);} forEach (curatorSelected select 0);";
        icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
      };
    };
  };
};
