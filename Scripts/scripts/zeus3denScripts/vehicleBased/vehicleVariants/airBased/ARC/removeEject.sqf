
	params["_vic"];
	
	if (!local _vic) exitWith {};
	
	_vic setVehicleLock "LOCKED";


	_vic  addAction ["<t color='#FFFF00'>GET IN PILOT------------- U10</t>",
	{

	params["_this","_user"];
	_user moveInDriver (vehicle(_this));

	},[1],0,false,true];


	_vic  addAction ["<t color='#00FFFF'>GET IN GUNNER------------- U10</t>",
	{

	params["_this","_user"];
	_user moveInTurret [ (vehicle(_this)),[0]];

	},[1],0,false,true];


	_vic  addAction ["<t color='#0000FF'>GET IN NAV------------- U10</t>",
	{

	params["_this","_user"];
	_user moveInTurret [ (vehicle(_this)),[1]];

	},[1],0,false,true];







	_vic  addAction ["<t color='#FF00FF'>GET OUT OF VIC------------- U11</t>",
	{

	params["_this","_user"];
	moveOut _user ;
	},[1],0,false,true,"User12"];





	_vic  addAction ["<t color='#FF0000'>LOCK--------U14</t>",
	{


	(vehicle (_this select 0)) setVehicleLock "LOCKED";
	(vehicle (_this select 0)) vehicleChat "LOCKED";


	},[1],0,false,true];




	_vic  addAction ["<t color='#00FF00'>UNLOCK--------U15</t>",
	{


	(vehicle (_this select 0)) setVehicleLock "UNLOCKED";
	(vehicle (_this select 0)) vehicleChat "UNLOCKED";

	},[1],0,false,true,"User15"];



//["swop_arc_t", "init",removeEjectARC, true, [], true] call CBA_fnc_addClassEventHandler; 