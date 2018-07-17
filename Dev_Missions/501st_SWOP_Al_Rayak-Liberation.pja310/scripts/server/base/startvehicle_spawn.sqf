waitUntil { time > 1 };
waitUntil { !isNil "huron" };

private ["_IA_liberation_little_bird","_IA_liberation_little_bird_pad","_IA_liberation_boat","_IA_liberation_boat_spawn"];

for [{_i=0}, {!isNil ("littlebird_" + str _i)}, {_i = _i + 1}] do {
	_IA_liberation_little_bird_pad = missionNamespace getVariable ("littlebird_" + str _i);
	_IA_liberation_little_bird = IA_liberation_little_bird_classname createVehicle [((getposATL _IA_liberation_little_bird_pad) select 0),((getposATL _IA_liberation_little_bird_pad) select 1),((getposATL _IA_liberation_little_bird_pad) select 2) + 0.1];
	_IA_liberation_little_bird enableSimulationGlobal false;
	_IA_liberation_little_bird allowdamage false;
	_IA_liberation_little_bird setposATL [((getposATL _IA_liberation_little_bird_pad) select 0),((getposATL _IA_liberation_little_bird_pad) select 1),((getposATL _IA_liberation_little_bird_pad) select 2) + 0.1];
	_IA_liberation_little_bird setDir (getDir _IA_liberation_little_bird_pad);
	sleep 0.5;
	_IA_liberation_little_bird enableSimulationGlobal true;
	_IA_liberation_little_bird setDamage 0;
	_IA_liberation_little_bird allowdamage true;
	_IA_liberation_little_bird setVariable ["IA_liberation_preplaced", true, true];
};

for [{_i=0}, {!isNil ("boat_" + str _i)}, {_i = _i + 1}] do {
	_IA_liberation_boat_spawn = missionNamespace getVariable ("boat_" + str _i);
	_IA_liberation_boat = IA_liberation_boat_classname createVehicle [((getposATL _IA_liberation_boat_spawn) select 0),((getposATL _IA_liberation_boat_spawn) select 1),((getposATL _IA_liberation_boat_spawn) select 2) + 0.1];
	_IA_liberation_boat enableSimulationGlobal false;
	_IA_liberation_boat allowdamage false;
	_IA_liberation_boat setposATL (getposATL _IA_liberation_boat_spawn);
	_IA_liberation_boat setDir (getDir _IA_liberation_boat_spawn);
	sleep 0.5;
	_IA_liberation_boat enableSimulationGlobal true;
	_IA_liberation_boat setDamage 0;
	_IA_liberation_boat allowdamage true;
	_IA_liberation_boat setVariable ["IA_liberation_preplaced", true, true];
};

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Startvehicle spawn done by: %1", (name player)];_text remoteExec ["diag_log",2];};
