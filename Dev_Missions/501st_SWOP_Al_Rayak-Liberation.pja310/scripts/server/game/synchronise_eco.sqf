sync_eco = []; publicVariable "sync_eco";

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync eco starts intitializing on: %1", (name player)];_text remoteExec ["diag_log",2];};

waitUntil{!isNil "save_is_loaded"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync eco: save_is_loaded"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_production"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync eco: IA_liberation_production"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_logistics"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync eco: IA_liberation_logistics"];_text remoteExec ["diag_log",2];};

_IA_liberation_production_old = [0];
_IA_liberation_logistics_old = [0];

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync eco intitializing finished on: %1", (name player)];_text remoteExec ["diag_log",2];};

while {true} do {

	waitUntil {sleep 0.25;
		!(_IA_liberation_production_old isEqualTo IA_liberation_production)
		|| !(_IA_liberation_logistics_old isEqualTo IA_liberation_logistics)
	};
	sleep 0.25;
	sync_eco = [IA_liberation_production,IA_liberation_logistics];
	publicVariable "sync_eco";
	
	_IA_liberation_production_old = IA_liberation_production;
	_IA_liberation_logistics_old = IA_liberation_logistics;

	if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside eco sent from: %1", (name player)];_text remoteExec ["diag_log",2];};
};
