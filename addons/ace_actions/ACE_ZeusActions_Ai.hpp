class GVAR(ai) {
  displayName = "AI";
  condition = "";
  statement = "";
  icon = "\a3\ui_f\data\gui\Rsc\RscDisplayMain\menu_options_ca.paa";

  class GVAR(aiMode) {
    displayName = "CINE Ai";
    condition = "isClass(configFile >> 'CfgPatches' >> 'cine_addizeus_ai')";
    statement = "";
    icon = "\a3\ui_f\data\gui\cfg\hints\commanding_ca.paa";
    class GVAR(aiMode_HunterAggressive) {
      displayName = "HunterAi (Aggressive)";
      condition = "true";
      statement = QUOTE([ARR_2(curatorSelected select 0,['AGGRESSIVE_PUSH'])] call EFUNC(ai,hunterAi));
      icon = "\a3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa";
    };
    class GVAR(aiMode_HunterTactical) {
      displayName = "HunterAi (Tactical)";
      condition = "true";
      statement = QUOTE([ARR_2(curatorSelected select 0,['TACTICAL'])] call EFUNC(ai,hunterAi));
      icon = "\a3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa";
    };
    class GVAR(aiMode_Zombie) {
      displayName = "ZombieAi (sideEnemy)";
      condition = "true";
      statement = QUOTE([curatorSelected select 0] call EFUNC(ai,zombieAi));
      icon = "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa";
    };
  };

  class GVAR(VCOM) {
    displayName = "VCOM";
    condition = "isClass(configFile >> 'CfgPatches' >> 'VCOM_AI')";
    statement = "";
    icon = "\a3\ui_f\data\gui\Rsc\RscDisplayMain\menu_options_ca.paa";
    class GVAR(VCOM_enable) {
      displayName = "Enable VCOM";
      condition = "true";
      statement = "{_x setvariable ['VCOM_NOAI',false,true];} forEach (curatorSelected select 0);";
      icon = ICON_CHECKED;
    };
    class GVAR(VCOM_disable) {
      displayName = "Disable VCOM";
      condition = "true";
      statement = "{_x setvariable ['VCOM_NOAI',true,true];} forEach (curatorSelected select 0);";
      icon = ICON_UNCHECKED;
    };
    class GVAR(VCOM_enable_wp) {
      displayName = "Enable VCOM creating waypoints";
      condition = "true";
      statement = "{_x setvariable ['VCOM_NOPATHING_Unit',false,true];} forEach (curatorSelected select 0);";
      icon = ICON_CHECKED;
    };
    class GVAR(VCOM_disable_wp) {
      displayName = "Disable VCOM creating waypoints";
      condition = "true";
      statement = "{_x setvariable ['VCOM_NOPATHING_Unit',true,true];} forEach (curatorSelected select 0);";
      icon = ICON_UNCHECKED;
    };
  };

  class GVAR(ai_rating) {
    displayName = "Rating";
    condition = "true";
    statement = "";
    icon = "\a3\ui_f\data\gui\Rsc\RscDisplayCreateJIRAIssue\jira_ca.paa";
    class GVAR(ai_rating_minus_1000) {
      displayName = "Rating -10000";
      condition = "true";
      statement = "{_x addRating -10000;} forEach (curatorSelected select 0);";
      icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
    };
    class GVAR(ai_rating_reset) {
      displayName = "Rating reset";
      condition = "true";
      statement = "{_x addRating -(rating _x);} forEach (curatorSelected select 0);";
      icon = "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
    };
  };
};
