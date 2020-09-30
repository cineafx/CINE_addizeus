#include "script_component.hpp"
/*
 * Author: cineafx
 * Set predefined loadouts.
 * The dialog will take "getUnitLoadout" formatted arrays
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [] call CINE_addizeus_gear_fnc_setSaved
 *
 * Public: [No]
 */

//save loadouts to be able to use them later
profileNamespace setVariable [QGVAR(gearDefault), ctrlText CT_GEAR_DEFAULT];
profileNamespace setVariable [QGVAR(gearLeader), ctrlText CT_GEAR_LEADER];
profileNamespace setVariable [QGVAR(gearAT), ctrlText CT_GEAR_AT];
profileNamespace setVariable [QGVAR(gearAA), ctrlText CT_GEAR_AA];
profileNamespace setVariable [QGVAR(gearAR), ctrlText CT_GEAR_AR];

closeDialog 1;

true;
