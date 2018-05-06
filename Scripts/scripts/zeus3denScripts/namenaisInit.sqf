//last update 20/4/2018 4:40 pm est by Rexi

_root="scripts\zeus3denScripts";
_zeusFncPanel="\ZeusfunctionPanel";
_zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";

_vehicleBased="\vehicleBased";
_vehicleVariant="\vehicleVariants";
_airBased="\airBased";
_laat="\LAAT\laatClaymore.sqf";

//global variables that are used----------------------- decommissioned due to public variables being too hard-------------------- 
	//[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";
	
//Allow zeus to change global variables-also Hermes Panel
	[] execVM (_root+_zeusFncPanel+_zeusVarNFncPanel);

//Hades Panel - Currently decommissioned
	//[] execVM "scripts\zeus3denScripts\ZeusfunctionPanel\zeusVariableAndFunctionPanelHades.sqf";

//laat weapons,adds weapons and wingtip smoke
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_laat);

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
	
//Vulture droid weapons
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\VULTURE\vultureBase.sqf";
	
//Add's flares to simulate plasma Mortars NATO and CSAT
	[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landbased\Mortar\mortars.sqf";

//Sabre adds weapons and smokes and damage reports
	[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\Landbased\sabres\Sabres.sqf";

//barc allows barcs to be loaded into vehicles with a cargo space 4 or greater
	[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\Landbased\barc\barc.sqf";

//Eulers Spec Ops droids
	[] execVM  "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\spec_ops\spec_ops.sqf";	
	
//adds deploy option to mtt
	[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\MTT\mttdeploy.sqf";	
	
//adds  Make B1 ats have better launchers
	[] execVM  "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1at_at.sqf";		

//adds  Make B1 Heavy have better weapons
	[] execVM  "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1heavy.sqf";		

//adds  Make  Magma Droids Stronger
	[] execVM  "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\Magma\Magma.sqf";		
	
//adds advanced sling loading
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\fn_advancedSlingLoadingInit.sqf";
	
//Star Wars Civilian Spawner
	[] execVM "scripts\zeus3denScripts\aiBased\factionBased\Civilian\RandomSWCIV.sqf";
	
//Resupply Boxes
	[] execVM "scripts\zeus3denScripts\playerBased\Items\Resupply_boxes.sqf";
	
//Warden ammo and fuel system	
	[] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";

//Tri Droid
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\TRIDROID\tri_droid.sqf";
	
//V-Wing
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\VWing\vwingarrow.sqf";
	
//Hailfire Droid
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\Hailfire\HailfireBallista.sqf";
		
//Hailfire Droid	
		[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1sniper.sqf";
		
//Droideka spawny script
	[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\Droideka\Droideka.sqf";	
	
//Dwarf Spider Droid spawny script
	[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\DSD\DSD.sqf";	
		
//HMP Gunship
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\HMP\hmp.sqf";