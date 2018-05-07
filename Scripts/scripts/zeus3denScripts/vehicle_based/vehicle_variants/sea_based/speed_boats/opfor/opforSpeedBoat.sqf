namStarWarsSpeedBoatOpfor={
	params["_vic"];
	
	
		comment "data for weapons";
		comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
		weaponData=[
		["Cannon_EWEBSWBFgun","1000Rnd_Laser_Cannon_EWEBSWBF",[[1,1000,2]]],
		["Cannon_UWINGback","500Rnd_Cannon_UWINGback",[[0,500,2]]],
		["SmokeLauncher","SmokeLauncherMag",[[-1,2,20]]]
		];


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
		
		//remove default arma weapons
		_vic removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
		_vic removeWeaponTurret["GMG_40mm",[0]]; 


		_vic removeMagazinesTurret ["500Rnd_127x99_mag_Tracer_Green",[1]];
		_vic removeWeaponTurret["HMG_01",[1]]; 




};





["O_Boat_Armed_01_hmg_F", "init",namStarWarsSpeedBoatOpfor, true, [], true] call CBA_fnc_addClassEventHandler; 