

laatClaymoreIV={
    params ["_vic"];

	//if (!(_vic getVariable ["namReconfigured", false])) then 
	//{
	

		
		comment "data for weapons";
		comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
		weaponData=[
		["Cannon_LAAT","1000Rnd_Laser_Cannon_LAAT",[[-1,1000,2]]],
		["missiles_Jian","4Rnd_LG_Jian",[[-1,10,8],[0,1,1]]],
		["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,8,1],[0,21,1]]],
		["Cannon_TIE_FAST","10Rnd_FAST_Cannon_TIE",[[1,10,100],[2,10,100]]],
		["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,600,10]]],
		["Laserdesignator_pilotCamera","Laserbatteries",[[-1,1,1]]]
		];



		comment "remove torpedos";
		for [{_i=0}, {_i<2}, {_i=_i+1}] do
		{
			_vic removeMagazineTurret ["laat_proton_torpedo" ,[-1]];  
			_vic removeWeaponTurret["laat_proton_torpedo_launcher", [-1]];
		};



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

			
				
				comment "adds mags";
				for [{_k=0}, {_k<(seatMags)}, {_k=_k+1}] do
				{
					_vic addWeaponTurret[itemWeapon, [seatIndex]];
					_vic addMagazineTurret [itemMagType ,[seatIndex],seatAmmoPerMag];

				};



			};


		};
	//	_vic setVariable ["namReconfigured", true, true];

	//}
//	else {};


	comment "gets health";
	_vic addAction ["<t color='#00FF00'>Damage Report</t>",
	{


	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," driver  _target == _this "];
	
	

	
	// function as file
	_vic  addAction ["<t color='#886688'>Smoker--------U13</t>",
	{[_this select 0] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTip.sqf";}
	,[1],0,false,true,"User13"," driver  _target == _this"];
	
	//for some reason laats dont show CM's,this is hopefully to get them to show
	_vic addWeaponTurret["PomehiLauncherXT", [-1]];
	_vic addMagazineTurret ["400Rnd_Pomehi_Mag" ,[-1],400];
	
};

["swop_LAAT", "init",laatClaymoreIV, true, [], true] call CBA_fnc_addClassEventHandler; 

