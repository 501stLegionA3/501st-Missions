b2ForceWalk={

if (!local _vic) exitWith {};

 params ["_obj"];
_obj forceWalk true;
};

["SWOP_CIS_superdroid_B2", "init",b2ForceWalk, true, [], true] call CBA_fnc_addClassEventHandler; 
