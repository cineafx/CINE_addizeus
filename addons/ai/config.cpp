#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
          QGVAR(moduleHunterAiTactical),
          QGVAR(moduleHunterAiAggressive),
          QGVAR(moduleHunterAiSettings),
          QGVAR(moduleZombieAi)
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cine_addizeus_main", "ACE_common"};
        author = "";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class CfgFactionClasses
{
    class NO_CATEGORY;
    class GVAR(moduleAi): NO_CATEGORY
    {
        displayName = "CINE Ai";
    };
};

#include "CfgVehicles.hpp"
