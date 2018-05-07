//last update 20/4/2018 4:40 pm est by Rexi

_root="scripts\zeus3denScripts";
_zeusFncPanel="\ZeusfunctionPanel";
_zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";

_vehicleBased="\vehicleBased";
_vehicleVariant="\vehicleVariants";
_airBased="\airBased";
_laat="\LAAT\laatClaymore.sqf";
_arc170="\ARC\arcXiphos.sqf";
_ywing="\YWING\ywingScylla.sqf";

_aiBased="\aiBased\";
_factionBased="\factionBased";
_opfor="\opfor";
_cis="\cis";
_b2="\b2\b2Reconfig.sqf";

_seaBased="\seaBased";
_speedBoat="\speedBoats"
_blufor="\blufor";
_bluforSpeedboat="\bluforSpeedBoat.sqf";
_opforSpeedboat="\opforSpeedBoat.sqf";

_landBased="\landBased";
_atteBase="\ATTE\atteBase.sqf";
_atteType="\ATTE\atteTypeSelector.sqf";

_aat="\AAT\aatMohawkClassBase.sqf";
_vulture="\VULTURE\vultureBase.sqf";
_mortar="\Mortar\mortars.sqf";
_sabre="\sabres\Sabres.sqf";
_barc="barc\barc.sqf";

_specOpDroid="\spec_ops\spec_ops.sqf";

_mtt="\MTT\mttdeploy.sqf";
_b1AT="\b1\b1at_at.sqf";
_b1Heavy="\b1\b1heavy.sqf";
_magnaDroid="\Magma\Magma.sqf";
_advSlingLoad="\fn_advancedSlingLoadingInit.sqf";

_civ="\Civilian";
_rngCiv="\RandomSWCIV.sqf";

_playerBased="\playerBased";
_item="\Items";
_resupplyBox="\Resupply_boxes.sqf";

_aviation="\aviation";
_wardenBased="\wardenBased";

_wardenAmmoBox="\wardenAmmoBox.sqf";

_triDroid="\TRIDROID\tri_droid.sqf";
_vWing="\VWing\vwingarrow.sqf";
_hailfire="\Hailfire\HailfireBallista.sqf";
_b1Sniper="\b1\b1sniper.sqf";
_droideka="\Droideka\Droideka.sqf";
_dwarfSpiderDroid="\DSD\DSD.sqf";
_hmp="\HMP\hmp.sqf";

//global variables that are used----------------------- decommissioned due to public variables being too hard-------------------- 
	//[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";
	
//Allow zeus to change global variables-also Hermes Panel
	[] execVM (_root+_zeusFncPanel+_zeusVarNFncPanel);

//Hades Panel - Currently decommissioned
	//[] execVM "scripts\zeus3denScripts\ZeusfunctionPanel\zeusVariableAndFunctionPanelHades.sqf";

//laat weapons,adds weapons and wingtip smoke
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_laat);

//arc-170 weapon,adds weapons,wingtip smoke and ejection prevention
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_arc170);
	
//y-wing weapons,adds weapons and wingtip smoke
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_ywing);
	
//b2 reconfig,forces b2's to walk
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b2);

//Blufor Speedboat,adds republic eweb for rear and u-wing gunner gun for main cannon
	[] execVM (_root+_vehicleBased+_vehicleVariant+_seaBased+_speedBoat+_blufor+_bluforSpeedboat);

//Opfor Speedboat,adds imperial eweb for rear and u-wing gunner gun for main cannon
	[] execVM (_root+_vehicleBased+_vehicleVariant+_seaBased+_speedBoat+_opfor+_opforSpeedboat);
	
//AT-TE Base scripts,the armor and repair
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_atteBase);
	
//AT-TE Type Selector that spawns in the at-te class type
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_atteType);

//AAT weapons
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_aat);
	
//Vulture droid weapons
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_vulture);
	
//Add's flares to simulate plasma Mortars NATO and CSAT
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_mortar);

//Sabre adds weapons and smokes and damage reports
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_sabre);

//barc allows barcs to be loaded into vehicles with a cargo space 4 or greater
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_barc);

//Eulers Spec Ops droids
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_specOpDroid);	
	
//adds deploy option to mtt
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_mtt);
	
//adds  Make B1 ats have better launchers
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b1AT);

//adds  Make B1 Heavy have better weapons
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b1Heavy);	

//adds  Make  Magma Droids Stronger
	[] execVM  (_root+_aiBased+_factionBased+_opfor+_cis+_magnaDroid);	
	
//adds advanced sling loading
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_advSlingLoad);
	
//Star Wars Civilian Spawner
	[] execVM (_root+_aiBased+_factionBased+_civ+_rngCiv);
	
//Resupply Boxes
	[] execVM (_root+_playerBased+_item+_resupplyBox);
	
//Warden ammo and fuel system	
	[] execVM (_root+_playerBased+_aviation+_wardenBased+_wardenAmmoBox);

//Tri Droid
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_triDroid);
	
//V-Wing
	[] execVM(_root+_vehicleBased+_vehicleVariant+_airBased+_vWing);
	
//Hailfire Droid
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_hailfire);
		
//Sniper Droid	
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b1Sniper);
		
//Droideka spawny script
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_droideka);	
	
//Dwarf Spider Droid spawny script
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_dwarfSpiderDroid);
		
//HMP Gunship
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_hmp);