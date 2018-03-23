//Change watever obj u want to have be spawned so that ppl can spawn in a at-te
rexiAtteTypeSelector={
	params["_vic"];


	_vic  addAction ["<t color='#47FF1A'>All Terrain Tactical Enforcer</t>",                
	{
	compspawner = _this select 0;
    [compspawner] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteTridentClass.sqf";
	}];
	
	

	
	[_vic, -1] call ace_cargo_fnc_setSize
	
	};//end typeSelector
	
	["swclonerecondroid", "init",rexiAtteTypeSelector, true, [], true] call CBA_fnc_addClassEventHandler; 
	
	["sw_dropturretobject", "init",rexiAtteTypeSelector, true, [], true] call CBA_fnc_addClassEventHandler; 
	
