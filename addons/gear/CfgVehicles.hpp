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

    class GVAR(moduleApplySaved): Module_F {
        author = "cineafx";
        category = QGVAR(moduleGear);
        displayName = "Apply saved loadout";
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 1;
        function = QFUNC(moduleApplySaved);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Apply the saved loadout to a selection of units.";
            sync[] = {};
        };
    };
    class GVAR(moduleSetSaved): Module_F {
        author = "cineafx";
        category = QGVAR(moduleGear);
        displayName = "Set saved loadout";
        //icon = QPATHTOF(ui\Icon_Module_Repair_ca.paa);
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated = 0; //Wait for triggers
        functionPriority = 0;
        isDisposable = 0;
        function = QFUNC(moduleSetSaved);
        //curatorInfoType = QGVAR(RscSetSaved);
        class ModuleDescription {
            description = "Save a loadout for the gear script.";
            sync[] = {};
        };
    };
};
