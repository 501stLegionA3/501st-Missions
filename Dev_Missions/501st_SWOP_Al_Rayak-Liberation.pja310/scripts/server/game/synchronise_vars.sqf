sync_vars = []; publicVariable "sync_vars";

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables starts intitializing on: %1", (name player)];_text remoteExec ["diag_log",2];};

waitUntil{!isNil "save_is_loaded"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: save_is_loaded"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_fob_resources"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_fob_resources"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_supplies_global"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_supplies_global"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_ammo_global"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_ammo_global"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_fuel_global"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_fuel_global"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "combat_readiness"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: combat_readiness"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "unitcap"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: unitcap"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_heli_count"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_heli_count"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_plane_count"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_plane_count"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_heli_slots"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_heli_slots"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "IA_liberation_plane_slots"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: IA_liberation_plane_slots"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "resources_intel"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: resources_intel"];_text remoteExec ["diag_log",2];};
waitUntil{!isNil "infantry_cap"};
if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables: infantry_cap"];_text remoteExec ["diag_log",2];};

_IA_liberation_fob_resources_old = [];
_IA_liberation_supplies_global_old = -1;
_IA_liberation_ammo_global_old = -1;
_IA_liberation_fuel_global_old = -1;
_unitcap_old = -1;
_IA_liberation_heli_count_old = -1;
_IA_liberation_plane_count_old = -1;
_IA_liberation_heli_slots_old = -1;
_IA_liberation_plane_slots_old = -1;
_combat_readiness_old = -1;
_resources_intel_old = -999;
_infantry_cap_old = -999;

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync variables intitializing finished on: %1", (name player)];_text remoteExec ["diag_log",2];};

while {true} do {

	waitUntil {sleep 0.25;
		!(_IA_liberation_fob_resources_old isEqualTo IA_liberation_fob_resources)
		|| _IA_liberation_supplies_global_old != IA_liberation_supplies_global
		|| _IA_liberation_ammo_global_old != IA_liberation_ammo_global
		|| _IA_liberation_fuel_global_old != IA_liberation_fuel_global
		|| _unitcap_old != unitcap
		|| _IA_liberation_heli_count_old != IA_liberation_heli_count
		|| _IA_liberation_plane_count_old != IA_liberation_plane_count
		|| _IA_liberation_heli_slots_old != IA_liberation_heli_slots
		|| _IA_liberation_plane_slots_old != IA_liberation_plane_slots
		|| _combat_readiness_old != combat_readiness
		|| _resources_intel_old != resources_intel
		|| _infantry_cap_old != infantry_cap
	};
	sleep 0.25;
	sync_vars = [IA_liberation_fob_resources,IA_liberation_supplies_global,IA_liberation_ammo_global,IA_liberation_fuel_global,unitcap,IA_liberation_heli_count,IA_liberation_plane_count,IA_liberation_heli_slots,IA_liberation_plane_slots,combat_readiness,resources_intel,infantry_cap];
	publicVariable "sync_vars";
	
	_IA_liberation_fob_resources_old = IA_liberation_fob_resources;
	_IA_liberation_supplies_global_old = IA_liberation_supplies_global;
	_IA_liberation_ammo_global_old = IA_liberation_ammo_global;
	_IA_liberation_fuel_global_old = IA_liberation_fuel_global;
	_unitcap_old = unitcap;
	_IA_liberation_heli_count_old = IA_liberation_heli_count;
	_IA_liberation_plane_count_old = IA_liberation_plane_count;
	_IA_liberation_heli_slots_old = IA_liberation_heli_slots;
	_IA_liberation_plane_slots_old = IA_liberation_plane_slots;
	_combat_readiness_old = combat_readiness;
	_resources_intel_old = resources_intel;
	_infantry_cap_old = infantry_cap;
	if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Serverside sync sent from: %1", (name player)];_text remoteExec ["diag_log",2];};
};
