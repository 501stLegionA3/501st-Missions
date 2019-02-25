//AAT adds an option for AAT
rexiAttMohawk=
	{
		params["_vic"];
		
		
		
		//also locks the aat
		_vic setVehicleLock "LOCKED";
	/*	
		//by default will add the new guns
		_vic addWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
		for [{_i=0}, {_i<4}, {_i=_i+1}] do
		{
			_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];
		
		};//
		
		*/
			
			
	};//end aatcoxial meme
    
    ["O_SWOP_AAT_1", "init",rexiAttMohawk, true, [], true] call CBA_fnc_addClassEventHandler; 
	
ArmoredAssaultTank=
	{
	params["_vic"];
	_vic setVehicleLock "LOCKED";
	_vic forceWeaponFire ["SWOP_E5AAT", "close"];
	};
	
    ["O_SWOP_AAT_1", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
	["O_SWOP_AAT_1_RD501", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
    ["O_SWOP_AAT_1_RD501_snow", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
    ["O_SWOP_AAT_1_RD501_urban", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
    ["O_SWOP_AAT_1_King_RD501", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
    ["O_SWOP_AAT_1_King_RD501_green", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
    ["O_SWOP_AAT_1_King_RD501_red", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;
    ["O_SWOP_AAT_1_King_RD501_white", "init",ArmoredAssaultTank, true, [], true] call CBA_fnc_addClassEventHandler;