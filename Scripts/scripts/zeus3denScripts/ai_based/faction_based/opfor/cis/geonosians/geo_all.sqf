 //Makes Geonosians a little less worthless
 //Created by Zatama 15.6.18   - Designed by Euler
 geon={
	params["_geon"];
	
	
	_geon setSkill 1;
	_geon setskill ["aimingAccuracy", 1]; 
	_geon setskill ["aimingShake", 1]; 
	_geon setskill ["aimingSpeed", 1]; 
	_geon setskill ["spotDistance", 1]; 
	_geon setskill ["spotTime", 1]; 
	_geon setskill ["courage", 1]; 
	_geon setskill ["reloadSpeed", 1]; 
	_geon setSkill ["general", 1]; 
	_geon setunitpos "auto";
		
};				
			
["swop_cis_geon_1", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 
["swop_cis_geon_2", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 
["swop_cis_geon_3", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 
["swop_cis_geon_elite", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 
["swop_cis_geon_pilot", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 
["swop_cis_geon_mg", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 
["swop_cis_geon_work", "init",geon, false, [], false] call CBA_fnc_addClassEventHandler; 