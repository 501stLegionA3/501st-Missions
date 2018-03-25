//AAT adds an option for AAT
rexiAttMohawk=
	{
		params["_vic"];
		_namAATConfigChance=.5;
		
		
		(_vic) setobjecttextureglobal [0,"optre_vehicles\pelican\data\falcon_gun_CO.paa"];
		(_vic) setobjecttextureglobal [1,"optre_vehicles\pelican\data\falcon_gun_CO.paa"];
	
		//by default will add the new gusn
		_vic addWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
		for [{_i=0}, {_i<3}, {_i=_i+1}] do
		{
			_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];
		
		};//
		
		//gives ability to remove weapons
		_vic  addAction ["<t color='#47FF1A'>Remove AI Coxial Turret </t>",                
		{
			_aat = _this select 0;
			
			_aat RemoveWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
			
			for [{_i=0}, {_i<3}, {_i=_i+1}] do
			{
					_aat RemoveMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];
			
			};
			
		}];//
		
		//gives ability to add weapons
		_vic  addAction ["<t color='#47FF1A'>Add AI Coxial Turret </t>",                
		{
			_aat = _this select 0;
			
			_aat addWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
			for [{_i=0}, {_i<3}, {_i=_i+1}] do
			{
					_aat addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];
			
			};
			
		}];//
			
			
	};//end aatcoxial meme
    
    ["O_SWOP_AAT_1", "init",rexiAttMohawk, true, [], true] call CBA_fnc_addClassEventHandler; 