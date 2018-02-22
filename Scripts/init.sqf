/*
//  File created for the 501st
//  This init file should be used for all 501st Missions
//  Creation Date: 1-15-2018
//	Change By: CC Cruisie
//  Change Log:
//	1-16-2018 - Correct Script Path for CR
//  1-31-2018 - Added SCFramework support - CC Klein
//
//  ADD THIS INTO THE MISSION FOLDER, NEXT TO MISSION.SQM
//
*/
/////////////////////////////////////
// Fix Loading Screen Issues - BDC //
_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};
[] spawn _EndSplashScreen;
/////////////////////////////////////
//////////LAAT C Monitor/////////////
[] execVM "scripts\LAATCMonitor.sqf";
/////////////////////////////////////
//////////SCFramework////////////////
//[] execVM "SCFramework\Init_SCFramework.SQF";
/////////////////////////////////////
///////// Infatry Loadouts /////////
// loadOutbox = Variable Name - A box/object - must have object down to work
loadOutbox addAction ["Clone Recruit Loadout", "scripts\loadouts\infatry\loadout_cr.sqf"];
loadOutbox addAction ["Clone Recruit-Canadate Loadout", "scripts\loadouts\infatry\loadout_cr-c.sqf"];
loadOutbox addAction ["Clone Trooper Loadout", "scripts\loadouts\infatry\loadout_ct.sqf"];
loadOutbox addAction ["Clone Senior Trooper Loadout", "scripts\loadouts\infatry\loadout_sr-ct.sqf"];
loadOutbox addAction ["Clone Corporal Loadout", "scripts\loadouts\infatry\loadout_cp.sqf"];
loadOutbox addAction ["Clone Sergeant Loadout", "scripts\loadouts\infatry\loadout_cs.sqf"];
loadOutbox addAction ["Clone Sergeant-Major Loadout", "scripts\loadouts\infatry\loadout_cs-m.sqf"];
loadOutbox addAction ["Clone Commander Loadout", "scripts\loadouts\infatry\loadout_cc.sqf"];

///////// Pilot Loadouts /////////
// pilotsLObox = Variable Name - A box/object - must have object down to work
pilotsLObox addAction ["Senior CX-P Loadout", "scripts\loadouts\pilots\loadout_sr-cx-p.sqf"];
pilotsLObox addAction ["Senior CX Loadout", "scripts\loadouts\pilots\loadout_sr-cx.sqf"];
pilotsLObox addAction ["Junior CX-P Loadout", "scripts\loadouts\pilots\loadout_jr-cx-p.sqf"];
pilotsLObox addAction ["Junior CX Loadout", "scripts\loadouts\pilots\pilots\loadout_jr-cx.sqf"];
pilotsLObox addAction ["CX-X Loadout", "scripts\loadouts\pilots\loadout_cx-x.sqf"];
pilotsLObox addAction ["CX-S Loadout", "scripts\loadouts\pilots\loadout_cx-s.sqf"];
pilotsLObox addAction ["CX-C Loadout", "scripts\loadouts\pilots\loadout_cx-c.sqf"];
pilotsLObox addAction ["CX Scuba's Loadout", "scripts\loadouts\pilots\loadout_cx-scuba.sqf"];
pilotsLObox addAction ["CX White's Loadout", "scripts\loadouts\pilots\loadout_cx-white.sqf"];

///////// Medics Loadouts /////////
// medicsLObox = Variable Name - A box/object - must have object down to work
medicsLObox addAction ["CM-S Loadout", "scripts\loadouts\medical\loadout_cm-s.sqf"];
medicsLObox addAction ["CM-P Loadout", "scripts\loadouts\medical\loadout_cm-p.sqf"];
medicsLObox addAction ["CM-C Loadout", "scripts\loadouts\medical\loadout_cm-c.sqf"];
medicsLObox addAction ["Clone Medic Loadout", "scripts\loadouts\medical\loadout_cm.sqf"];

///////// Airborne Loadouts /////////
// airbornLObox = Variable Name - A box/object - must have object down to work

///////// Arc Loadouts /////////
// arcLObox = Variable Name - A box/object - must have object down to work

///////// RTO Loadouts /////////
// rtoLObox = Variable Name - A box/object - must have object down to work