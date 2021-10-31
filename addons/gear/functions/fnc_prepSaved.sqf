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
 * [] call CINE_addizeus_gear_fnc_prepSaved
 *
 * Public: [No]
 */

[{
  //get previously used loadouts
  ctrlSetText [CT_GEAR_DEFAULT, profileNamespace getVariable [QGVAR(gearDefault), "[]"]];
  ctrlSetText [CT_GEAR_LEADER, profileNamespace getVariable [QGVAR(gearLeader), "[]"]];
  ctrlSetText [CT_GEAR_AT, profileNamespace getVariable [QGVAR(gearAT), "[]"]];
  ctrlSetText [CT_GEAR_AA, profileNamespace getVariable [QGVAR(gearAA), "[]"]];
  ctrlSetText [CT_GEAR_AR, profileNamespace getVariable [QGVAR(gearAR), "[]"]];
}, []] call CBA_fnc_execNextFrame;

true;
