#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(moduleApplySaved), QGVAR(moduleSetSaved)};
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

#include "ui\RscAttributes.hpp"
#include "CfgVehicles.hpp"

//https://github.com/kayler-renslow/arma-dialog-creator
