//AAT adds an option for AAT
rexiAttMohawk=
	{
		params["_vic"];
		
		
		
		
	
		//by default will add the new gusn
		_vic addWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
		for [{_i=0}, {_i<4}, {_i=_i+1}] do
		{
			_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];
		
		};//
		
		
			
			
	};//end aatcoxial meme
    
    ["O_SWOP_AAT_1", "init",rexiAttMohawk, true, [], true] call CBA_fnc_addClassEventHandler; 