// START 501st INIT

_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};
[] spawn _EndSplashScreen;

// END 501st INIT

// Add catapults script.
// [] call SLVN_fnc_loadMenuDefaults;

// Fire Catapult Script.
// if (!isNil 'SVLN_CTPL_global_catapults') then { 
//     _index = lbSelection (displayCtrl 1515);
//     {
//         _cat = (SVLN_CTPL_global_catapults getOrDefault ['catapults', []]) select _x;
//         [_cat select 0, parseNumber ctrlText 1512, parseNumber ctrlText 1501, parseNumber ctrlText 1502, parseNumber ctrlText 1503, parseNumber ctrlText 1511, parseNumber ctrlText 1504, parseNumber ctrlText 1513, parseNumber ctrlText 1514] remoteExec ['SVLN_fnc_launchCatapult', 0];
//     } forEach _index;
//     closeDialog 1;
// };

if(isServer) then {
    if(isDedicated) then {
        addMissionEventHandler ["EntityKilled", {
            params ["_a", "_b", "_c", "_d"];
            [_a, _b, _c, _d, false] remoteExecCall ["SVLN_fnc_saveNewKill", -2];
        }];
    } else {
        addMissionEventHandler ["EntityKilled", {
            params ["_a", "_b", "_c", "_d"];
            [_a, _b, _c, _d, false] remoteExecCall ["SVLN_fnc_saveNewKill", 0];
        }];
    };
};

// Register Spawn Pad Vics

["", "----------"] call SVLN_fnc_registerVicSpawnOptions;
["", "Aircraft"] call SVLN_fnc_registerVicSpawnOptions;
["", "----------"] call SVLN_fnc_registerVicSpawnOptions;

["RD501_arc_170_blue", "ARC-170 (Blue)"] call SVLN_fnc_registerVicSpawnOptions;
["RD501_arc_170_razor", "ARC-170 (Razor)"] call SVLN_fnc_registerVicSpawnOptions;
["RD501_arc_170_red", "ARC-170 (Red)"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_YWing", "Y-Wing Mk.X"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_v19_MKI", "Republic V19 Torrent"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_z95_blue", "Republic Z95"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_LAAT_MKIII_Balls", "LAAT/I MK.III"] call SVLN_fnc_registerVicSpawnOptions;
["RD501_LAAT_C", "Republic LAAT/C"] call SVLN_fnc_registerVicSpawnOptions;
["RD501_LAAT_LE", "Republic LAAT/LE"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_nuclass_mk1", "Republic NuClass Mk.I"] call SVLN_fnc_registerVicSpawnOptions;

["", "----------"] call SVLN_fnc_registerVicSpawnOptions;
["", "Vehicles"] call SVLN_fnc_registerVicSpawnOptions;
["", "----------"] call SVLN_fnc_registerVicSpawnOptions;

["RD501_warden_tank_mobile", "Republic Overseer ASV"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_MASH_Truck", "Republic M*A*S*H Truck"] call SVLN_fnc_registerVicSpawnOptions;

["", ""] call SVLN_fnc_registerVicSpawnOptions;

["RD501_fast_infantry_transport_republic", "Republic Pathfinder"] call SVLN_fnc_registerVicSpawnOptions;
["RD501_fast_infantry_transport_republic_medic", "Republic Pathfinder (Medical)"] call SVLN_fnc_registerVicSpawnOptions;