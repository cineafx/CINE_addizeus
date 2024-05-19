#include "script_component.hpp"

params[["_targets", []], ["_damageAmount", 0.5], ["_damageIterations", 50]];

_this spawn {
  params[["_targets", []], ["_damageAmount", 0.5], ["_damageIterations", 50]];

  for '_i' from 0 to _damageIterations do {
    {
      _x params["_target"];
        [
          _target,
          _damageAmount,
          selectRandom ['head', 'body', 'hand_l', 'hand_r', 'leg_l', 'leg_r'],
          selectRandom ['bullet', 'grenade', 'explosive', 'shell', 'vehiclecrash', 'backblast', 'stab', 'punch', 'falling', 'ropeburn']
        ] call ace_medical_fnc_addDamageToUnit;
    } forEach _targets;
    sleep 0.1;
  };
};
