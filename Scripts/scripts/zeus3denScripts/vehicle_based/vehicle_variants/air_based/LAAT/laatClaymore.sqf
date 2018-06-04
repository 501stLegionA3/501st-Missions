claymoreI={
	params["_vic"];
	
		//for Ai
		_vic limitSpeed 220;
	
	
		comment "data for weapons";
		comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
		weaponData=[
		["Cannon_LAAT","1000Rnd_Laser_Cannon_LAAT",[[-1,1000,2]]],
		["missiles_Jian","4Rnd_LG_Jian",[[-1,10,8],[0,4,1]]],
		["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,8,1],[0,8,1]]],
		["SmokeLauncher","SmokeLauncherMag",[[-1,2,20]]],
		["CMFlareLauncher","300Rnd_CMFlare_Chaff_Magazine",[[-1,300,10]]],
		["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,400,10]]],
		["Cannon_Vwing","1000Rnd_Cannon_Vwing",[[1,2000,2],[2,2000,2]]],
		["Laserdesignator_pilotCamera","Laserbatteries",[[-1,1,1]]]
		];

		comment "remove unused weapons";
		_vic removeWeaponTurret[ "Cannon_LAAT_Turret1", [1]];
		_vic removeWeaponTurret[ "Cannon_LAAT_Turret2", [2]];
	

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


		};//end weapon additon
		
		//removes torpedos
		//_vic removeWeaponTurret["laat_proton_torpedo_launcher", [-1]];
		

	// function as file add the wing tip smoke for laat
	_vic  addAction ["<t color='#886688'>Smoker--------U13</t>",
	{
		[_this select 0] execVM (laatSmokeQuick);
	}
	,[1],0,false,true,"User13"," driver  _target == _this"];


	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{

		hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," driver  _target == _this "];

	//by default boost is off
	//_vic setvariable ["OPTRE_Thruster_EngagedStatus",false,true];
	

	/*
	//adds action to engage boost
	_vic  addAction ["<t color='#00FF00'>Engage C.R.U.I.S.I.E Control System -------- U18</t>",
	{
		[_this select 0,620,10,25] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\boostStart.sqf";
	},[1],0,false,true,"User18"," driver  _target == _this"];
	
	//adds action to disengage boost
	_vic  addAction ["<t color='#FFA500'>Disengage C.R.U.I.S.I.E Control System -------- U19</t>",
	{
		[_this select 0,80,5] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\boostStop.sqf";
	},[1],0,false,true,"User19"," driver  _target == _this"];
	*/

	//boost on
	_vic  addAction ["",
	{
		if (((speed (_this select 0)) >10) && {(alive (_this select 0))}) then [ 
		{ (_this select 0) execVM swopBoostOn; }, 
		{  } ];

		//(_this select 0) setMass 119533*3;
	},[1],0,false,true,"User19"," driver  _target == _this"];
	
	//boost off
	_vic  addAction ["",
	{	
		if ((alive (_this select 0))) then [ 
		{ (_this select 0) execVM swopBoostOff; }, 
		{  } ];
		//(_this select 0) setMass 119533;
	},[1],0,false,true,"User20"," driver  _target == _this"];

	
	_vic addEventHandler ["HandleDamage",
	{
	
	
		if(((_this select 0) getVariable["isCrashing",false]) || {(damage (_this select 0))>=.7}) then
		{
			_namResultingDmg=0;
			
		
	
		};
		_namUnit=_this select 0;
		_namDmg=_this select 2;
		_namCurrentDmg=damage _namUnit;//0 if health 1 if dead
		_namResultingDmg=_namDmg/2;
		
	
		if((_namCurrentDmg+_namDmg)>.7) then
		{
			_namUnit allowDamage false;
			_namUnit setFuel 0;
			_namUnit setDamage .7;
			_namUnit vehicleChat format["MAYDAY MAYDAY MAYDAY THIS IS %1 GOING DOWN OVER GRID %2 BRRRRRRR*****BRRRRR ****BRRRRR",(name (driver _namUnit)),(mapGridPosition _namUnit)];

			_namResultingDmg=0;
			_namIsCrashing=((_namUnit) getVariable["isCrashing",false]); 

			if(!_namIsCrashing) then
			{
				_null = _this spawn 
				{	
					_namUnitSpawn=_this select 0;
					[west, "HQ"] sideChat format["fire made %1",time];
					_namLaatFirePosArray=[[6,-2.5,-1],[-6,-2.5,-1], [1.5,-5,2.5], [-1.5,-5,2.5],[0,3,0],[0,6,-.5],[0,0,-2]];
					
					
					_namLaatFireObj=[];
					
					for "_i" from 0 to 1 do
					{
						_fire = "test_EmptyObjectForFireBig" createVehicle position (_namUnitSpawn);
						_fire attachTo [_namUnitSpawn,(selectRandom _namLaatFirePosArray)];
						_namLaatFireObj=_namLaatFireObj+[_fire];
					};//makes two fires or watever much, and then stores them in the array while also randomly palcing on laat
					
					
					

					
					sleep 50;
					{ 
						deleteVehicle _x;
						_namLaatFireObj=[];
					} forEach _namLaatFireObj;//delets all of them
					
					
					
				};
			};
			_namUnit setVariable ["isCrashing", true,true];
		}
		else
		{
			_namResultingDmg=_namDmg/2;
		
		
		};
		
		
		
		
		
	}];
	
};


["swop_LAAT", "init",claymoreI, true, [], true] call CBA_fnc_addClassEventHandler; 