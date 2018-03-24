rexiAtteTypeSelector={
    params["_vic"];


    _vic  addAction ["<t color='#47FF1A'>All Terrain Tactical Enforcer</t>",                
    {
    compspawner = _this select 0;
    [compspawner] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteTridentClass.sqf";
    }];
    _vic addUniform "SWOP_CloneOf_B_F_CombatUniform";
    _vic addheadgear "SWOP_cloneofficer_capb";
    ([_vic,true] call ace_captives_fnc_setHandcuffed) 

    };//end typeSelector
    
    ["B_Soldier_VR_F", "init",rexiAtteTypeSelector, true, [], true] call CBA_fnc_addClassEventHandler; 
	
	["swclonerecondroid", "init",rexiAtteTypeSelector, true, [], true] call CBA_fnc_addClassEventHandler; 

	
