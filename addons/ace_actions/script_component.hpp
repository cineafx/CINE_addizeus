#define COMPONENT ace_actions
#define COMPONENT_BEAUTIFIED ACE_Actions
#include "\z\cine_addizeus\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ACE_ACTIONS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ACE_ACTIONS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ACE_ACTIONS
#endif

#include "\z\cine_addizeus\addons\main\script_macros.hpp"

#define ICON_CHECKED QUOTE(\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa)
#define ICON_UNCHECKED QUOTE(\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa)

#define CURATOR_SELECTED_UNITS (curatorSelected select 0)
#define CURATOR_SELECTED_INFANTRY ((curatorSelected select 0) select {_x isKindOf 'Man'})
#define CURATOR_SELECTED_ALLVEHICLES ((curatorSelected select 0) select {(_x isKindOf 'AllVehicles') && !(_x isKindOf 'Man')})
#define CURATOR_SELECTED_AIRVEHICLES ((curatorSelected select 0) select {(_x isKindOf 'Air') && !(_x isKindOf 'Man')})

#define TOGGLE_VAR_ACTION(CLASSNAME, DISPLAYNAME, UNITS, VARIABLENAME) class CLASSNAME##_reenable { \
    displayName = QUOTE(DISPLAYNAME); \
    condition = QUOTE((UNITS findIf {_x getVariable [ARR_2('VARIABLENAME',false)]}) != -1); \
    statement = QUOTE({_x setVariable [ARR_3('VARIABLENAME',false,true)]} forEach UNITS); \
    icon = ICON_UNCHECKED; \
  }; \
  class CLASSNAME##_disable { \
    displayName = QUOTE(DISPLAYNAME); \
    condition = QUOTE((UNITS findIf {!(_x getVariable [ARR_2('VARIABLENAME',false)])}) != -1); \
    statement = QUOTE({_x setVariable [ARR_3('VARIABLENAME',true,true)]} forEach UNITS); \
    icon = ICON_CHECKED; \
  };

// Taken from 654wake654 in the pylon addon of the ACE3 project (acemod/ACE3 #5517)
#define ID_DIALOG 654654
#define ID_TEXT_TITLEBAR 100
#define ID_BACKGROUND_DIALOG 110
#define ID_BACKGROUND_PICTURE 111
#define ID_PICTURE_AIRCRAFT 120
#define ID_CHECKBOX_MIRROR 130
#define ID_TEXT_MIRROR 140
#define ID_CHECKBOX_FRIES 141
#define ID_TEXT_FRIES 142
#define ID_TEXT_LISTTITLE 150
#define ID_LIST_LOADOUTS 160
#define ID_EDIT_LOADOUTNAME 170
#define ID_BUTTON_SAVE 180
#define ID_BUTTON_LOAD 190
#define ID_BUTTON_DELETE 200
#define ID_BUTTON_APPLY 210
#define ID_BUTTON_CLOSE 211
#define ID_TEXT_BANNER 220
