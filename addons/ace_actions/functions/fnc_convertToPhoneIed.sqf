params ["_explosive"];

private _ammo = getText (configFile >> "CfgVehicles" >> typeOf _explosive >> "explosive");
private _mag = getText (configFile >> "CfgAmmo" >> _ammo >> "ace_explosives_magazine");

private _triggerTypes = [_mag] call ace_explosives_fnc_triggerType;
private _magTriggers = configFile >> "CfgMagazines" >> _mag >> "ACE_Triggers";

{
  private _text = "";
  if(isText(_magTriggers >> configName _x >> "displayName")) then {
    _text = getText(_magTriggers >> configName _x >> "displayName");
  } else {
    _text = getText(_x >> "displayName");
  };
  if (_text == "Cellphone") exitWith {
    [_explosive, _mag, "Cellphone"] call ACE_Explosives_fnc_selectTrigger;
    //because we don't have the _hasRequired items as zeus we need to manually add it to the speed dial
    private _lastIndex = (count ace_explosives_CellphoneIEDs) - 1;
    private _lastAddedCode = (ace_explosives_CellphoneIEDs select _lastIndex) select 1;
    [format ["IED %1", _lastIndex + 1], _lastAddedCode] call ace_explosives_fnc_addToSpeedDial;

    true;
  };
} forEach _triggerTypes;

[objNull, format ["%1 does not support the 'Cellphone' trigger", _mag]] call bis_fnc_showCuratorFeedbackMessage;

false;
