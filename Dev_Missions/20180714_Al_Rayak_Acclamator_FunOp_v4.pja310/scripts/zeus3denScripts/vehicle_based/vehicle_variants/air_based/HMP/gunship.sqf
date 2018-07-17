//by rexi for gunships 
	Mini_left = "O_GMG_01_A_F" createVehicle (getPosASL HMP_Gunship);
	Mini_left attachTo [HMP_Gunship,[5,-3,0]]; 
	Mini_left removeWeapon "GMG_20mm"; 
	Mini_left addWeaponTurret ["SWOP_DoubleLaserCannon",[0]]; 
	for [{_i=0}, {_i<5}, {_i=_i+1}] do  
	{  
	Mini_left addMagazineTurret ["1000Rnd_Laser_Cannon_Minigun",[0]];  
	}; 
	createVehicleCrew Mini_left;
	[Mini_left, true] remoteExec ["hideObjectglobal", 0];
	
	Mini_right = "O_GMG_01_A_F" createVehicle (getPosASL HMP_Gunship);
	Mini_right attachTo [HMP_Gunship,[-5, -3, 0]]; 
	Mini_right removeWeapon "GMG_20mm"; 
	Mini_right addWeaponTurret ["SWOP_DoubleLaserCannon",[0]]; 
	for [{_i=0}, {_i<5}, {_i=_i+1}] do  
	{  
	Mini_right addMagazineTurret ["1000Rnd_Laser_Cannon_Minigun",[0]];  
	}; 
	createVehicleCrew Mini_right;
	[Mini_right, true] remoteExec ["hideObjectglobal", 0];
	
	Mini_Middle = "O_GMG_01_A_F" createVehicle (getPosASL HMP_Gunship);
	Mini_Middle attachTo [HMP_Gunship,[0,.7,-1]]; 
	Mini_Middle removeWeapon "GMG_20mm"; 
	Mini_Middle addWeaponTurret ["Cannon_droideka",[0]]; 
	for [{_i=0}, {_i<50}, {_i=_i+1}] do  
	{  
	Mini_Middle addMagazineTurret ["SW_Droideka_Mag",[0]];  
	}; 
	createVehicleCrew Mini_Middle;
	[Mini_Middle, true] remoteExec ["hideObjectglobal", 0];