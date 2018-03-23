//----------
//Now this file is called in the init.sqf. Thus whenever the the atteTypeSelector is executed and the at-te from there is spawned,this is ran


//Function that makes at-te gun do more dmg
rexiAtteBulMux={
	
	
	_rexiUnit = (_this select 0); 
	_rexiProjType = _this select 4; 
	_rexiProjectile = _this select 6; 
	_rexiUp = vectorUp _rexiProjectile; 
	_rexiProjPos = getPosASL _rexiProjectile; 
	_RexiDist=1; 
	for "_i" from 1 to 4 do { 
			 
	_rexiO = _rexiProjType createVehicle _rexiProjPos; 
	_rexiO setPosASL [ 
	(_rexiProjPos select 0) + ((vectorDir _rexiUnit) select 0)*(_RexiDist), 
	(_rexiProjPos select 1) + ((vectorDir _rexiUnit) select 1)*(_RexiDist), 
	(_rexiProjPos select 2) + ((vectorDir _rexiUnit) select 2)*(_RexiDist) 
	 ]; 
	_rexiO setVectorDirAndUp[(vectorDir _rexiUnit),_rexiUp]; 
	_rexiO setVelocity velocity _rexiProjectile; 
	}; 
	

};//end at-te bul mux






//general script
rexiAtteBase={
	params["_vic"];
	
	_rexiHasBeenModded= _vic getVariable ["modded", false];
	
	//adds the ability to check how much dmg the at-te has taken
	_vic addAction ["<t color='#00FF00'>Hull Damage Report</t>",
	{


		hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];

	},[1],0,false,true,""," commander  _target == _this "];
	
	
	_vic removeAllEventHandlers "Fired";
	
	//ads repair function
	_vic  addAction ["<t color='#FC6F07'>Repair</t>",
	{
		[_this select 0] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Repair\repairTo65.sqf";
	}];	

	//handles reducing dmg taken by at-te
	_vic addeventhandler ["HandleDamage",
	{
		_rexiUnit = _this select 0;
		_rexiSelection = _this select 1;
		_rexiPassedDamage = _this select 2;
		_rexiOldDamage = 0;
		_rexiDmgScaleFactor=6;
		switch(_rexiSelection)do{
			case(""):{_rexiOldDamage = damage _rexiUnit;};
			default{};
		};
		_rexiReturn = _rexiOldDamage + ((_rexiPassedDamage - _rexiOldDamage) / _rexiDmgScaleFactor);
		_rexiReturn
	}];


};//end at-te Base


//Add repair ability to turrets and makes it so that they cant die 100%,just disabled
UAVT={
	params["_vic"];
	comment "ADDS REPAIR";
	
	_vic addAction ["<t color='#47FF1A'>Repair</t>",
	{[_this select 0] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Repair\repair.sqf";}];		   
	   
	
	_vic addEventHandler ["HandleDamage", { 
      _damage = _this select 2; 
           if ( (_this select 1 == "") and (_damage > 0.9999) ) then { _damage = 0.9999 }; 
       _damage; 
       }];
	};

	
["B_HMG_01_A_F", "init",UAVT, true, [], true] call CBA_fnc_addClassEventHandler; 

["Republic_ATTE", "init",rexiAtteBase, true, [], true] call CBA_fnc_addClassEventHandler; 

["Republic_ATTE", "fired",rexiAtteBulMux] call CBA_fnc_addClassEventHandler;
