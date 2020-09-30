class CfgVehicles
{
    class Logic;
    class Module_F: Logic {
        class AttributesBase
        {
            class Default;
            class Edit; // Default edit box (i.e., text input field)
            class Combo; // Default combo box (i.e., drop-down menu)
            class Checkbox; // Default checkbox (returned value is Bool)
            class CheckboxNumber; // Default checkbox (returned value is Number)
            class ModuleDescription; // Module description
            class Units; // Selection of units on which the module is applied
        };
        class ArgumentsBaseUnits {};
        class ModuleDescription {};
    };

    class GVAR(moduleClearAllInventories): Module_F {
        author = "cineafx";
        category = QGVAR(moduleVehicles);
        displayName = "Clear all vehicles inventories";
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 0;
        function = QFUNC(moduleClearAllInventories);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Clear the inventory of all vehicles";
            sync[] = {};
        };
    };

    class GVAR(moduleClearInventory): Module_F {
        author = "cineafx";
        category = QGVAR(moduleVehicles);
        displayName = "Clear vehicle Inventory (selection)";
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 1;
        function = QFUNC(moduleClearInventory);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Clear the inventory of selected vehicles";
            sync[] = {};
        };
    };

    class GVAR(moduleAllowCrew): Module_F {
        author = "cineafx";
        category = QGVAR(moduleVehicles);
        displayName = "Allow crew in immobile vehicles (toggle)";
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 0;
        function = QFUNC(moduleAllowCrew);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Allows crew to stay in immobilized vehicles. Making them fight until the vehicles cooks off / explodes.";
            sync[] = {};
        };
    };

    class GVAR(moduleDisableCookoff): Module_F {
        author = "cineafx";
        category = QGVAR(moduleVehicles);
        displayName = "Disable ACE Cookoff";
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 0;
        function = QFUNC(moduleDisableCookoff);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Disables ACE Cookoff mission wide. Cannot be turned back on currently!";
            sync[] = {};
        };
    };
};
