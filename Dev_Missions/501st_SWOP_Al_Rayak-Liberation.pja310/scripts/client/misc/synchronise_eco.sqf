one_eco_done = false;

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Clientside sync eco starts intitializing on: %1", (name player)];_text remoteExec ["diag_log",2];};

waitUntil {!isNil "sync_eco"};

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Clientside sync eco intitialized for: %1", (name player)];_text remoteExec ["diag_log",2];};

while {true} do {

	waitUntil {
		sleep 0.2;
		count sync_eco > 0;
	};
	IA_liberation_production = sync_eco select 0;
	IA_liberation_logistics = sync_eco select 1;
	sync_eco = [];
	one_eco_done = true;
	if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Clientside eco received at: %1", (name player)];_text remoteExec ["diag_log",2];};
};
