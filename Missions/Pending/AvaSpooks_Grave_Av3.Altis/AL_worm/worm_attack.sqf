// by ALIAS

private ["_crater_impact"];

if (!hasInterface) exitWith {};

_head_worm = _this select 0;
_tail_worm = _this select 1;

enableCamShake true;
_worm_impact = ["impact_30","impact_27"] call BIS_fnc_selectRandom;
_head_worm say3D [_worm_impact, 500];

_blast_dust = "#particlesource" createVehicleLocal (getPosATL _head_worm);
_blast_dust setParticleCircle [6, [-3, -3, 0]];
_blast_dust setParticleRandom [2, [2, 2, 0], [-15, -15, 0], 5, 1, [0, 0, 0, 1], 1, 0];
_blast_dust setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 0.1], 7, 10, 7.9, 0.005, [5, 7, 13], [[0.3, 0.27, 0.15, 1], [0.3, 0.27, 0.15, 0.5], [0.3, 0.27, 0.15, 0]], [0.08], 1, 0, "", "", _head_worm];
_blast_dust setDropInterval 0.002;	

_dist_worm = player distance _head_worm;
_shake_power = linearConversion [0, 1000,_dist_worm, 5, 0, true];
addCamShake [_shake_power,4,13+(random 33)];

_bolovani_blast = "#particlesource" createVehicleLocal (getPosATL _head_worm);
_bolovani_blast setParticleCircle [2, [0, 0, 0]];
_bolovani_blast setParticleRandom [1, [0.25, 0.25, 0], [10, 10, 15], 0.5, 0.25, [0, 0, 0, 0.1], 0, 0];
_bolovani_blast setParticleParams [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1], "", "SpaceObject", 1, 10, [0, 0, 0], [0, 0, 13], 3, 20, 7.9, 0.0001, [.6, .6, .6], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _head_worm,0,true,0.3,[[0,0,0,0]]];
_bolovani_blast setDropInterval 0.007;

sleep 0.25;
deletevehicle _bolovani_blast;
_crater_impact = createVehicle ["CraterLong",[getpos _head_worm select 0,getpos _head_worm select 1,0],[],0,"CAN_COLLIDE"];
_crater_impact setDir (random 360);
sleep 0.5;
deletevehicle _blast_dust;

if (player distance _head_worm < 1500) then {
_after_effect = ["post_impact_01","post_impact_02","post_impact_03","post_impact_04"] call BIS_fnc_selectRandom;
playsound _after_effect;
};
sleep 300;
deletevehicle _crater_impact;