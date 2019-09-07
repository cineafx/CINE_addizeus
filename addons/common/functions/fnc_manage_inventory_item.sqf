#include "script_component.hpp"
/*
 * Author: cineafx
 * Makes sure the user has one or zero of *item type* or *parent item type*.
 * E.g.
 * TFAR_anprc152_1 parent is TFAR_anprc152 while TFAR_anprc152 parent is ItemRadio ...
 * At the beginning of the mission the TFAR plugin hasn't converted all TFAR_anprc152 into the individual radios.
 *
 * Arguments:
 * unit <OBJECT>
 * item type <STRING>
 * parent item type <STRING>
 * one or none <BOOL>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_common_fnc_manage_inventory_item
 *
 * Public: [No]
 */

params["_unit", "_item", "_parentItem", "_giveItem"];

_SW_items = (items _unit + assignedItems _unit) apply {
  _parent = configName inheritsFrom (configFile >> "CfgWeapons" >> _x);
  if (_parent == _parentItem) then {
    configName (configFile >> "CfgWeapons" >> _x);
  } else {
    _parent;
  };
};

if (_giveItem) then {
  if ({_x find _item >= 0} count _SW_items == 0) then {
    _unit addItem _item;
  };
} else {
  {
    if (_x find _item >= 0) then {
      _unit unassignItem _x;
      _unit removeItem _x;
    };
  } forEach items _unit + assignedItems _unit;
};

true;
