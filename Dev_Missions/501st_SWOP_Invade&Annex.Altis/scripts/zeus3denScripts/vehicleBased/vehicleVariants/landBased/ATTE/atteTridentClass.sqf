//ye ole drop turret on which all stands
	params["_vic"];
//The object that has the action menu to deploy this at-te
	_dropTurret=_vic;
//The stomper that makes at-te move	
	atte_drive = "B_UGV_01_rcws_F" createVehicle (position _dropTurret);

//sleep 1;
// create the ai crew to allow you to control the uav;
	createVehicleCrew atte_drive;
// make invis,the uav that is; 0,1,2,3
	for [{_i=0}, {_i<(4)}, {_i=_i+1}] do
	{
		atte_drive setobjecttextureglobal [_i,""];  
	};
// remove cargo space of uav;
	[atte_drive, -1] call ace_cargo_fnc_setSpace;
 

// damage the wheels of uav to set top speed: gives 3 speeds slow forward = 10km forward = 20km fast forward = 29km;
	{atte_drive setHitPointDamage[_x,0.90]} forEach ["HitLF2Wheel","HitRF2Wheel"];
	{atte_drive setHitPointDamage[_x,0.90]} forEach ["HitLFWheel","HitRFWheel"];
	{atte_drive setHitPointDamage[_x,0.90]} forEach ["HitLmWheel","HitRmWheel"];
	
	//dmgs lights
	atte_drive setHitIndex [20, 1];
	atte_drive setHitIndex [21, 1];
	atte_drive setHitIndex [22, 1];
	atte_drive setHitIndex [23, 1];
	atte_drive setHitIndex [24, 1];	
	
//cant take dmg the stomper	
	atte_drive allowDamage false;  	
	atte_drive lockTurret [[1], true];

// Remove the stompers weapons and add in smoke launcher and laser desig;
	atte_drive removeWeapon "HMG_127_UGV";
	atte_drive removeWeapon "GMG_40mm";

	atte_drive addWeaponTurret  ["SmokeLauncher",[0]];  
	for [{_i=0}, {_i<(5)}, {_i=_i+1}] do
	{
		atte_drive addMagazineTurret ["smokelaunchermag",[0]]; 
	};
	
	atte_drive addWeaponTurret  ["Laserdesignator_mounted",[0]];  
	atte_drive addMagazineTurret ["Laserbatteries",[0]]; 
	
                                                                                                      

// create the infantry cargo;
	clearMagazineCargoGlobal atte_drive;
	atte_drive addMagazineCargoGlobal ["SWOP_DC15ABlasterRifle_Low_Mag", 40];
	atte_drive addMagazineCargoGlobal ["SWOP_DC15ABlasterRifle_Full_Mag", 10];
	atte_drive addMagazineCargoGlobal ["SWOP_DC15ABlasterRifle_Mag", 20];
	atte_drive addMagazineCargoGlobal ["SWOP_DC15_Mag", 10];
	
	clearItemCargoGlobal atte_drive;
	atte_drive addItemCargoGlobal ["ACE_elasticBandage", 40];
	atte_drive addItemCargoGlobal ["ACE_quikclot", 40];
	atte_drive addItemCargoGlobal ["ACE_morphine", 15];
	atte_drive addItemCargoGlobal ["ACE_epinephrine", 15];
	atte_drive addItemCargoGlobal ["ACE_plasmaIV_500", 40];
	atte_drive addItemCargoGlobal ["ACE_packingBandage", 20];
	atte_drive addItemCargoGlobal ["SW_SquadShield_Mag", 3];
	atte_drive addItemCargoGlobal ["B_UavTerminal", 5];

//spawns a at-te on the dropturrets pos
	atte_body  = "Republic_ATTE" createVehicle (position _dropTurret);
	atte_body attachTo [atte_drive,[0,-0.5,-2]]; 

	
