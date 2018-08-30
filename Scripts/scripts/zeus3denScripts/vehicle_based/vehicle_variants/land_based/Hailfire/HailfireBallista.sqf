
//Hailfire Changes by Rexi
//22/04/2018
Ballista=
	{
	params["_vic"];
	

	_vic addAction ["<t color='#47FF1A'>Kill All Pilots</t>",
  	{
	Ballista = _this select 0;
	[Ballista] execVM "scripts\zeus3denScripts\vehicle_based\vehicle_variants\land_based\Hailfire\hailfireaa.sqf";
	removeAllActions Ballista;
	},[1],0,false,true,""," driver  _target == _this "];
		
		
		//also locks the hailfire and sets the mass
	_vic setmass 60000;  

		//by default will add the new guns	
	_vic addWeaponTurret ["missiles_DAR",[0]];
	for [{_i=0}, {_i<6}, {_i=_i+1}] do
	{
	_vic addMagazineTurret ["12Rnd_PG_missiles",[0]];
	};
	[Ballista] execVM "DarMissileNerf.sqf";
			
	};//end 
    
      ["O_SWOP_Hailfire_1", "init",Ballista, true, [], true] call CBA_fnc_addClassEventHandler; 