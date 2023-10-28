// by ALIAS

if (!hasInterface) exitWith {};

_head_worm = _this select 0;

_blast_dust = "#particlesource" createVehicleLocal (getPosATL _head_worm);
_blast_dust setParticleCircle [3, [-3, -3, 0]];
_blast_dust setParticleRandom [2, [2, 2, 0], [-15, -15, 0], 5, 1, [0, 0, 0, 1], 1, 0];
_blast_dust setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.1], 7, 10, 7.9, 0.005, [5, 7, 13], [[0.3, 0.27, 0.15, 1], [0.3, 0.27, 0.15, 0.5], [0.3, 0.27, 0.15, 0]], [0.08], 1, 0, "", "", _head_worm];
_blast_dust setDropInterval 0.002;	
sleep 0.2;
deleteVehicle _blast_dust;