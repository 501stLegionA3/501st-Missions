//ARC 170 Reupply Data By Rexi	
	_vic = cursorTarget;
			if (player distance _vic < 5) then 
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
	weaponAdded=_vic getVariable "weaponData";
	weaponData=weaponAdded+[["Cannon_Arc","1000Rnd_Laser_Cannon_arc",[[-1,1000,2]]]];


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
	Hint "Resupplied Arc 170 Multi Role Fighter";
	};