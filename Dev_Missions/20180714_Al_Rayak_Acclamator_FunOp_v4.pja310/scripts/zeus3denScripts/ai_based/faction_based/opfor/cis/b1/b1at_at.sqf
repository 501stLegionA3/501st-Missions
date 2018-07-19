 //Adds AT launcher to B1 battledroids.
  //Created by Rexi 20/04/2018
 atb1={
	params["_atb1"];
	_atb1 removeWeapon "SW_E60r";
	_atb1 addWeapon "launch_MRAWS_sand_F";
	for [{_i=0}, {_i<5}, {_i=_i+1}] do
	{
	_atb1 addMagazine "MRAWS_HE_F";
	}; 
};				
		
 atcb1={
	params["_atb1"];
	_atb1 removeWeapon "SW_E60r";
	_atb1 addWeapon "launch_MRAWS_green_F";
	for [{_i=0}, {_i<5}, {_i=_i+1}] do
	{
	_atb1 addMagazine "MRAWS_HE_F";
	}; 
};		

		
["SWOP_CIS_droid_AT", "init",atb1, false, [], false] call CBA_fnc_addClassEventHandler; 
["SWOP_CIS_camo_droid_AT", "init",atcb1, false, [], false] call CBA_fnc_addClassEventHandler; 
["SWOP_CIS_geon_droid_AT", "init",atb1, false, [], false] call CBA_fnc_addClassEventHandler; 
