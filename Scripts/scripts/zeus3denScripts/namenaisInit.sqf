//last update 3/25/2018 11:50 pm est by namenai

//global variables that are used
	[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";


//laat weapons,adds weapons and wingtip smoke
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\LAAT\laatClaymore.sqf";

//arc-170 weapon,adds weapons,wingtip smoke and ejection prevention
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\arcXiphos.sqf";
	
//y-wing weapons,adds weapons and wingtip smoke
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\YWING\ywingScylla.sqf";
	
//b2 reconfig,forces b2's to walk
	[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b2\b2Reconfig.sqf";

//Blufor Speedboat,adds republic eweb for rear and u-wing gunner gun for main cannon
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\seaBased\speedBoats\Blufor\bluforSpeedBoat.sqf";

//Opfor Speedboat,adds imperial eweb for rear and u-wing gunner gun for main cannon
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\seaBased\speedBoats\Opfor\opforSpeedBoat.sqf";
	
//AT-TE Base scripts,the armor and repair
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteBase.sqf";
	
//AT-TE Type Selector that spawns in the at-te class type
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteTypeSelector.sqf";

//AAT weapons
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\AAT\aatMohawkClassBase.sqf";
	
	

