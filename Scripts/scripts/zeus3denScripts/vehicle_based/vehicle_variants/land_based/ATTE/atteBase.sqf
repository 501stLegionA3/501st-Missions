//----------
//Now this file is called in the init.sqf. Thus whenever the the atteTypeSelector is executed and the at-te from there is spawned,this is ran
//Created by Rexi


//general script
rexiAtteBase={
	params["_vic"];
	
	_rexiHasBeenModded= _vic getVariable ["modded", false];
	
	//adds the ability to check how much dmg the at-te has taken
	_vic addAction ["<t color='#00FF00'>Hull Damage Report</t>",
	{
		hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	}];
	
	
	
	_vic removeAllEventHandlers "Fired";
	
	//ads repair function
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repairMore);
	}];	

	//handles reducing dmg taken by at-te
	_vic addeventhandler ["HandleDamage",
	{
		_rexiUnit = _this select 0;
		_rexiSelection = _this select 1;
		_rexiPassedDamage = _this select 2;
		_rexiOldDamage = 0;
		_rexiDmgScaleFactor=3;
		switch(_rexiSelection)do{
			case(""):{_rexiOldDamage = damage _rexiUnit;};
			default{};
		};
		_rexiReturn = _rexiOldDamage + ((_rexiPassedDamage - _rexiOldDamage) / _rexiDmgScaleFactor);
		_rexiReturn
	}];
	
	//Destroys at-te attached stuff on death
	_vic addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	_KillArray=_unit getVariable ["deleteOnDeath",[]];
	
	{ _x setDamage 1; } forEach _KillArray;
	
	}];


	//Destorys at-te attached stuff on death
	_vic addEventHandler ["Deleted", {
	params ["_entity"];
	
	_DelArray=_unit getVariable ["deleteOnDeath",[]];
	
	{  deleteVehicle _x; } forEach _DelArray;
	}];


	//Removes the standard weapon and replaces it with a 120mm cannon
	_vic removeWeaponTurret ["Cannon_ATTE", [0]];
	_vic addWeaponTurret ["cannon_120mm", [0]];
	_vic addWeaponTurret ["autocannon_35mm", [0]];
	for [{_i=0}, {_i<(5)}, {_i=_i+1}] do
	{
		_vic addMagazineTurret ["32Rnd_120mm_APFSDS_shells_Tracer_Green" ,[0]];
	};


};//end at-te Base


//Add repair ability to turrets and makes it so that they cant die 100%,just disabled
UAVT={
	params["_vic"];
	comment "ADDS REPAIR";
	
	_vic addAction ["<t color='#47FF1A'>Repair Turret</t>",
	{
		[_this select 0] execVM (actionBasedQuick+repair+repair65);
	}];		   
	   
	
	_vic addEventHandler ["HandleDamage", { 
      _damage = _this select 2; 
           if ( (_this select 1 == "") and (_damage > 0.75) ) then 
		   { 
			_damage = 0.75; 
		   }
		   else
		   {
		   
		   
		   };
       _damage; 
       }];
	};

	
["B_HMG_01_A_F", "init",UAVT, true, [], true] call CBA_fnc_addClassEventHandler; 

["Republic_ATTE", "init",rexiAtteBase, true, [], true] call CBA_fnc_addClassEventHandler; 

