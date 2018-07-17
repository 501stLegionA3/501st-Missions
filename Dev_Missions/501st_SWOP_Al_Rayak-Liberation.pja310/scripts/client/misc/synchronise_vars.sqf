one_synchro_done = false;
synchro_done = false;

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Clientside sync variables starts intitializing on: %1", (name player)];_text remoteExec ["diag_log",2];};

waitUntil { !isNil "sync_vars" };

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Clientside sync variables intitialized for: %1", (name player)];_text remoteExec ["diag_log",2];};

while { true } do {

	waitUntil {
		sleep 0.2;
		count sync_vars > 0;
	};
	IA_liberation_fob_resources = sync_vars select 0;
	IA_liberation_supplies_global = sync_vars select 1;
	IA_liberation_ammo_global = sync_vars select 2;
	IA_liberation_fuel_global = sync_vars select 3;
	unitcap = sync_vars select 4;
	IA_liberation_heli_count = sync_vars select 5;
	IA_liberation_plane_count = sync_vars select 6;
	IA_liberation_heli_slots = sync_vars select 7;
	IA_liberation_plane_slots = sync_vars select 8;
	combat_readiness = sync_vars select 9;
	resources_intel = sync_vars select 10;
	infantry_cap = sync_vars select 11;
	sync_vars = [];
	one_synchro_done = true;
	synchro_done = true;
	if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Clientside sync received at: %1", (name player)];_text remoteExec ["diag_log",2];};
};
