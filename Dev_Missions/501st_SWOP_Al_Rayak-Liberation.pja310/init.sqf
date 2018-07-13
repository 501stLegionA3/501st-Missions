enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "IA_liberation_config.sqf";

// TODO: Clean Up - Ile 2 - Remove the un-needed presets, this is 501st Lib - remove RHS and others
switch (IA_liberation_preset) do {
	case 0: {[] call compileFinal preprocessFileLineNumbers "presets\custom.sqf";};
	case 1: {[] call compileFinal preprocessFileLineNumbers "presets\apex_tanoa.sqf";};
	case 2: {[] call compileFinal preprocessFileLineNumbers "presets\rhs.sqf";};
	case 3: {[] call compileFinal preprocessFileLineNumbers "presets\rhs_bw.sqf";};
	case 4: {[] call compileFinal preprocessFileLineNumbers "presets\rhs_takistan.sqf";};
	case 5: {[] call compileFinal preprocessFileLineNumbers "presets\3cbBAF.sqf";};
	case 6: {[] call compileFinal preprocessFileLineNumbers "presets\customRebelVsEmpire.sqf";};
	case 7: {[] call compileFinal preprocessFileLineNumbers "presets\customEmpireVsRebel.sqf";};
	case 8: {[] call compileFinal preprocessFileLineNumbers "presets\customCloneVsCis.sqf";};
	case 9: {[] call compileFinal preprocessFileLineNumbers "presets\customCisVsClone.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\customRebelVsEmpire.sqf";};
};

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\classnames.sqf";

[] execVM "GREUH\scripts\GREUH_activate.sqf";
[] execVM "intercom.sqf";
//[] execVM "alarm.sqf";

[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

// TODO: Check To See If HC_Manager Script Is Needed (Possable Replaced with ACEX HC)
if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1600;
};

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] init.sqf done for: %1", (name player)];_text remoteExec ["diag_log",2];};

//Temp fix for endless loading screen.
_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};

[] spawn _EndSplashScreen;