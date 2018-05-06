//Ammo Resupply Box to be dropped or carried by LAAT or vehicle
//Created by Rexi
large_ammo=
	{
	params["_vic"];
	_vic  addAction ["<t color='#47FF1A'>Unlock</t>",                
    {
    box = _this select 0;
    [box] execVM "scripts\zeus3denScripts\playerBased\Items\Boxes\Large_ammo.sqf";
	[box] remoteExec ["removeAllActions"];
    }];
	};


small_ammo=
	{
	params["_vic"];
	_vic  addAction ["<t color='#47FF1A'>Unlock</t>",                
    {
    box = _this select 0;
    [box] execVM "scripts\zeus3denScripts\playerBased\Items\Boxes\Small_ammo.sqf";
	[box] remoteExec ["removeAllActions"];
    }];		
	};

	
Large_Medical=
	{
		params["_vic"];
	_vic  addAction ["<t color='#47FF1A'>Unlock</t>",                
    {
    box = _this select 0;
    [box] execVM "scripts\zeus3denScripts\playerBased\Items\Boxes\Large_medical.sqf";
	[box] remoteExec ["removeAllActions"];
    }];		
	};


small_Medical=
	{
			params["_vic"];
	_vic  addAction ["<t color='#47FF1A'>Unlock</t>",                
    {
    box = _this select 0;
    [box] execVM "scripts\zeus3denScripts\playerBased\Items\Boxes\Small_medical.sqf";
	[box] remoteExec ["removeAllActions"];
    }];			
	};
    
    
    ["plp_ct_highsecContRed", "init",Large_Medical, true, [], true] call CBA_fnc_addClassEventHandler; 
	["SWOP_BoxMedium3R", "init",small_Medical, true, [], true] call CBA_fnc_addClassEventHandler; 
    ["plp_ct_highsecContWhite", "init",Large_ammo, true, [], true] call CBA_fnc_addClassEventHandler; 
	["SWOP_BoxMedium3W", "init",small_ammo, true, [], true] call CBA_fnc_addClassEventHandler; 