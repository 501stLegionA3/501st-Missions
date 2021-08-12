/*
//  File created for the 501st
//  This init file should be used for all 501st Missions
//  Creation Date: 1-15-2018
//	Change By: CC Cruisie
//  Change Log:
//	12-17-2020 - Reduced to just end loading 
//  1-31-2018 - Added SCFramework support - CC Klein
//  2-27-2018 - Fixed name of Cadet Loadout - CS Peterson
//	7-05-2018 - 
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
