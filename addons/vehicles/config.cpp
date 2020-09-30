#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(moduleClearAllInventories), QGVAR(moduleClearInventory), QGVAR(moduleAllowCrew), QGVAR(moduleDisableCookoff)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cine_addizeus_main"};
        author = "";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class CfgFactionClasses
{
    class NO_CATEGORY;
    class GVAR(moduleVehicles): NO_CATEGORY
    {
        displayName = "CINE Vehicles";
    };
};

#include "CfgVehicles.hpp"
