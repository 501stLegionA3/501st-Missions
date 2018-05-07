//last update 20/4/2018 4:40 pm est by Rexi

//Factorizations

	//Locations
		_arc170="\arc170";
		_actionBased="\action_menu";
		_aiBased="\ai_based";
		_airBased="\air_based";
		_aviation="\aviation";
		_boost="\boost";
		_factionBased="\faction_based";
		_laat="\laat";
		_landBased="\land_based";
		_item="\Items";
		_pilotBased="\pilot_based";
		_playerBased="\played_based";
		_repair="\repair";
		_root="scripts\zeus3denScripts";
		_seaBased="\sea_based";
		_smoke="\smoke";
		_vehicleBased="\vehicle_based";
		_vehicleVariant="\vehicle_variants";
		_wardenBased="\warden_based";
		ywing="\ywing";
		_zeusFncPanel="\zeus_function_panel";

	//Objects
		_aat="\AAT\aatMohawkClassBase.sqf";
		_arc170="\ARC\arcXiphos.sqf";
		_atteBase="\ATTE\atteBase.sqf";
		_atteType="\ATTE\atteTypeSelector.sqf";
		_b1AT="\b1\b1at_at.sqf";
		_b1Heavy="\b1\b1heavy.sqf";
		_b1Sniper="\b1\b1sniper.sqf";
		_b2="\b2\b2Reconfig.sqf";
		_barc="\BARC\barc.sqf";
		_bluforSpeedboat="\bluforSpeedBoat.sqf";
		_droideka="\droideka\droideka.sqf";
		_dwarfSpiderDroid="\dwarf_spider_droid\dwarf_spider_droid.sqf";
		_hailfire="\Hailfire\HailfireBallista.sqf";
		_hmp="\HMP\hmp.sqf";
		_laat="\LAAT\laatClaymore.sqf";
		_magnaDroid="\magna\magna.sqf";
		_mortar="\Mortar\mortars.sqf";
		_mtt="\MTT\mttdeploy.sqf";
		_opforSpeedboat="\opforSpeedBoat.sqf";
		_sabre="\sabres\Sabres.sqf";
		_specOpDroid="\spec_ops\spec_ops.sqf";
		_speedBoat="\speed_boats";
		_triDroid="\TRIDROID\tri_droid.sqf";
		_vWing="\VWing\vwingarrow.sqf";
		_vulture="\VULTURE\vultureBase.sqf";
		_ywing="\YWING\ywingScylla.sqf";

	//Factions
		//Sides
			_blufor="\blufor";
			_opfor="\opfor";
			_civ="\civilian";

		//Unit Factions
			_cis="\cis";

	//Scripts and functions
		_arcSmokeNorm="\arc_smoke_tip.sqf";
		_arcSmokePurBlu="\arc_smoke_tip_pur_blu.sqf";
		_arcSmokeRedBlu="\arc_smoke_tip_red_blu.sqf";
		_arcSmokeWhiteBlu="\arc_smoke_tip_white_blu.sqf";
		_advSlingLoad="\fn_advancedSlingLoadingInit.sqf";
		_laatSmoke="\laat_smoke_tip.sqf";
		_resupplyBox="\Resupply_boxes.sqf";
		_repair65="repair_to_65.sqf";
		_repairMore="repair_to_more.sqf";
		_rngCiv="\RandomSWCIV.sqf";
		_wardenAmmoBox="\wardenAmmoBox.sqf";
		_ywingSmoke="\ywing_smoke_tip.sqf";
		_zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";

//These are here so that the file path can be accessed outside of this script, the variables are tied to the mission itself
	//Locations
		missionNamespace setVariable ["_actionBased",_actionBased];
		missionNamespace setVariable ["_aiBased",_aiBased];
		missionNamespace setVariable ["_airBased",_airBased];
		missionNamespace setVariable ["_aviation",_aviation];
		missionNamespace setVariable ["_factionBased",_factionBased];
		missionNamespace setVariable ["_landBased",_landBased];
		missionNamespace setVariable ["_item",_item];
		missionNamespace setVariable ["_pilotBased",_pilotBased];
		missionNamespace setVariable ["_playerBased",_playerBased];
		missionNamespace setVariable ["_root",_root];
		missionNamespace setVariable ["_seaBased",_seaBased];
		missionNamespace setVariable ["_vehicleBased",_vehicleBased];
		missionNamespace setVariable ["_vehicleVariant",_vehicleVariant];
		missionNamespace setVariable ["_wardenBased",_wardenBased];
		missionNamespace setVariable ["_zeusFncPanel",_zeusFncPanel];

	//Objects
		missionNamespace setVariable ["_aat",_aat];
		missionNamespace setVariable ["_arc170",_arc170];
		missionNamespace setVariable ["_atteBase",_atteBase];
		missionNamespace setVariable ["_atteType",_atteType];
		missionNamespace setVariable ["_b1AT",_b1AT];
		missionNamespace setVariable ["_b1Heavy",_b1Heavy];
		missionNamespace setVariable ["_b1Sniper",_b1Sniper];
		missionNamespace setVariable ["_b2",_b2];
		missionNamespace setVariable ["_barc",_barc];
		missionNamespace setVariable ["_bluforSpeedboat",_bluforSpeedboat];
		missionNamespace setVariable ["_droideka",_droideka];
		missionNamespace setVariable ["_dwarfSpiderDroid",_dwarfSpiderDroid];
		missionNamespace setVariable ["_hailfire",_hailfire];
		missionNamespace setVariable ["_hmp",_hmp];
		missionNamespace setVariable ["_laat",_laat];
		missionNamespace setVariable ["_magnaDroid",_magnaDroid];
		missionNamespace setVariable ["_mortar",_mortar];
		missionNamespace setVariable ["_mtt",_mtt];
		missionNamespace setVariable ["_opforSpeedboat",_opforSpeedboat];
		missionNamespace setVariable ["_sabre",_sabre];
		missionNamespace setVariable ["_specOpDroid",_specOpDroid];
		missionNamespace setVariable ["_speedBoat",_speedBoat];
		missionNamespace setVariable ["_triDroid",_triDroid];
		missionNamespace setVariable ["_vWing",_vWing];
		missionNamespace setVariable ["_vulture",_vulture];
		missionNamespace setVariable ["_ywing",_ywing];

	//Sides
		missionNamespace setVariable ["_blufor",_blufor];
		missionNamespace setVariable ["_opfor",_opfor];
		missionNamespace setVariable ["_civ",_civ];

	//Unit factions
		missionNamespace setVariable ["_cis",_cis];

	//Scripts and functions
		missionNamespace setVariable ["_advSlingLoad",_advSlingLoad];
		missionNamespace setVariable ["_resupplyBox",_resupplyBox];
		missionNamespace setVariable ["_rngCiv",_rngCiv];
		missionNamespace setVariable ["_wardenAmmoBox",_wardenAmmoBox];
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