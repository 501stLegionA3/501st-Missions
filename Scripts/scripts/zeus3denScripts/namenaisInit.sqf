//last update 20/4/2018 4:40 pm est by Rexi

//Factorizations

	//Locations
		_arc170="\arc170";
		missionNamespace setVariable ["_arc170",_arc170];
		_actionBased="\action_menu";
		missionNamespace setVariable ["_actionBased",_actionBased];
		_aiBased="\ai_based";
		missionNamespace setVariable ["_aiBased",_aiBased];
		_airBased="\air_based";
		missionNamespace setVariable ["_airBased",_airBased];
		_aviation="\aviation";
		missionNamespace setVariable ["_aviation",_aviation];
		_boost="\boost";
		missionNamespace setVariable ["_boost",_boost];
		_factionBased="\faction_based";
		missionNamespace setVariable ["_factionBased",_factionBased];
		_hmp="\hmp";
		missionNamespace setVariable ["_hmp",_hmp];
		_laat="\laat";
		missionNamespace setVariable ["_laat",_laat];
		_landBased="\land_based";
		missionNamespace setVariable ["_landBased",_landBased];
		_item="\Items";
		missionNamespace setVariable ["_item",_item];
		_pilotBased="\pilot_based";
		missionNamespace setVariable ["_pilotBased",_pilotBased];
		_playerBased="\played_based";
		missionNamespace setVariable ["_playerBased",_playerBased];
		_repair="\repair";
		missionNamespace setVariable ["_repair",_repair];
		_root="scripts\zeus3denScripts";
		missionNamespace setVariable ["_root",_root];
		_seaBased="\sea_based";
		missionNamespace setVariable ["_seaBased",_seaBased];
		_smoke="\smoke";
		missionNamespace setVariable ["_smoke",_smoke];
		_tridroid="\tridroid";
		missionNamespace setVariable ["_tridroid",_tridroid];
		_vehicleBased="\vehicle_based";
		missionNamespace setVariable ["_vehicleBased",_vehicleBased];
		_vehicleVariant="\vehicle_variants";
		missionNamespace setVariable ["_vehicleVariant",_vehicleVariant];
		_wardenBased="\warden_based";
		missionNamespace setVariable ["_wardenBased",_wardenBased];
		ywing="\ywing";
		missionNamespace setVariable ["ywing",ywing];
		_zeusFncPanel="\zeus_function_panel";
		missionNamespace setVariable ["_zeusFncPanel",_zeusFncPanel];

	//Objects
		_aat="\AAT\aatMohawkClassBase.sqf"; 		
		missionNamespace setVariable ["_aat",_aat];
		_arc170=_arc170+"\arcXiphos.sqf"; 		
		missionNamespace setVariable ["_arc170",_arc170];
		_atteBase="\ATTE\atteBase.sqf"; 		
		missionNamespace setVariable ["_atteBase",_atteBase];
		_atteType="\ATTE\atteTypeSelector.sqf"; 		
		missionNamespace setVariable ["_atteType",_atteType];
		_b1AT="\b1\b1at_at.sqf"; 		
		missionNamespace setVariable ["_b1AT",_b1AT];
		_b1Heavy="\b1\b1heavy.sqf"; 		
		missionNamespace setVariable ["_b1Heavy",_b1Heavy];
		_b1Sniper="\b1\b1sniper.sqf"; 		
		missionNamespace setVariable ["_b1Sniper",_b1Sniper];
		_b2="\b2\b2Reconfig.sqf"; 		
		missionNamespace setVariable ["_b2",_b2];
		_barc="\BARC\barc.sqf"; 		
		missionNamespace setVariable ["_barc",_barc];
		_bluforSpeedboat="\bluforSpeedBoat.sqf"; 		
		missionNamespace setVariable ["_bluforSpeedboat",_bluforSpeedboat];
		_droideka="\droideka\droideka.sqf"; 		
		missionNamespace setVariable ["_droideka",_droideka];
		_dwarfSpiderDroid="\dwarf_spider_droid\dwarf_spider_droid.sqf"; 		
		missionNamespace setVariable ["_dwarfSpiderDroid",_dwarfSpiderDroid];
		_hailfire="\Hailfire\HailfireBallista.sqf"; 		
		missionNamespace setVariable ["_hailfire",_hailfire];
		_hmp="\HMP\hmp.sqf"; 		
		missionNamespace setVariable ["_hmp",_hmp];
		_laat="\LAAT\laatClaymore.sqf"; 		
		missionNamespace setVariable ["_laat",_laat];
		_magnaDroid="\magna\magna.sqf"; 		
		missionNamespace setVariable ["_magnaDroid",_magnaDroid];
		_mortar="\Mortar\mortars.sqf"; 		
		missionNamespace setVariable ["_mortar",_mortar];
		_mtt="\MTT\mttdeploy.sqf"; 		
		missionNamespace setVariable ["_mtt",_mtt];
		_opforSpeedboat="\opforSpeedBoat.sqf"; 		
		missionNamespace setVariable ["_opforSpeedboat",_opforSpeedboat];
		_sabre="\sabres\Sabres.sqf"; 		
		missionNamespace setVariable ["_sabre",_sabre];
		_specOpDroid="\spec_ops\spec_ops.sqf"; 		
		missionNamespace setVariable ["_specOpDroid",_specOpDroid];
		_speedBoat="\speed_boats"; 		
		missionNamespace setVariable ["_speedBoat",_speedBoat];
		_triDroid="\TRIDROID\tri_droid.sqf"; 		
		missionNamespace setVariable ["_triDroid",_triDroid];
		_vWing="\VWing\vwingarrow.sqf"; 		
		missionNamespace setVariable ["_vWing",_vWing];
		_vulture="\VULTURE\vultureBase.sqf"; 		
		missionNamespace setVariable ["_vulture",_vulture];
		_ywing="\YWING\ywingScylla.sqf"; 		
		missionNamespace setVariable ["_ywing",_ywing];
 
	//Factions
		//Sides
			_blufor="\blufor"; 		
			missionNamespace setVariable ["_blufor",_blufor];
			_opfor="\opfor"; 		
			missionNamespace setVariable ["_opfor",_opfor];
			_civ="\civilian"; 		
			missionNamespace setVariable ["_civ",_civ];

		//Unit Factions
			_cis="\cis";
			missionNamespace setVariable ["_cis",_cis];

	//Scripts and functions
		_arcSmokeNorm="\arc_smoke_tip.sqf";
		missionNamespace setVariable ["_arcSmokeNorm",_arcSmokeNorm];
		_arcSmokePurBlu="\arc_smoke_tip_pur_blu.sqf";
		missionNamespace setVariable ["_arcSmokePurBlu",_arcSmokePurBlu];
		_arcSmokeRedBlu="\arc_smoke_tip_red_blu.sqf";
		missionNamespace setVariable ["_arcSmokeRedBlu",_arcSmokeRedBlu];
		_arcSmokeWhiteBlu="\arc_smoke_tip_white_blu.sqf";
		missionNamespace setVariable ["_arcSmokeWhiteBlu",_arcSmokeWhiteBlu];
		_advSlingLoad="\fn_advancedSlingLoadingInit.sqf";
		missionNamespace setVariable ["_advSlingLoad",_advSlingLoad];
		_laatSmoke="\laat_smoke_tip.sqf";
		missionNamespace setVariable ["_laatSmoke",_laatSmoke];
		_repair65="repair_to_65.sqf";
		missionNamespace setVariable ["_repair65",_repair65];
		_repairMore="repair_to_more.sqf";
		missionNamespace setVariable ["_repairMore",_repairMore];
		_resupplyBox="\Resupply_boxes.sqf";
		missionNamespace setVariable ["_resupplyBox",_resupplyBox];
		_rngCiv="\RandomSWCIV.sqf";
		missionNamespace setVariable ["_rngCiv",_rngCiv];
		_wardenAmmoBox="\wardenAmmoBox.sqf";
		missionNamespace setVariable ["_wardenAmmoBox",_wardenAmmoBox];
		_ywingSmoke="\ywing_smoke_tip.sqf";
		missionNamespace setVariable ["_ywingSmoke",_ywingSmoke];
		_zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";
		missionNamespace setVariable ["_zeusVarNFncPanel",_zeusVarNFncPanel];




