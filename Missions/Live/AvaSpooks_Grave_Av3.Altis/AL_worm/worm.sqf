// by ALIAS

fnc_avoid_worm ={
	private ["_danger_close","_op_dir","_chased_units","_fct","_reldir","_avoid_poz"];
	_danger_close = _this select 0;
	_chased_units = _this select 1;
	{
		_reldir = [_x, getPos _danger_close] call BIS_fnc_dirTo;
		_fct = [30,-30] call BIS_fnc_selectRandom;
		if (_reldir<180) then {_op_dir=_reldir+180 +_fct} else {_op_dir=_reldir-180+_fct};
		_avoid_poz = [getposATL _x,20+random 50, _op_dir] call BIS_fnc_relPos;
		_x doMove _avoid_poz;
		_x setSkill ["commanding", 1];
	} foreach _chased_units;
};

private ["_press_implicit_x","_press_implicit_y"];

if (!isServer) exitWith {};

_poz_worm = _this select 0;

_cap	= createVehicle ["Land_CanOpener_F",getmarkerpos _poz_worm,[],0,"CAN_COLLIDE"];
_coada	= createVehicle ["Land_CanOpener_F",getmarkerpos _poz_worm,[],0,"CAN_COLLIDE"];
_coada_01= createVehicle ["Land_CanOpener_F",getmarkerpos _poz_worm,[],0,"CAN_COLLIDE"];
_coada attachTo [_cap,[0,-1,1]];
_coada_01 attachTo [_coada,[0,-1,1]];
[_coada, true] remoteExec ["hideObjectGlobal",0,true];
[_coada_01, true] remoteExec ["hideObjectGlobal",0,true];

_hide_me = true;
while {_hide_me} do {
sleep 2;
_list_ai_in_range_worm = (position _cap) nearEntities [["Man","LandVehicle"],100];
	if (count _list_ai_in_range_worm > 0) then {
	_hide_me = false;
	_tgt_worm = _list_ai_in_range_worm call BIS_fnc_selectRandom;
		_dir_move = [getPos _cap,_tgt_worm] call BIS_fnc_dirTo;
		_dir_move = _dir_move+45;
		if (_dir_move<=90) then {
			_press_implicit_x = linearConversion [0, 90,_dir_move, 0, 1, true];
			_press_implicit_y = 1-_press_implicit_x;
		};

		if ((_dir_move>90)and(_dir_move<180)) then {
			_dir_move = _dir_move-90;
			_press_implicit_x = linearConversion [0, 90,_dir_move, 1, 0, true];
			_press_implicit_y = _press_implicit_x-1;
		};

		if ((_dir_move>180)and(_dir_move<270)) then {
			_dir_move = _dir_move-180;
			_press_implicit_x = linearConversion [0, 90,_dir_move, 0, -1, true];
			_press_implicit_y = (-1*_press_implicit_x)-1;
		};

		if ((_dir_move>270)and(_dir_move<360)) then {
			_dir_move = _dir_move-270;
			_press_implicit_x = linearConversion [0, 90,_dir_move, -1, 0, true];
			_press_implicit_y = 1+_press_implicit_x;
		};	
	[[_cap,_coada,_coada_01],"AL_worm\worm_effect.sqf"] remoteExec ["execvm",0,true];
	[[_cap,_coada],"AL_worm\worm_attack.sqf"] remoteExec ["execvm",0];
	_cap setposATL [getPosATL _cap select 0,getPosATL _cap select 1,2];
	_cap setVelocity [_press_implicit_x*5,_press_implicit_y*5,20+random 10];
	sleep 1;
	[_coada,["strigat",1000]] remoteExec ["say3d"];
	};
};
sleep 1;
enableCamShake false;
waitUntil {(getPosATL _cap select 2) < 1};
[_cap,["bump",500]] remoteExec ["say3d"];
addCamShake [1,4,23];
[[_cap,_coada],"AL_worm\worm_attack.sqf"] remoteExec ["execvm",0];
[[_cap],"AL_worm\bump.sqf"] remoteExec ["execvm",0];
sleep 1;

