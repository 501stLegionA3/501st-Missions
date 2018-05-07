//Vwing fix created by Rexi


arrow={
	params["_vic"];
	
	comment "data for weapons";
	comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
	weaponData=[
	["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,20,1]]],
	["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,21,10]]],
	["Cannon_Vwing_FAST","10Rnd_Cannon_Vwing",[[-1,20,20]]],
	["CMFlareLauncher","300Rnd_CMFlare_Chaff_Magazine",[[-1,300,10]]]
	];



	comment "For each weapon";
	for [{ _i=0 }, { _i<(count weaponData)}, {_i=_i+1}] do
	{
		itemList=weaponData select _i;
		itemWeapon=itemList select 0;
		itemMagType=itemList select 1;
		itemSeats=itemList select 2;


		comment "for each seat";
		for [{ _j=0}, { _j<(count itemSeats)}, {_j=_j+1}] do
		{

			seatData=itemSeats select _j;
			seatIndex=seatData select 0;
			seatAmmoPerMag=seatData select 1;
			seatMags=seatData select 2;

			_vic addWeaponTurret[itemWeapon, [seatIndex]];
			
			comment "adds mags";
			for [{_k=0}, {_k<(seatMags)}, {_k=_k+1}] do
			{
				_vic  addMagazineTurret [itemMagType ,[seatIndex],seatAmmoPerMag];

			};



		};

	};//end weapon additon
	

	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{


	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," driver  _target == _this "];


	comment "Increment Throttle";
	_vic  addAction ["<t color='#0000FF'>Increment Throttle--------U16</t>",
	{
	(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))+.01);

	},[1],0,false,true,"User16","driver  _target == _this"];


	comment "Decrement Throttle";
	_vic  addAction ["<t color='#FF0000'>Decrement Throttle--------U17</t>",
	{
	(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))-0.01);	

	},[1],0,false,true,"User17","driver  _target == _this"];
	
	Comment "Set Mass Style";
	_vic addAction ["<t color='#00FF00'>High Maneuverability</t>", {
	(_this select 0) setmass 28000;
	},[1],0,false,true,""," driver  _target == _this "];
	
		
	Comment "Set Mass Style";
	_vic addAction ["<t color='#00FF00'>Mid High Maneuverability</t>", {
	(_this select 0) setmass 24000;
	},[1],0,false,true,""," driver  _target == _this "];
	
	_vic setmass 18000;
	_vic addAction ["<t color='#00FF00'>Standard Maneuverability</t>", {
	(_this select 0) setmass 18000;
	},[1],0,false,true,""," driver  _target == _this "];
	

};
["swop_Vwing", "init",arrow, true, [], true] call CBA_fnc_addClassEventHandler; 
