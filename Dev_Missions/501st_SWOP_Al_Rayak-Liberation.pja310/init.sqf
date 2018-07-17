enableSaving [ false, false ];

[] call compileFinal preprocessFileLineNumbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNumbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNumbers "IA_liberation_config.sqf";

switch (IA_liberation_preset) do {
	case 0: {[] call compileFinal preprocessFileLineNumbers "presets\501st.sqf";};
	default {[] call compileFinal preprocessFileLineNumbers "presets\501st.sqf";};
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