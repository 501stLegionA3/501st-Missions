//Globally buff all Sabres Republic and Empire
//Created by Rexi
Sabre={
	params["_vic"];
	
	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{
	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];
	
	comment "add in weapons and ammo";
	_vic addMagazineTurret ["100Rnd_TXLaser_Cannon_mag",[-1]];
	_vic addWeapon "Cannon_Portableun";  
	_vic removeWeapon "SWOP_DC15ABlasterRifle";
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addWeaponTurret  ["SmokeLauncher",[-1]];  
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addEventHandler ["HandleDamage", { 
	if (_this select 1 == "") then { 
	_this select 2 
	} else { 
	0 
	} 
	}];
	};

["O_JM_TX130m1r_1", "init",sabre, true, [], true] call CBA_fnc_addClassEventHandler; 





SSabre={
	params["_vic"];
	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{


	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];

	_vic addMagazineTurret ["100Rnd_TXLaser_Cannon_mag",[0]];
	_vic addMagazineTurret ["100Rnd_TXLaser_Cannon_mag",[0]];
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addWeaponTurret  ["SmokeLauncher",[-1]];  
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addEventHandler ["HandleDamage", { 
	if (_this select 1 == "") then { 
	_this select 2 
	} else { 
	0 
	} 
	}];
	};

["O_JM_TX130m2r_1", "init",Ssabre, true, [], true] call CBA_fnc_addClassEventHandler; 






Sabrec={
	params["_vic"];
	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{
	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];

	comment "add in weapons and ammo";
	_vic addWeapon "Cannon_Portableun";  
	_vic removeWeapon "SWOP_DC15ABlasterRifle";
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addWeaponTurret  ["SmokeLauncher",[-1]];
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addEventHandler ["HandleDamage", { 
	if (_this select 1 == "") then { 
	_this select 2 
	} else { 
	0 
	} 
	}];
	
	
	};

["O_JM_TX130r_1", "init",sabrec, true, [], true] call CBA_fnc_addClassEventHandler; 





//Imperial
IMPSabre={
	params["_vic"];
	
	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{
	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];
	
	comment "add in weapons and ammo";
	_vic addMagazineTurret ["100Rnd_TXLaser_Cannon_mag",[-1]];
	_vic addWeapon "Cannon_Portableun";  
	_vic removeWeapon "SWOP_DC15ABlasterRifle";
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addWeaponTurret  ["SmokeLauncher",[-1]];  
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addEventHandler ["HandleDamage", { 
	if (_this select 1 == "") then { 
	_this select 2 
	} else { 
	0 
	} 
	}];
	};

["O_JM_TX130_1", "init",IMPsabre, true, [], true] call CBA_fnc_addClassEventHandler; 





IMPSSabre={
	params["_vic"];
	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{


	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	
		_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];
	_vic addMagazineTurret ["100Rnd_TXLaser_Cannon_mag",[0]];
	_vic addMagazineTurret ["100Rnd_TXLaser_Cannon_mag",[0]];
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addWeaponTurret  ["SmokeLauncher",[-1]];  
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addEventHandler ["HandleDamage", { 
	if (_this select 1 == "") then { 
	_this select 2 
	} else { 
	0 
	} 
	}];
	};

["O_JM_TX130m2_1", "init",IMPSsabre, true, [], true] call CBA_fnc_addClassEventHandler; 






IMPSabrec={
	params["_vic"];
	comment "gets health";
	_vic   addAction ["<t color='#00FF00'>Damage Report</t>",
	{
	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];
	
	comment "add in weapons and ammo";
	_vic addWeapon "Cannon_Portableun";  
	_vic removeWeapon "SWOP_DC15ABlasterRifle";
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF_REP",[0]]; 
	_vic addWeaponTurret  ["SmokeLauncher",[-1]];
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addMagazineTurret ["smokelaunchermag",[-1]]; 
	_vic addMagazineTurret ["smokelaunchermag",[-1]];
	_vic addEventHandler ["HandleDamage", { 
	if (_this select 1 == "") then { 
	_this select 2 
	} else { 
	0 
	} 
	}];
	
	
	};

[ "O_JM_TX130m1_1", "init",IMPsabrec, true, [], true] call CBA_fnc_addClassEventHandler; 
