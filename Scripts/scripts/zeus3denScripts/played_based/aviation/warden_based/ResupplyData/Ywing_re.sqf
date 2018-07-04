//Y-wing Reupply Data By Rexi
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
		["Cannon_KXYWING","1000Rnd_Cannon_KXYWING",[[-1,1000,2]]],
		["Mg7_proton_torpedo_launcher","Mg7_proton_torpedo",[[-1,8,6]]],		
		["OPTRE_bomblauncher_1000lb","OPTRE_12Rnd_1000lb_bomb",[[-1,12,2]]],
		["missiles_SCALPEL","6Rnd_LG_scalpel",[[-1,6,2]]],
		["missiles_Jian","4Rnd_LG_Jian",[[-1,4,3]]],
		["Bomb_04_Plane_CAS_01_F","4Rnd_Bomb_04_F",[[-1,4,2]]],
		["weapon_rim116Launcher","magazine_Missile_rim116_x21",[[-1,4,1]]],
		["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,400,10]]],
		["Cannon_SDS","1000Rnd_Cannon_SDS",[[0,1000,4]]],
		["Laserdesignator_pilotCamera","Laserbatteries",[[-1,1,1]]],
		["BombCluster_01_F","PylonMissile_1Rnd_BombCluster_01_F",[[-1,2,4]]]
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
	Hint "Resupplied Ywing Bomber";
	};