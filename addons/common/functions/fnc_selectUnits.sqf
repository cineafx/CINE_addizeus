#include "script_component.hpp"
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	AUTHOR: Kex
//	DATE: 5/1/16
//	VERSION: 1.0
//	FILE: Achilles\functions\fn_SelectUnits.sqf
//  DESCRIPTION: Let the curator select units and submit the selection
//
//	ARGUMENTS:
//	_this select 0:		STRING	- (Default: localize "STR_AMAE_OBJECTS") Tells what has to be selected
//	_this select 1:		BOOL	- (Default: false) If true only one object is returned. Otherwise the array of all groups / objects is returned.
//
//	RETURNS:
//	_this:				OBJECT or GROUP or ARRAY of objects or groups or NIL if the selection was cancled
//
//	Example:
//	_selected_units_array = ["units"] call Achilles_fnc_SelectUnits;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//https://github.com/ArmaAchilles/Achilles/blob/master/@AresModAchillesExpansion/addons/ui_f/functions/common/fn_SelectUnits.sqf

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

params[["_type", "Objectives", [""]], ["_single", false, [false]]];

disableSerialization;
private _display = findDisplay IDD_RSCDISPLAYCURATOR;
private _ctrlMessage = _display displayCtrl IDC_RSCDISPLAYCURATOR_FEEDBACKMESSAGE;

GVAR(submit_selection) = nil;

// Inform curator what he has to do
playSound "FD_Finish_F";
[[ QUOTE(ADDON) , "SelectionOption"],15,"not isNil "QGVAR(submit_selection)"",35,"not isNil "QGVAR(SUBMIT_SELECTION)"",true,true] call BIS_fnc_advHint;

_ctrlMessage ctrlSetText toUpper (format [localize "STR_AMAE_SELECT_X_APPLIED_TO_MODULE",_type]);
_ctrlMessage ctrlSetFade 1;
_ctrlMessage ctrlCommit 0;
_ctrlMessage ctrlSetFade 0;
_ctrlMessage ctrlCommit 0.1;

// Add key event handler
private _handler_id = _display displayAddEventHandler ["KeyDown",
{
  private _key = _this select 1;
  if (_key == 28) then { GVAR(SUBMIT_SELECTION) = true; true} else {false};
  if (_key == 1) then { GVAR(SUBMIT_SELECTION) = false; true} else {false};
}];

// executed when the choice is submitted or cancled
waitUntil {!isNil QGVAR(SUBMIT_SELECTION) or {isNull findDisplay 312}};

// remove the key handler and the message
_display displayRemoveEventHandler ["KeyDown", _handler_id];
_ctrlMessage ctrlSetFade 1;
_ctrlMessage ctrlCommit 0.5;

// if escape was pressed
if (!isNil QGVAR(SUBMIT_SELECTION) && {! GVAR(SUBMIT_SELECTION) }) exitWith {["STR_AMAE_SELECTION_CANCLLED"] call ACE_ZEUS_fnc_showMessage; nil};

// if enter was pressed
["STR_AMAE_SELECTION_SUBMITTED"] call ACE_ZEUS_fnc_showMessage;

if (_single) exitWith
{
  [objNull, (curatorSelected select 0) select 0] select (count (curatorSelected select 0) > 0)
};
curatorSelected select 0;
