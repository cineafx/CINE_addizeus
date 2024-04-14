class GVAR(vehicle_settings) {
  displayName = "Vehicle Settings";
  condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
  statement = "";
  exceptions[] = {};
  icon = "\a3\weapons_f_orange\Reticle\data\Settings_ca.paa";
  class GVAR(vehicle_sensorList) {
    displayName = "Vehicle sensors";
    condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'Air') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
    statement = "true;";
    icon = "\a3\ui_f\data\IGUI\Cfg\Actions\RadarOn_ca.paa";
    insertChildren = QUOTE(call FUNC(insertVehicleSensorList));
  };

  class GVAR(vehicle_optics) {
    displayName = "Vehicle optics";
    condition = "true";
    statement = "true;";
    icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\binoculars_ca.paa";

    class GVAR(vehicle_optics_nv_reenable) {
      displayName = "Night vision";
      condition = QUOTE((CURATOR_SELECTED_ALLVEHICLES findIf {((equipmentDisabled _x) select 0)}) != -1);
      statement = QUOTE({_x disableNVGEquipment false} forEach CURATOR_SELECTED_ALLVEHICLES);
      icon = ICON_UNCHECKED;
    };
    class GVAR(vehicle_optics_nv_disable) { // disable NV
      displayName = "Night vision";
      condition = QUOTE((CURATOR_SELECTED_ALLVEHICLES findIf {!((equipmentDisabled _x) select 0)}) != -1);
      statement = QUOTE({_x disableNVGEquipment true} forEach CURATOR_SELECTED_ALLVEHICLES);
      icon = ICON_CHECKED;
    };
    class GVAR(vehicle_optics_ti_reenable) { // reenable TI
      displayName = "Thermal imaging";
      condition = QUOTE((CURATOR_SELECTED_ALLVEHICLES findIf {((equipmentDisabled _x) select 1)}) != -1);
      statement = QUOTE({_x disableTIEquipment false} forEach CURATOR_SELECTED_ALLVEHICLES);
      icon = ICON_UNCHECKED;
    };
    class GVAR(vehicle_optics_ti_disable) { // disable TI
      displayName = "Thermal imaging";
      condition = QUOTE((CURATOR_SELECTED_ALLVEHICLES findIf {!((equipmentDisabled _x) select 1)}) != -1);
      statement = QUOTE({_x disableTIEquipment true} forEach CURATOR_SELECTED_ALLVEHICLES);
      icon = ICON_CHECKED;
    };
    TOGGLE_VAR_ACTION(GVAR(vehicles_optics_a3ti),A3TI,CURATOR_SELECTED_ALLVEHICLES,A3TI_Disable)
  };

  // TODO: https://community.bistudio.com/wiki/setVehicleTIPars
  class GVAR(vehicle_locking) {
    displayName = "Vehicle lock";
    condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
    statement = "";
    icon = "\a3\ui_f\data\gui\Rsc\RscDisplayDynamicGroups\Lock.paa";
    class GVAR(vehicle_unlocked) {
      displayName = "Unlocked";
      condition = "true";
      statement = "{_x setVehicleLock 'UNLOCKED';} forEach (curatorSelected select 0);";
      icon = "";
    };
    class GVAR(vehicle_default) {
      displayName = "Default";
      condition = "true";
      statement = "{_x setVehicleLock 'DEFAULT';} forEach (curatorSelected select 0);";
      icon = "";
    };
    class GVAR(vehicle_locked) {
      displayName = "Locked";
      condition = "true";
      statement = "{_x setVehicleLock 'LOCKED';} forEach (curatorSelected select 0);";
      icon = "";
    };
    class GVAR(vehicle_locked_player) {
      displayName = "Locked player";
      condition = "true";
      statement = "{_x setVehicleLock 'LOCKEDPLAYER';} forEach (curatorSelected select 0);";
      icon = "";
    };
  };
};