_checkSumVariable=0;
_checkSumCounter=1;

//global variables that are used----------------------- decommissioned due to public variables being too hard-------------------- 
	//[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";
try {	
//Allow zeus to change global variables-also Hermes Panel
	[] execVM (_root+_zeusFncPanel+_zeusVarNFncPanel);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;
}
catch {
}
//Hades Panel - Currently decommissioned
	//[] execVM "scripts\zeus3denScripts\ZeusfunctionPanel\zeusVariableAndFunctionPanelHades.sqf";

//laat weapons,adds weapons and wingtip smoke
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_laat);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//arc-170 weapon,adds weapons,wingtip smoke and ejection prevention
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_arc170);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;	

//y-wing weapons,adds weapons and wingtip smoke
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_ywing);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;	

//b2 reconfig,forces b2's to walk
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b2);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Blufor Speedboat,adds republic eweb for rear and u-wing gunner gun for main cannon
	[] execVM (_root+_vehicleBased+_vehicleVariant+_seaBased+_speedBoat+_blufor+_bluforSpeedboat);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Opfor Speedboat,adds imperial eweb for rear and u-wing gunner gun for main cannon
	[] execVM (_root+_vehicleBased+_vehicleVariant+_seaBased+_speedBoat+_opfor+_opforSpeedboat);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;	

