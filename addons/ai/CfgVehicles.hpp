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

    class GVAR(moduleHunterAi): Module_F {
        author = "cineafx";
        category = QGVAR(moduleAi);
        displayName = "Hunter Ai 2.3";
        icon = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa"
        scope = 1;  //show in editor
        scopeCurator = 2;
        isGlobal = 0; //run on server
        isTriggerActivated  = 0; //Wait for triggers
        isDisposable = 0;
        functionPriority = 0;
        curatorCanAttach = 0;
        function = QFUNC(moduleHunterAi);
        class Arguments {};
        class ModuleDescription: ModuleDescription {
            description = "Clear the inventory of all vehicles";
            sync[] = {};
        };
    };
};
