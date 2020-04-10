#include "script_component.hpp"
/*
 * Author: Kex & cineafx
 * Let the curator select units and submit the selection
 * Sets the EGVAR(common, selectedUnits)
 *   nil during selection
 *   [] on cancel
 *   [unit1, unit2, unit3, ...] on selection
 *
 * Modification from Achilles\functions\fn_SelectUnits.sqf
 * https://github.com/ArmaAchilles/Achilles/blob/master/@AresModAchillesExpansion/addons/ui_f/functions/common/fn_SelectUnits.sqf
 *
 * Arguments:
 * 0: Tells what has to be selected <STRING>
 * 1: If true only one object is returned. Otherwise the array of all groups / objects is retruned. <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [{
 *   // Wait for done
 *   !isNil QEGVAR(common, selectedUnits)
 * },{
 *   // Do stuff if done
 *   systemChat str EGVAR(common, selectedUnits)
 * }] call CBA_fnc_waitUntilAndExecute;
 * ["units"] call EFUNC(common, selectedUnits);
 *
 * Public: No
 */

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

params[["_type", "Objects", [""]], ["_single", false, [false]]];

disableSerialization;
private _display = findDisplay IDD_RSCDISPLAYCURATOR;
private _ctrlMessage = _display displayCtrl IDC_RSCDISPLAYCURATOR_FEEDBACKMESSAGE;

GVAR(submit_selection) = nil;
GVAR(selectedUnits) = nil;

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
//waitUntil {!isNil QGVAR(SUBMIT_SELECTION) or {isNull findDisplay 312}};

[{
  //condition
  !isNil QGVAR(SUBMIT_SELECTION) || {isNull findDisplay 312}
}, {
  //action
  params ["_display", "_handler_id", "_single"];


  // remove the key handler and the message
  _display displayRemoveEventHandler ["KeyDown", _handler_id];
  _ctrlMessage ctrlSetFade 1;
  _ctrlMessage ctrlCommit 0.5;

  // if escape was pressed
  if (!isNil QGVAR(SUBMIT_SELECTION) && {! GVAR(SUBMIT_SELECTION) }) exitWith {
    ["STR_AMAE_SELECTION_CANCLLED"] call ACE_ZEUS_fnc_showMessage;
    GVAR(selectedUnits) = [];
  };

  // if enter was pressed
  ["STR_AMAE_SELECTION_SUBMITTED"] call ACE_ZEUS_fnc_showMessage;

  if (_single) then
  {
    GVAR(selectedUnits) = [objNull, (curatorSelected select 0) select 0] select (count (curatorSelected select 0) > 0)
  } else {
    GVAR(selectedUnits) = curatorSelected select 0;
  };
  TRACE_1("Selected units", GVAR(selectedUnits))

}, [_display, _handler_id, _single]] call CBA_fnc_waitUntilAndExecute;
