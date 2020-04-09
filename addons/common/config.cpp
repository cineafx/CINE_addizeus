#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cine_addizeus_main"};
        author = "";
        authors[] = {""};
        VERSION_CONFIG;
    };
};

#include "CfgHints.hpp"
#include "CfgEventHandlers.hpp"

//TODO
//class myCuratorModule: Module_F
//{
//    scope = 1;
//	  scopeCurator = 2;
//	  displayName = "My Zeus Module";
//	  category = "myCuratorCategory";
//	  icon = "myIcon.paa";
//
//	  function = "TAG_fnc_myModuleFunction";
//	  functionPriority = 1;
//    isTriggerActivated = 0;
//	  isGlobal = 1;
//	  curatorCanAttach = 1;
//};
