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
		_rexiDmgScaleFactor=3;
		switch(_rexiSelection)do{
			case(""):{_rexiOldDamage = damage _rexiUnit;};
			default{};
		};
		//_rexiReturn = _rexiOldDamage + ((_rexiPassedDamage - _rexiOldDamage) / _rexiDmgScaleFactor);
		_rexiReturn = _rexiOldDamage + ((_rexiPassedDamage ) / _rexiDmgScaleFactor);
		if((_rexiReturn+_rexiOldDamage)>1) then 
		{
			hint format["dead %1",time];
			_namAtteObjArray=_rexiUnit getVariable "atteObjectsOnIt";
			{ 
				[west, "HQ"] sideChat format["%1 is dead %2",_x,time];
				_x setDammage 1; 
			} forEach _namAtteObjArray;
			
		}
		else 
		{  
			hint format["not dead lolollol %1",time];
		};
		_rexiReturn
	}];


};//end at-te Base





["Republic_ATTE", "init",rexiAtteBase, true, [], true] call CBA_fnc_addClassEventHandler; 

["Republic_ATTE", "fired",rexiAtteBulMux] call CBA_fnc_addClassEventHandler;