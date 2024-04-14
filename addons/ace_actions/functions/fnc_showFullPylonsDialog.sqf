#include "script_component.hpp"
/*
 * Author: 654wak654 (with adjustments from cineafx for this mod)
 * Shows the aircraft loadout dialog for given aircraft.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: Is curator. Disables time and resource requirements. <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle ace_player] call ace_pylons_fnc_showDialog
 *
 * Public: Yes
 */

params ["_aircraft", ["_isCurator", false]];

if (_isCurator && {!(["ace_zeus"] call ace_common_fnc_isModLoaded)}) exitWith { WARNING("ace_zeus not loaded"); };

if !(typeOf _aircraft in ace_pylons_aircraftWithPylons) exitWith {
    if (_isCurator) then {
        ["STR_ACE_pylons_AircraftDoesntHavePylons"] call ace_zeus_fnc_showMessage;
    };
};

if (_isCurator && {!ace_pylons_enabledForZeus}) exitWith {
    ["STR_ACE_pylons_ConfigurePylonsDisabledForZeus"] call ace_zeus_fnc_showMessage;
};

private _currentUser = _aircraft getVariable ["ace_pylons_currentUser", objNull];
if (!isNull _currentUser) exitWith {
    [format [localize "STR_ACE_pylons_InUse", name _currentUser], false, 5] call ace_common_fnc_displayText;
};
_aircraft setVariable ["ace_pylons_currentUser", ace_player, true];
ace_pylons_currentAircraftNamespace setVariable [getPlayerUID ace_player, _aircraft, true];

ace_pylons_isCurator = _isCurator;
ace_pylons_currentAircraft = _aircraft;

createDialog "ace_pylons_DialogLoadout";
private _display = DISPLAY(ID_DIALOG);
_display displayAddEventHandler ["Unload", {_this call ace_pylons_fnc_onButtonClose}];

if (ace_pylons_rearmNewPylons || {_isCurator}) then {
    ctrlShow [ID_TEXT_BANNER, false];
};

private _config = configOf _aircraft;
private _pylonComponent = _config >> "Components" >> "TransportPylonsComponent";

ctrlSetText [ID_PICTURE_AIRCRAFT, getText (_pylonComponent >> "uiPicture")];

private _hasFRIES = getNumber (_config >> "ace_fastroping_enabled");
if (["ace_fastroping"] call ace_common_fnc_isModLoaded && {_hasFRIES > 1}) then {
    private _checkbox = _display displayCtrl ID_CHECKBOX_FRIES;
    private _fries = _aircraft getVariable ["ace_fastroping_FRIES", objNull];
    _checkbox cbSetChecked (!isNull _fries);
    _checkbox setVariable ["ace_pylons_originalState", !isNull _fries];
} else {
    ctrlShow [ID_CHECKBOX_FRIES, false];
    ctrlShow [ID_TEXT_FRIES, false];
};

