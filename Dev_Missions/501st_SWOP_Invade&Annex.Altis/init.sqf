/***********************************************************\
	LEAVE THESE BE AND THE REST OF THE FILE IS YOURS!

	*/
		debugMode = false;

		enableSaving [false, false];
		if (isServer) exitWith { [] execVM "init\server.sqf"; };
		_settings = player execVM "init\player.sqf"; waitUntil { scriptDone _settings };
	/*

	YE-ARGH! THANK YE!
\***********************************************************/
//////////////////////////////////////
///////////SWOP Scripts//////////////
// Fix Loading Screen Issues - BDC //
_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};
[] spawn _EndSplashScreen;
//////////////////////////////////////
//////////LAAT C Monitor/////////////
[] execVM "scripts\LAATCMonitor.sqf";
/////////////////////////////////////
waitUntil {alive player};
player allowDamage false;
onMapSingleClick "(vehicle player) setPos _pos;";

onEachFrame
{
	{
		_colour = if (side _x == EAST) then { [1,0,0,0.5] } else { [0,0,1,0.5] };
		drawIcon3D
		[
			"a3\ui_f\data\map\MapControl\hospital_ca.paa",
			_colour,
			_x, 0.5, 0.5, 45
		];
	} forEach allUnits;
};

//calls namenai's init.sqf,refer to its readme for its purpose
[] execVM "scripts\zeus3denScripts\namenaisInit.sqf";

//In-Game Logo
[] execVM "logo.sqf";