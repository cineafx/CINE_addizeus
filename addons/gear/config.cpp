#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(test), QGVAR(test2)};
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
    class GVAR(moduleGear): NO_CATEGORY
    {
        displayName = "CINE Gear";
    };
};

#include "RscAttributes.hpp"
#include "CfgVehicles.hpp"
