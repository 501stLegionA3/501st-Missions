 //Adds Randomised weapons to B1 battledroids.
 //Created by Rexi 20/04/2018   - Designed by Euler
 atb1={
	params["_b1h"];
	
	for [{_i=0}, {_i<10}, {_i=_i+1}] do
	{
	_b1h addItemToBackpack "swop_CISShotgun_Mag";
	_b1h addItemToBackpack "SWOP_EE3BlasterRifle_Mag";
	_b1h addItemToBackpack "SWOP_E5C_Mag";
	}; 
	
//Uniforms to select from
	_heavyguns = [ 
	"swop_CISShotgun","SWOP_EE3BlasterRifle","SWOP_E5C"	
	];
	_guncount = count _heavyguns;
//selects random gun
	_b1h addWeapon (_heavyguns select floor random _guncount);
	
		
};				
			
["SWOP_CIS_droid_mg", "init",atb1, false, [], false] call CBA_fnc_addClassEventHandler; 
["SWOP_CIS_geon_mg", "init",atb1, false, [], false] call CBA_fnc_addClassEventHandler; 