// ITT for troop transport;	
	atte_mens = "O_SWOP_HoverTa_2" createVehicle (position _dropTurret);
// Set the name and attach it to the Stomper;
	atte_mens attachTo [ATTE_DRIVE,[0,-4.2,1.9]];
// make it invisible;	
	(atte_mens) setobjecttextureglobal [0,""]; 
// make it invulnerable remove the ammo 
	atte_mens allowDamage false;
	atte_mens setvehicleammo 0;
	atte_mens lockDriver true;
	[atte_mens, 9] call ace_cargo_fnc_setSpace;


// crewITT,purpose allows uav driver to sit there;	
	atte_mens2 = "O_SWOP_HoverTa_2" createVehicle (position _dropTurret);
// Set the name and attach it to the Stomper;
	atte_mens2 attachTo [ATTE_DRIVE,[0,1.9,1.9]];
// make it invisible;	
	(atte_mens2) setobjecttextureglobal [0,""]; 
// "make it invulnerable remove the ammo and turn the lights and engine on";
	atte_mens2 allowDamage false;
	atte_mens2 setvehicleammo 0;
	atte_mens2 engineOn true;
	atte_mens2 setPilotLight true;
	atte_mens2 lockDriver true;
	[atte_mens2, -1] call ace_cargo_fnc_setSpace;


// "remote desig,commanders laz dezer";	
	atte_com = "B_Static_Designator_01_F" createVehicle (position _dropTurret);
// Set the name and attach it to the Stomper;
	atte_com attachTo [ATTE_DRIVE,[0,0.9,6.8]]; 
	atte_com allowDamage false;
	createVehicleCrew atte_com; 
	[atte_com, true] remoteExec ["hideObjectglobal", 0];


//turrets that fire the laat cannons 1
	atte_gun1 = "B_HMG_01_A_F" createVehicle (position _dropTurret);
	ATTE_gun1 attachTo [ATTE_drive,[1.25,3.92,3.55]]; 
	ATTE_gun1 removeWeapon "HMG_static"; 
	ATTE_gun1 addWeaponTurret ["Cannon_LAAT",[0]]; 
	ATTE_gun1 addMagazineTurret ["1000Rnd_Laser_Cannon_LAAT",[0]];    
	createVehicleCrew ATTE_gun1;
	atte_gun1 allowCrewInImmobile true;
	atte_gun1 disableAI "target";
	
//turrets that fire the laat cannons 2
	atte_gun2 = "B_HMG_01_A_F" createVehicle (position _dropTurret);
	ATTE_gun2 attachTo [ATTE_drive,[-1.05,3.92,3.54]]; 
	atte_gun2 removeWeapon "HMG_static";  
	atte_gun2 addWeaponTurret ["Cannon_LAAT",[0]]; ;  
	atte_gun2 addMagazineTurret ["1000Rnd_Laser_Cannon_LAAT",[0]];  
	createVehicleCrew ATTE_gun2;
	atte_gun2 allowCrewInImmobile true;
	atte_gun2 disableAI "target";
	
//turrets that fire the laat cannons 3
	atte_gun3 = "B_HMG_01_A_F" createVehicle (position _dropTurret);
	ATTE_gun3 attachTo [ATTE_drive,[-0.75,-7.8,3.733]];  
	atte_gun3 removeWeapon "HMG_static";  
	atte_gun3 addWeaponTurret ["Cannon_LAAT",[0]]; 
	atte_gun3 addMagazineTurret ["1000Rnd_Laser_Cannon_LAAT",[0]]; 
	createVehicleCrew ATTE_gun3;
	atte_gun3 disableAI "target";
	atte_gun3 setdir 180;
	atte_gun3 allowCrewInImmobile true;
//Stores the varible names of all objects
	atte_body setVariable ["atteObjectsOnIt", [atte_drive,atte_com,atte_gun1,atte_gun2,atte_gun3],true];
//deleted the drop turret	
	deleteVehicle _dropTurret;
