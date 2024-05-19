class GVAR(dangerZone) {
  displayName = "Danger zone";
  condition = "true";
  statement = "";
  icon = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\ico_cpt_park_ON_ca.paa";

  class GVAR(dangerZone_Neutralize) {
    displayName = "Neutralize";
    condition = "true";
    statement = QUOTE([(curatorSelected select 0)] call FUNC(neutralizeUnit));
    icon = "\a3\ui_f\data\gui\Cfg\Debriefing\endDeath_ca.paa";
  };
  class GVAR(dangerZone_convertToPhoneIed) {
    displayName = "Convert to phone IED";
    condition = "true";
    statement = QUOTE([(curatorSelected select 0) select 0] call FUNC(convertToPhoneIed));
    icon = "\z\ace\addons\explosives\Data\UI\Cellphone_UI.paa";
  };
  class GVAR(dangerZone_InflictDamage_light_few) {
    displayName = "Inflict Damage (light, few)";
    condition = "true";
    statement = QUOTE([ARR_3((curatorSelected select 0),0.05,5)] call FUNC(InflictDamage));
    icon = "";
  };
  class GVAR(dangerZone_InflictDamage_heavy_few) {
    displayName = "Inflict Damage (heavy, few)";
    condition = "true";
    statement = QUOTE([ARR_3((curatorSelected select 0),2,5)] call FUNC(InflictDamage));
    icon = "";
  };
  class GVAR(dangerZone_InflictDamage_light_many) {
    displayName = "Inflict Damage (light, many)";
    condition = "true";
    statement = QUOTE([ARR_3((curatorSelected select 0),0.05,50)] call FUNC(InflictDamage));
    icon = "";
  };
  class GVAR(dangerZone_InflictDamage_heavy_many) {
    displayName = "Inflict Damage (heavy, many)";
    condition = "true";
    statement = QUOTE([ARR_3((curatorSelected select 0),2,50)] call FUNC(InflictDamage));
    icon = "";
  };
  class GVAR(dangerZone_CookOff) {
    displayName = "Cook Off";
    condition = "true && if (count (curatorSelected select 0) > 0) then {(((curatorSelected select 0) select 0) isKindOf 'AllVehicles') && !(((curatorSelected select 0) select 0) isKindOf 'Man');} else {false;}";
    statement = "[((curatorSelected select 0) select 0)] call ace_cookoff_fnc_cookOff;";
    icon = "\a3\ui_f\data\IGUI\Cfg\MPTable\armored_ca.paa";
  };
};