//AT-TE Base scripts,the armor and repair
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_atteBase);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//AT-TE Type Selector that spawns in the at-te class type
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_atteType);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//AAT weapons
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_aat);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Vulture droid weapons
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_vulture);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Add's flares to simulate plasma Mortars NATO and CSAT
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_mortar);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Sabre adds weapons and smokes and damage reports
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_sabre);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//barc allows barcs to be loaded into vehicles with a cargo space 4 or greater
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_barc);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Eulers Spec Ops droids
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_specOpDroid);	
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//adds deploy option to mtt
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_mtt);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//adds  Make B1 ats have better launchers
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b1AT);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//adds  Make B1 Heavy have better weapons
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b1Heavy);	
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//adds  Make  Magma Droids Stronger
	[] execVM  (_root+_aiBased+_factionBased+_opfor+_cis+_magnaDroid);	
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//adds advanced sling loading
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_advSlingLoad);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Star Wars Civilian Spawner
	[] execVM (_root+_aiBased+_factionBased+_civ+_rngCiv);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Resupply Boxes
	[] execVM (_root+_playerBased+_item+_resupplyBox);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Warden ammo and fuel system	
	[] execVM (_root+_playerBased+_aviation+_wardenBased+_wardenAmmoBox);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Tri Droid
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_triDroid);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//V-Wing
	[] execVM(_root+_vehicleBased+_vehicleVariant+_airBased+_vWing);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;	

//Hailfire Droid
	[] execVM (_root+_vehicleBased+_vehicleVariant+_landBased+_hailfire);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Sniper Droid	
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_b1Sniper);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Droideka spawny script
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_droideka);	
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//Dwarf Spider Droid spawny script
	[] execVM (_root+_aiBased+_factionBased+_opfor+_cis+_dwarfSpiderDroid);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;

//HMP Gunship
	[] execVM (_root+_vehicleBased+_vehicleVariant+_airBased+_hmp);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;	

	missionNamespace setVariable ["checkSum",_checkSumVariable];
	missionNamespace setVariable ["checkSumCounter",_checkSumCounter];