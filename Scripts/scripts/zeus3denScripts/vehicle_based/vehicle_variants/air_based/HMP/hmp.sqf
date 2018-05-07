// HMP Droid Fix by Rexi

HMPBase=
{
	params["_vic"];
	_vic limitSpeed 220;
	comment "data for weapons";
	comment"format of [weapon,weaponMagType,[[seat,ammoPerMag,MagCount],[seat,ammoPerMag,MagCount],......etc]]";
	weaponData=[
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

	
};

["swop_HMP_droidgunship", "init",HMPBase, true, [], true] call CBA_fnc_addClassEventHandler; 
["swop_HMP_droidgunship_transport", "init",HMPBase, true, [], true] call CBA_fnc_addClassEventHandler; 