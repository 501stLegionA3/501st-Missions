 //Makes B1 Sniper battledroids stronger,faster,meaner jk just able to shoot better and lie down.
 //Created by Rexi 20/04/2018   - Designed by Euler
 //Last Edit - Zatama 15.6.18
 Sb1={
	params["_b1S"];
	
	
	_b1s setSkill 1;
	_b1s setskill ["aimingAccuracy", 1]; 
	_b1s setskill ["aimingShake", 1]; 
	_b1s setskill ["aimingSpeed", 1]; 
	_b1s setskill ["spotDistance", 1]; 
	_b1s setskill ["spotTime", 1]; 
	_b1s setskill ["courage", 1]; 
	_b1s setskill ["reloadSpeed", 1]; 
	_b1s setSkill ["general", 1]; 
	_b1s setunitpos "auto";
		
};				
			
["SWOP_CIS_droid_sniper", "init",Sb1, false, [], false] call CBA_fnc_addClassEventHandler; 
["SWOP_CIS_geon_droid_sniper", "init",Sb1, false, [], false] call CBA_fnc_addClassEventHandler; 
["SWOP_CIS_camo_droid_sniper", "init",Sb1, false, [], false] call CBA_fnc_addClassEventHandler;




