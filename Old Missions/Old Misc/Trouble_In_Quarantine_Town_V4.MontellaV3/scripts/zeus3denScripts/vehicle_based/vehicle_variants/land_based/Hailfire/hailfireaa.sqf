//////////////////////////////////////////////////////////////////
// Hailfire AntiAir Script
// Author: CT Pompano
// Special thanks:
//		-CP Rexi for allowing use of gun ship script to
//	 	 base code off of.
//		
//////////////////////////////////////////////////////////////////


	//Making spartanRight the Missile Turret
	RightSalvo = "O_GMG_01_A_F" createVehicle (getPosASL Ballista);
	RightSalvo removeWeapon "GMG_20mm";
	createVehicleCrew RightSalvo; 
	
	//Attaching it to the right salvo on the Hailfire
	RightSalvo attachTo [Ballista,[2,0,5.25]];  
	
	//Adding weapon and ammo for spartan
	RightSalvo addWeaponTurret ["weapon_rim116Launcher",[0]];
	for [{_i=0}, {_i<5}, {_i=_i+1}] do  
	{  
	RightSalvo addMagazineTurret ["magazine_Missile_rim116_x21",[0]];  
	}; 
		
	//Removes addactions
	removeAllActions Ballista;
	
	//Hide the spartan turrent
	[RightSalvo, true] remoteExec ["hideObjectglobal", 0];
	

	
	