while {!isNull _cap} do 
{
_tgt_worm = [];
_list_ai_in_range_worm = (position _cap) nearEntities [["Man","LandVehicle"],150];
_tgt_worm = _list_ai_in_range_worm call BIS_fnc_selectRandom;
//hint str _list_ai_in_range_worm; 
//if (!isNull _tgt_worm) then {
if (count _list_ai_in_range_worm > 0) then {
//while {!isNull _tgt_worm} do {
//hint "baga";
if ((_tgt_worm distance _cap < 15)&&!(surfaceIsWater getPos _tgt_worm)) then 
{
	//hint "ATK";
	[_cap,_list_ai_in_range_worm] call fnc_avoid_worm;
	_dir_move = [getPos _cap,_tgt_worm] call BIS_fnc_dirTo;
	if (_dir_move<=90) then {
		_press_implicit_x = linearConversion [0, 90,_dir_move, 0, 1, true];
		_press_implicit_y = 1-_press_implicit_x;
	};

	if ((_dir_move>90)and(_dir_move<180)) then {
		_dir_move = _dir_move-90;
		_press_implicit_x = linearConversion [0, 90,_dir_move, 1, 0, true];
		_press_implicit_y = _press_implicit_x-1;
	};

	if ((_dir_move>180)and(_dir_move<270)) then {
		_dir_move = _dir_move-180;
		_press_implicit_x = linearConversion [0, 90,_dir_move, 0, -1, true];
		_press_implicit_y = (-1*_press_implicit_x)-1;
	};

	if ((_dir_move>270)and(_dir_move<360)) then {
		_dir_move = _dir_move-270;
		_press_implicit_x = linearConversion [0, 90,_dir_move, -1, 0, true];
		_press_implicit_y = 1+_press_implicit_x;
	};	
	_worm_salt = ["salt_08","salt_05"] call BIS_fnc_selectRandom;
	_cap setVelocity [_press_implicit_x*5,_press_implicit_y*5,15+random 10];
	[_coada,[_worm_salt,500]] remoteExec ["say3d"];
	sleep 0.5;
	waitUntil {(getPosATL _cap select 2) < 1};
	[[_cap,_coada],"AL_worm\worm_attack.sqf"] remoteExec ["execvm",0];
	_nearobj_wrom = nearestObjects [getposATL _cap, [], 15];
	{ if ((_x!=_cap)&&(_x!=_coada)&&(_x!=_coada_01)&&!(surfaceIsWater getPos _x)) then {if (_x isKindOf "LandVehicle") then {_x setVelocity [1+random 3,1+random 3,5+random 17]; _x setDammage ((getDammage _x) + 0.2)} else {_x setVelocity [1+random 3,1+random 3,1+random 5]}; _x setDammage ((getDammage _x) + 0.2)};} foreach _nearobj_wrom;
	sleep 1;
	[_cap,_list_ai_in_range_worm] call fnc_avoid_worm;
	if (((getPosatl _cap select 2) <0)or((getPosatl _cap select 2) >2)) then {_cap setpos ([getpos _cap,0.5,50,10,0,1,0] call BIS_fnc_findSafePos)};
	sleep 8; // anomaly refresh
	_cap setposATL [getPosATL _cap select 0,getPosATL _cap select 1,2];
};

if ((!isNull _tgt_worm)&&(_tgt_worm distance _cap > 15)&&!(surfaceIsWater getPos _tgt_worm)) then 
{
	_sunet_deplas=["move_01","move_02","move_03","move_04","move_05","move_06","move_07","move_08","move_09","move_10","move_11","move_12","move_13","move_14","move_15"] call BIS_fnc_selectRandom;
	//hint str _sunet_deplas;
	[_cap,_list_ai_in_range_worm] call fnc_avoid_worm;
	_fct_move = 8+random 8;
	_fct = [+10+random -35,10+random 45] call BIS_fnc_selectRandom;
	_dir_move = [getPos _cap,_tgt_worm] call BIS_fnc_dirTo;
	_dir_move = _dir_move+_fct;
	if (_dir_move<=90) then {
		_press_implicit_x = linearConversion [0, 90,_dir_move, 0, 1, true];
		_press_implicit_y = 1-_press_implicit_x;
	};

	if ((_dir_move>90)and(_dir_move<180)) then {
		_dir_move = _dir_move-90;
		_press_implicit_x = linearConversion [0, 90,_dir_move, 1, 0, true];
		_press_implicit_y = _press_implicit_x-1;
	};

	if ((_dir_move>180)and(_dir_move<270)) then {
		_dir_move = _dir_move-180;
		_press_implicit_x = linearConversion [0, 90,_dir_move, 0, -1, true];
		_press_implicit_y = (-1*_press_implicit_x)-1;
	};

	if ((_dir_move>270)and(_dir_move<360)) then {
		_dir_move = _dir_move-270;
		_press_implicit_x = linearConversion [0, 90,_dir_move, -1, 0, true];
		_press_implicit_y = 1+_press_implicit_x;
	};
	[_coada,[_sunet_deplas,500]] remoteExec ["say3d"];
	_cap setVelocity [_press_implicit_x*_fct_move,_press_implicit_y*_fct_move,5+random 5];
	sleep 2;
	_cap setposATL [getPosATL _cap select 0,getPosATL _cap select 1,2];
};
//};
} else {sleep 10};

};