if (!isServer) exitWith {};

params ["_index", "_clientID"];

private ["_time","_nextState"];

logiError = 0;

if ((((IA_liberation_logistics select _index) select 7) == 0) || (((IA_liberation_logistics select _index) select 7) == 5) || (((IA_liberation_logistics select _index) select 7) == 6)) exitWith {logiError = 1;(localize "STR_LOGISTIC_STANDBY_ERROR") remoteExec ["hint",_clientID]; _clientID publicVariableClient "logiError";};

switch ((IA_liberation_logistics select _index) select 7) do {
	case 1;
	case 3: {
		_time = ceil (((ceil ((((IA_liberation_logistics select _index) select 6) select 0) / 100)) + (ceil ((((IA_liberation_logistics select _index) select 6) select 1) / 100)) + (ceil ((((IA_liberation_logistics select _index) select 6) select 2) / 100))) / 3);
		_time = _time + 1;
	};
	case 2;
	case 4: {
		_time = ceil ((((IA_liberation_logistics select _index) select 2) distance2D ((IA_liberation_logistics select _index) select 3)) / 400);
		_time = _time - ((IA_liberation_logistics select _index) select 8);

		_time = _time + (ceil (((ceil ((((IA_liberation_logistics select _index) select 6) select 0) / 100)) + (ceil ((((IA_liberation_logistics select _index) select 6) select 1) / 100)) + (ceil ((((IA_liberation_logistics select _index) select 6) select 2) / 100))) / 3));
		_time = _time + 1;
	};
};

_nextState = switch ((IA_liberation_logistics select _index) select 7) do {case 1; case 2: {5}; case 3; case 4: {6};};

IA_liberation_logistics set [_index,[
	(IA_liberation_logistics select _index) select 0,
	(IA_liberation_logistics select _index) select 1,
	(IA_liberation_logistics select _index) select 2,
	(IA_liberation_logistics select _index) select 3,
	(IA_liberation_logistics select _index) select 4,
	(IA_liberation_logistics select _index) select 5,
	(IA_liberation_logistics select _index) select 6,
	_nextState,
	_time,
	0
]];
