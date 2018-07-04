//Low Altitude Assault Transport Reupply Data By Rexi
	_vic = cursorTarget;
			if (player distance cursorTarget < 5) then 
	{
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;		
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
								player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;		
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
	//Remove
	comment "data for weapons";
	comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
	weaponData=[
		["laat_proton_torpedo_launcher","laat_proton_torpedo",[[-1,12,2]]],	
		["Cannon_LAAT","1000Rnd_Laser_Cannon_LAAT",[[-1,1000,2]]],
		["Cannon_LAAT","1000Rnd_Laser_Cannon_LAAT",[[0,1000,2]]],
		["missiles_Jian","4Rnd_LG_Jian",[[-1,10,8],[0,4,1]]],
		["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,8,1],[0,8,1]]],
		["SmokeLauncher","SmokeLauncherMag",[[-1,2,20]]],
		["CMFlareLauncher","300Rnd_CMFlare_Chaff_Magazine",[[-1,300,10]]],
		["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,400,10]]],
		["Cannon_Vwing","1000Rnd_Cannon_Vwing",[[1,2000,2],[2,2000,2]]],
		["Laserdesignator_pilotCamera","Laserbatteries",[[-1,1,1]]]
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
			_vic removeWeaponTurret[itemWeapon,[seatIndex]];
			};
		comment "adds mags";
			_vic  removeMagazinesTurret [itemMagType,[seatIndex]];
	};
	
	
	
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

	};	
	Hint "Resupplied Low Altitude Assault Transport";
	};