class ACE_ZeusActions {
  class ZeusUnits {
    class GVAR(aiMode) {
      displayName = "CINE Ai";
      condition = "true";
      statement = "";
      icon = "\a3\ui_f\data\gui\cfg\hints\commanding_ca.paa";
      class GVAR(aiHunterAggressive) {
        displayName = "HunterAi (Aggressive)";
        condition = "true";
        statement = QUOTE([ARR_2(curatorSelected#0, ['AGGRESSIVE_PUSH'])] spawn FUNC(hunterAi));
        icon = "\a3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa";
      };
      class GVAR(aiHunterTactical) {
        displayName = "HunterAi (Tactical)";
        condition = "true";
        statement = QUOTE([ARR_2(curatorSelected#0, ['TACTICAL'])] spawn FUNC(hunterAi));
        icon = "\a3\ui_f\data\igui\cfg\simpleTasks\types\attack_ca.paa";
      };
      class GVAR(aiZombie) {
        displayName = "ZombieAi (sideEnemy)";
        condition = "true";
        statement = QUOTE([ARR_2(curatorSelected#0, [GVAR(zombieAi_seek_range)])] spawn FUNC(zombieAi));
        icon = "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa";
      };
    };
  };
  class ZeusGroups { };
  class ZeusWaypoints { };
  class ZeusMarkers { };
};
