// Tri Droid Fix by Rexi

TRIDBase=
{
	params["_vic"];
	_vic setmass 18000;
	comment "data for weapons";
	comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
	weaponData=[
	["OPTRE_M79_MLRS","OPTRE_6Rnd_ASGM2_rockets",[[-1,6,3]]],
	["CMFlareLauncher","300Rnd_CMFlare_Chaff_Magazine",[[-1,300,10]]]
	];
	//	["PomehiLauncherXT","400Rnd_Pomehi_Mag",[[-1,400,10]]]


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
	_vic removeweapon "energy_torpedo_w";
	_vic removeweapon "conmis_tief"; 
	};//end weapon additon

	
};

["swop_tridroid", "init",TRIDBase, true, [], true] call CBA_fnc_addClassEventHandler; 