ace_pylons_comboBoxes = [];
{
    private _combo = _display ctrlCreate ["ace_pylons_CtrlCombo", -1];
    private _picturePos = ctrlPosition (_display displayCtrl ID_PICTURE_AIRCRAFT);
    private _uiPos = getArray (_x >> "UIposition");
    MAP(_uiPos,if (_x isEqualType 0) then {_x} else {call compile _x}); // Handle string positions
    _combo ctrlSetPosition [
        (_picturePos select 0) + (_uiPos select 0),
        (_picturePos select 1) + (_uiPos select 1),
        0.1 * safezoneW,
        0.028 * safezoneH
    ];
    _combo ctrlCommit 0;

    _combo lbAdd localize "STR_ace_pylons_Empty";
    _combo lbSetData [0, ""];

    private _mag = (getPylonMagazines _aircraft) select _forEachIndex;
    // ---------- Start of modification compared to 654wak654 ----------
    private _mags = GVAR(allPylonMags);
    //private _mags = _aircraft getCompatiblePylonMagazines (_forEachIndex + 1);
    //private _userWhitelist = _aircraft getVariable [QGVAR(magazineWhitelist), _mags];
    //private _userBlacklist = _aircraft getVariable [QGVAR(magazineBlacklist), []];

    //_mags = _mags arrayIntersect _userWhitelist;
    //_mags = _mags - _userBlacklist;
    // ---------- End of modification compared to 654wak654 ----------

    private _index = 0;
    {
        _combo lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _combo lbSetData [_forEachIndex + 1, _x];
        private _description = getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort");
        _combo lbSetTooltip [_forEachIndex + 1, _description];

        if (_x == _mag) then {
            _index = _forEachIndex + 1;
        };
    } forEach _mags;
    _combo lbSetCurSel _index;
    _combo ctrlAddEventHandler ["LBSelChanged", {_this call ace_pylons_onComboSelChange}];
    // TODO: Allow pylon priority selection?

    private _mirroredIndex = getNumber (_x >> "mirroredMissilePos");

    private _button = controlNull;
    if (count allTurrets [_aircraft, false] > 0) then {
        _button = _display ctrlCreate ["ctrlButtonPictureKeepAspect", -1];
        private _turret = [_aircraft, _forEachIndex] call ace_common_fnc_getPylonTurret;
        [_button, false, _turret] call ace_pylons_fnc_onButtonTurret;
        _button ctrlAddEventHandler ["ButtonClick", {[_this select 0, true, []] call ace_pylons_fnc_onButtonTurret}];
        _button ctrlSetPosition [
            (_picturePos select 0) + (_uiPos select 0) - (0.0165 * safezoneW),
            (_picturePos select 1) + (_uiPos select 1),
            0.0165 * safezoneW,
            0.028 * safezoneH
        ];
        _button ctrlCommit 0;
    };

    ace_pylons_comboBoxes pushBack [_combo, _mirroredIndex - 1, _button, _index];
} forEach ("true" configClasses (_pylonComponent >> "Pylons"));

ace_pylons_defaultLoadoutNames = [];
{
    lbAdd [ID_LIST_LOADOUTS, getText (_x >> "displayName")];
    lbSetPicture [ID_LIST_LOADOUTS, _forEachIndex, "a3\data_f_jets\logos\jets_logo_small_ca.paa"];

    ace_pylons_defaultLoadoutNames pushBack getText (_x >> "displayName");
} forEach ("true" configClasses (_pylonComponent >> "Presets"));

{
    if ((_x select 3) == typeOf _aircraft) then {
        lbAdd [ID_LIST_LOADOUTS, _x select 0];
    };
} forEach (profileNamespace getVariable ["ace_pylons_aircraftLoadouts", []]);

private _displayName = getText (_config >> "displayName");
ctrlSetText [ID_TEXT_LISTTITLE, format [localize "STR_ACE_pylons_LoadoutsFor", _displayName]];

private _list = _display displayCtrl ID_LIST_LOADOUTS;
_list ctrlAddEventHandler ["LBSelChanged", {
    params ["_ctrl"];

    ctrlSetText [ID_EDIT_LOADOUTNAME, _ctrl lbText (lbCurSel _ctrl)];
    call ace_pylons_fnc_onNameChange;
}];

private _edit = _display displayCtrl ID_EDIT_LOADOUTNAME;
_edit ctrlAddEventHandler ["KeyUp", {_this call ace_pylons_fnc_onNameChange}];
_edit ctrlAddEventHandler ["KeyDown", {_this call ace_pylons_fnc_onNameChange}];

private _checkbox = _display displayCtrl ID_CHECKBOX_MIRROR;
_checkbox ctrlAddEventHandler ["CheckedChanged", {[(_this select 1) == 1] call ace_pylons_fnc_onPylonMirror}];

if (!ace_pylons_isCurator) then {
    [{
        isNull (ace_pylons_currentAircraft getVariable ["ace_pylons_currentUser", objNull]) ||
        {(ace_player distanceSqr ace_pylons_currentAircraft) > ace_pylons_searchDistanceSqr}
    }, {
        TRACE_3("disconnect/far",ace_pylons_currentAircraft,ace_player distance ace_pylons_currentAircraft,ace_pylons_currentAircraft getVariable "ace_pylons_currentUser");
        if ((ace_player distanceSqr ace_pylons_currentAircraft) > ace_pylons_searchDistanceSqr) then {
            [localize "STR_ACE_pylons_TooFar", false, 5] call ace_common_fnc_displayText;
        };
        call ace_pylons_fnc_onButtonClose;
    }] call CBA_fnc_waitUntilAndExecute;
};
