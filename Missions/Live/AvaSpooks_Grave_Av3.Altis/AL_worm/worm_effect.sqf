// by ALIAS

if (!hasInterface) exitWith {};

_head_worm = _this select 0;
_tail_worm = _this select 1;
_voce_idle = _this select 2;

[_voce_idle, true] remoteExec ["hideObjectGlobal",0,true];

[_voce_idle] spawn {
	_tail_voice = _this select 0;
	while {!isnull _tail_voice} do 
	{
	_tail_voice say3D ["idle_02", 500];
	sleep 7.5;
	};
};

while {!isnull _head_worm} do 
{
if (sunOrMoon==0) then 
{
	_smoke_head = "#particlesource" createVehicleLocal (getPosATL _head_worm);
	_smoke_head setParticleCircle [0, [0, 0, 0]];
	_smoke_head setParticleRandom [3, [0.25, 0.25, 0.25], [0.1, 0.1, 0.1], 5, 0.25, [0.1, 0.1, 0.05, 0.1], 1, 0];
	_smoke_head setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 11, [0, 0, 0], [0, 0, 1], 7, 11, 7.9, 0.0001, [4, 3, 0.5], [[0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 1]], [0.08], 1, 0, "", "", _head_worm,0,true,0.1,[[0,0,0,0]]];
	_smoke_head setDropInterval 0.01;
	// EFECTE SECUNDARE
	// fulgere
	_spot_lit = "#lightpoint" createVehicle (getPosATL _head_worm); 
	_spot_lit lightAttachObject [_head_worm, [0.1,0.1,5]];
	_spot_lit setLightUseFlare false;
	_spot_lit setLightDayLight true;
	_spot_lit setLightFlareSize 1;
	_spot_lit setLightFlareMaxDistance 1500;
	_spot_lit setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 50, /*quadratic*/ 1000, /*hardlimitstart*/1,/* hardlimitend*/50];

	while {player distance _head_worm <2000} do
	{
	_r_col_burp=random 1;
	_g_col_burp=random 1;
	_b_col_burp=random 1;
	_spot_lit setLightColor [_r_col_burp,_g_col_burp,_b_col_burp];
	_spot_lit setLightAmbient [_g_col_burp,_r_col_burp,_b_col_burp];
	_flick = 1+floor (random 9);
	_fl_inc = 0;	
	while {_fl_inc<_flick} do 
		{
			_spot_lit setLightBrightness (10+random 30);
			_fl_inc = _fl_inc+1;
			sleep 0.1+random 0.2;
		};
	_spot_lit setLightBrightness 0;
	sleep 3+ (random 10);
	};
	deleteVehicle _smoke_head;
	deleteVehicle _spot_lit;
} else {
	_smoke_head = "#particlesource" createVehicleLocal (getPosATL _head_worm);
	_smoke_head setParticleCircle [0, [0, 0, 0]];
	_smoke_head setParticleRandom [3, [0.25, 0.25, 0.25], [0.1, 0.1, 0.1], 5, 0.25, [0.1, 0.1, 0.05, 0.1], 1, 0];
	_smoke_head setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 11, [0, 0, 0], [0, 0, 1], 7, 11, 7.9, 0.0001, [4, 3, 0.5], [[0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 1]], [0.08], 1, 0, "", "", _head_worm,0,true,0.1,[[0,0,0,0]]];
	_smoke_head setDropInterval 0.01;
	while {player distance _head_worm <2000} do	{sleep 30};
	deleteVehicle _smoke_head;
};

waitUntil {player distance _head_worm <2000};
};