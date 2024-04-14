#include "script_component.hpp"
/*
 * Author: Kex & cineafx
 * Let the curator select units and submit the selection
 * Sets the EGVAR(common, selectedUnits)
 *   nil during selection
 *   [] on cancel
 *   [unit1, unit2, unit3, ...] on selection
 *
 * Selection types can be:
 * - objects
 * - groups
 * - waypoints
 * - marker
 * - units (Using "crew _x". This will add units and all crew from vehicles. Therefore filtering like using "_x kindOf "Man"")
 * - vehicles (Using "vehicle _x" and "_x isKindOf "AllVehicles"" and "!(_x isKindOf "Man")". Therefore filtering only vehicles. Not sure if the "vehicle _x" part is needed.)
 * Selection string is case insensitive for the matching. The case is only used for the feedback message.
 * Other strings will return an empty array.
 *
 * Modification from Achilles\functions\fn_SelectUnits.sqf
 * https://github.com/ArmaAchilles/Achilles/blob/master/@AresModAchillesExpansion/addons/ui_f/functions/common/fn_SelectUnits.sqf
 *
 * Arguments:
 * 0: Tells what has to be selected. <STRING> (Default: Objects)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["units"] call EFUNC(common,selectedUnits);
 * [{
 *   // Wait for done
 *   !isNil QEGVAR(common, selectedUnits)
 * },{
 *   // Do stuff if done
 *   systemChat str EGVAR(common,selectedUnits)
 * }] call CBA_fnc_waitUntilAndExecute;
 *
 * Public: No
 */

#include "\A3\ui_f_curator\ui\defineResinclDesign.inc"

params[["_type", "Objects", [""]]];

disableSerialization;
private _display = findDisplay IDD_RSCDISPLAYCURATOR;
private _ctrlMessage = _display displayCtrl IDC_RSCDISPLAYCURATOR_FEEDBACKMESSAGE;

GVAR(submit_selection) = nil;
GVAR(selectedUnits) = nil;

// Inform curator what he has to do
playSound "FD_Finish_F";
[[ QUOTE(ADDON) , "SelectionOption"],15,"not isNil "QGVAR(submit_selection)"",35,"not isNil "QGVAR(SUBMIT_SELECTION)"",true,true] call BIS_fnc_advHint;

_ctrlMessage ctrlSetText toUpper (format ["Select %1 to which the module should be applied!", _type]);
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

[{
  //condition
  !isNil QGVAR(SUBMIT_SELECTION) || {isNull findDisplay 312}
}, {
  //action
  params ["_display", "_handler_id", "_type"];

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

  switch (toLower _type) do {
    case "object": {
      GVAR(selectedUnits) = curatorSelected select 0;
    };
    case "groups": {
      GVAR(selectedUnits) = curatorSelected select 1;
    };
    case "waypoints": {
      GVAR(selectedUnits) = curatorSelected select 2;
    };
    case "markers": {
      GVAR(selectedUnits) = curatorSelected select 3;
    };
    case "units": {
      private _objects = (curatorSelected select 0);
      private _units = [];
      {
        _units append (crew _x);
      } forEach _objects;
      // filter duplicates
      _units = _units arrayIntersect _units;
      GVAR(selectedUnits) = _units;
    };
    case "vehicles": {
      private _allVehicles = (curatorSelected select 0) select {_x isKindOf "AllVehicles"};
      _allVehicles apply {vehicle _x};
      // filter duplicates
      _allVehicles = _allVehicles arrayIntersect _allVehicles;
      _allVehicles = _allVehicles select {!(_x isKindOf "Man")};
      GVAR(selectedUnits) = _allVehicles;
    };
    default {
      GVAR(selectedUnits) = [];
    };
  };
  TRACE_1("Selected units",GVAR(selectedUnits))

}, [_display, _handler_id, _type]] call CBA_fnc_waitUntilAndExecute;
