xiphosI={
	params["_vic"];

	
	//if (!(_vic getVariable ["namReconfigured", false])) then 
	//{
	/*
		comment "data for weapons";
		comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
		weaponData=[
		["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,16,1]]],
		["missiles_Jian","4Rnd_LG_Jian",[[-1,4,1]]],
		["conmis_arc","ConMisarc_mag",[[-1,8,2]]],
		["GBU12BombLauncher","2Rnd_GBU12_LGB",[[-1,2,1]]],
		["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,400,10]]],
		["Laserdesignator_pilotCamera","Laserbatteries",[[-1,1,1]]]
		];
		_vic setVariable["weaponData",weaponData];


		comment "For each weapon";
		for [{_i=0}, {_i<(count weaponData)}, {_i=_i+1}] do
		{
			itemList=weaponData select _i;
			itemWeapon=itemList select 0;
			itemMagType=itemList select 1;
			itemSeats=itemList select 2;


			comment "for each seat";
			for [{_j=0}, {_j<(count itemSeats)}, {_j=_j+1}] do
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


		};
	//	_vic setVariable ["namReconfigured", true, true];
//	}
//	else {};
*/	
	// function as file
/*	_vic  addAction ["<t color='#886688'>Smoker--------U13</t>",
	{

		[_this select 0] execVM (arc170SmokeQuick);
	}
	,[1],0,false,true,"User13"," driver  _target == _this"];
*/	


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
	
	
	
	[_vic] execVm (airBasedQuick+arc170Path+removeEject);

	
	
	
	
};

["swop_arc_t", "init",xiphosI, true, [], true] call CBA_fnc_addClassEventHandler; 
