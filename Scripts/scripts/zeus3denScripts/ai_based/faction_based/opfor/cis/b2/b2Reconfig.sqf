//created by Namenai
b2ForceWalk={
 params ["_obj"];
_obj forceWalk true;
};

["SWOP_CIS_superdroid_B2", "init",b2ForceWalk, false, [], false] call CBA_fnc_addClassEventHandler; 
