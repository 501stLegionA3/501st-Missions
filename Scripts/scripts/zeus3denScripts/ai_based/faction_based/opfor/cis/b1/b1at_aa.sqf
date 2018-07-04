 //Adds AA launcher to B1 battledroids.
 //Created by Rexi 20/04/2018
	{
    if ((typeOf _x) in ["SWOP_CIS_droid_AT","SWOP_CIS_geon_droid_AT"]) then {
            
	_x removeWeapon "launch_MRAWS_sand_F";
	_x addWeapon "RocketRPS6_F";
	for [{_i=0}, {_i<2}, {_i=_i+1}] do
	{
	_x addMagazine "RocketRPS6_F";
	};    
    };
    } forEach allUnits;
	
	
	
		{
    if ((typeOf _x) in ["SWOP_CIS_camo_droid_AT"]) then {
            
	_x removeWeapon "launch_MRAWS_green_F";
	_x addWeapon "RocketRPS6_F";
	for [{_i=0}, {_i<2}, {_i=_i+1}] do
	{
	_x addMagazine "RocketRPS6_F";
	};    
    };
    } forEach allUnits;
	
		
	hintSilent "Existing B1 AT droids have had AA Launcher added";
	
