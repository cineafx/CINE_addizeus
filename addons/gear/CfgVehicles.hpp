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

    class GVAR(test): Module_F {
        author = "cineafx";
        category = QGVAR(moduleGear);
        displayName = "cine test";
        //icon = QPATHTOF(UI\Icon_Module_Make_Unit_Surrender_ca.paa);
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 1;
        function = QFUNC(moduleTest);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "test description";
            sync[] = {};
        };
    };
    class ACE_MODULE: Module_F {};
    class GVAR(test2): ACE_MODULE {
        author = "cineafx";
        category = QGVAR(moduleGear);
        displayName = "test 2";
        //icon = QPATHTOF(ui\Icon_Module_Repair_ca.paa);
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated = 0; //Wait for triggers
        functionPriority = 0;
        isDisposable = 0;
        function = QFUNC(moduleTest);
        curatorInfoType = QGVAR(RscDisplayTest);
        class ModuleDescription {
            description = "test 2 description";
            sync[] = {};
        };
    };
};
