  //Script to remove Ewebs from spawned AATs
  {
    if ((typeOf _x) in ["O_SWOP_AAT_1"]) then {
            
	_x removeWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
	for [{_i=0}, {_i<3}, {_i=_i+1}] do
	{
	_x removeMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];
	};    
    };
    } forEach vehicles;
	
	hintSilent "Existing AATs have had Coaxial turret removed";
