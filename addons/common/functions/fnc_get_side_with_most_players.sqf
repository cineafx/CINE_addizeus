#include "script_component.hpp"
/*
 * Author: cineafx
 * Returns the side with currently the most players in multiplayer.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * Side with most players <NUMBER>
 *
 * Example:
 * [] call CINE_addizeus_common_fnc_get_side_with_most_players
 *
 * Public: [No]
 */

//create an array with [sideID used in this script, player numbers of that side]
private _west        = [1, playersNumber west];
private _east        = [2, playersNumber east];
private _independent = [4, playersNumber independent];

//select the max
//This line makes sure that if no players are connected (outside the zeus) it keeps all radios
private _max = [7, 0];
if (_west # 1 > _max # 1) then {
  _max = _west;
};
if (_east # 1 > _max # 1) then {
  _max = _east;
};
if (_independent # 1 > _max # 1) then {
  _max = _independent;
};

_max # 0
