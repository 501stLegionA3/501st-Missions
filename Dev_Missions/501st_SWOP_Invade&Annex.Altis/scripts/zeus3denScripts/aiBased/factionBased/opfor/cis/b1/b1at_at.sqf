 //Adds AT launcher to B1 battledroids.
  {
    if ((typeOf _x) in ["SWOP_CIS_droid_AT","SWOP_CIS_camo_droid_AT","SWOP_CIS_geon_droid_AT"]) then {
            
	_x removeWeapon "SW_E60r";
	_x addWeapon "launch_RPG32_F";
	for [{_i=0}, {_i<2}, {_i=_i+1}] do
	{
	_x addMagazine "RPG32_F";
	};    
    };
    } forEach allUnits;
	
	hintSilent "Existing B1 AT droids have had RPG Launcher added";
	
