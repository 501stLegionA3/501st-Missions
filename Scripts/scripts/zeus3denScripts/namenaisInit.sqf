//last update 20/4/2018 4:40 pm est by Rexi

//Factorizations

	//Locations
		_aatPath="\aat";
		missionNamespace setVariable ["_aatPath",_aatPath,true];

		_actionBased="\action_menu";
		missionNamespace setVariable ["_actionBased",_actionBased,true];

		_aiBased="\ai_based";
		missionNamespace setVariable ["_aiBased",_aiBased,true];

		_airBased="\air_based";
		missionNamespace setVariable ["_airBased",_airBased,true];

		_arc170Path="\arc170";
		missionNamespace setVariable ["_arc170Path",_arc170Path,true];

		_attePath="\atte";
		missionNamespace setVariable ["_attePath",_attePath,true];

		_aviation="\aviation";
		missionNamespace setVariable ["_aviation",_aviation,true];

		_b1Path="\b1";
		missionNamespace setVariable ["_b1Path",_b1Path,true];

		_b2Path="\b2";
		missionNamespace setVariable ["_b2Path",_b2Path,true];

		_barcPath="\barc";
		missionNamespace setVariable ["_barcPath",_barcPath,true];

		_boost="\boost";
		missionNamespace setVariable ["_boost",_boost,true];

		_droidekaPath="\droideka";
		missionNamespace setVariable ["_droidekaPath",_droidekaPath,true];

		_dwarfSpiderDroidPath="\dwarf_spider_droid";
		missionNamespace setVariable ["_dwarfSpiderDroidPath",_dwarfSpiderDroidPath,true];

		_factionBased="\faction_based";
		missionNamespace setVariable ["_factionBased",_factionBased,true];

		_hailfirePath="\hailfire";
		missionNamespace setVariable ["_hailfirePath",_hailfirePath,true];

		_hmpPath="\hmp";
		missionNamespace setVariable ["_hmpPath",_hmpPath,true];

		_homingSpiderDroidPath="\homing_spider_droid";
		missionNamespace setVariable ["_homingSpiderDroidPath",_homingSpiderDroidPath,true];

		_laatpath="\laat";
		missionNamespace setVariable ["_laatpath",_laatpath,true];

		_landBased="\land_based";
		missionNamespace setVariable ["_landBased",_landBased,true];

		_item="\Items";
		missionNamespace setVariable ["_item",_item,true];

		_magnaPath="\magna";
		missionNamespace setVariable ["_magnaPath",_magnaPath,true];

		_mortarPath="\mortar";
		missionNamespace setVariable ["_mortarPath",_mortarPath,true];

		_mttPath="\mtt";
		missionNamespace setVariable ["_mttPath",_mttPath,true];

		_pilotBased="\pilot_based";
		missionNamespace setVariable ["_pilotBased",_pilotBased,true];

		_playerBased="\played_based";
		missionNamespace setVariable ["_playerBased",_playerBased,true];

		_praetorianPath="\praetorian";
		missionNamespace setVariable ["_praetorianPath",_praetorianPath,true];

		_repair="\repair";
		missionNamespace setVariable ["_repair",_repair,true];

		_root="scripts\zeus3denScripts";
		missionNamespace setVariable ["_root",_root,true];

		_sabrePath="\sabre";
		missionNamespace setVariable ["_sabrePath",_sabrePath,true];

		_seaBased="\sea_based";
		missionNamespace setVariable ["_seaBased",_seaBased,true];

		_smoke="\smoke";
		missionNamespace setVariable ["_smoke",_smoke,true];

		_specOpDroidPath="\spec_ops";
		missionNamespace setVariable ["_specOpDroidPath",_specOpDroidPath,true];

		_speedBoat="\speed_boats"; 		
		missionNamespace setVariable ["_speedBoat",_speedBoat,true];

		_tridroidPath="\tridroid";
		missionNamespace setVariable ["_tridroidPath",_tridroidPath,true];

		_vehicleBased="\vehicle_based";
		missionNamespace setVariable ["_vehicleBased",_vehicleBased,true];

		_vehicleVariant="\vehicle_variants";
		missionNamespace setVariable ["_vehicleVariant",_vehicleVariant,true];

		_vulturePath="\vulture";
		missionNamespace setVariable ["_vulturePath",_vulturePath,true];

		_vwingPath="\vwing";
		missionNamespace setVariable ["_vwingPath",_vwingPath,true];

		_wardenBased="\warden_based";
		missionNamespace setVariable ["_wardenBased",_wardenBased,true];

		_ywingPath="\ywing";
		missionNamespace setVariable ["_ywingPath",_ywingPath,true];

		_zeusFncPanel="\zeus_function_panel";
		missionNamespace setVariable ["_zeusFncPanel",_zeusFncPanel,true];


	//Objects
		_aat=_aatPath+"\aatMohawkClassBase.sqf"; 		
		missionNamespace setVariable ["_aat",_aat,true];

		_arc170=_arc170Path+"\arcXiphos.sqf"; 		
		missionNamespace setVariable ["_arc170",_arc170,true];

		_atteBase=_attePath+"\atteBase.sqf"; 		
		missionNamespace setVariable ["_atteBase",_atteBase,true];

		_atteType=_attePath+"\atteTypeSelector.sqf"; 		
		missionNamespace setVariable ["_atteType",_atteType,true];

		_b1AT=_b1Path+"\b1at_at.sqf"; 		
		missionNamespace setVariable ["_b1AT",_b1AT,true];

		_b1Heavy=_b1Path+"\b1heavy.sqf"; 		
		missionNamespace setVariable ["_b1Heavy",_b1Heavy,true];

		_b1Sniper=_b1Path+"\b1sniper.sqf"; 		
		missionNamespace setVariable ["_b1Sniper",_b1Sniper,true];

		_b2=_b2Path+"\b2Reconfig.sqf"; 		
		missionNamespace setVariable ["_b2",_b2,true];

		_barc=_barcPath+"\barc.sqf"; 		
		missionNamespace setVariable ["_barc",_barc,true];

		_bluforSpeedboat="\bluforSpeedBoat.sqf"; 		
		missionNamespace setVariable ["_bluforSpeedboat",_bluforSpeedboat,true];

		_droideka=_droidekaPath+"\droideka.sqf"; 		
		missionNamespace setVariable ["_droideka",_droideka,true];

		_dwarfSpiderDroid=_dwarfSpiderDroidPath+"\dwarf_spider_droid.sqf"; 		
		missionNamespace setVariable ["_dwarfSpiderDroid",_dwarfSpiderDroid,true];

		_hailfire=_hailfirePath+"\HailfireBallista.sqf"; 		
		missionNamespace setVariable ["_hailfire",_hailfire,true];

		_hmp=_hmpPath+"\hmp.sqf"; 		
		missionNamespace setVariable ["_hmp",_hmp,true];

		_laat=_laatpath+"\laatClaymore.sqf"; 		
		missionNamespace setVariable ["_laat",_laat,true];

		_magnaDroid=_magnaPath+"\magna.sqf"; 		
		missionNamespace setVariable ["_magnaDroid",_magnaDroid,true];

		_mortar=_mortarPath+"\mortars.sqf"; 		
		missionNamespace setVariable ["_mortar",_mortar,true];

		_mtt=_mttPath+"\mttdeploy.sqf"; 		
		missionNamespace setVariable ["_mtt",_mtt,true];

		_opforSpeedboat="\opforSpeedBoat.sqf"; 		
		missionNamespace setVariable ["_opforSpeedboat",_opforSpeedboat,true];

		_sabre=_sabrePath+"\Sabres.sqf"; 		
		missionNamespace setVariable ["_sabre",_sabre,true];

		_specOpDroid=_specOpDroidPath+"\spec_ops.sqf"; 		
		missionNamespace setVariable ["_specOpDroid",_specOpDroid,true];

		_triDroid=_tridroidPath+"\tri_droid.sqf"; 		
		missionNamespace setVariable ["_triDroid",_triDroid,true];

		_vWing=_vwingPath+"\vwingarrow.sqf"; 		
		missionNamespace setVariable ["_vWing",_vWing,true];

		_vulture=_vulturePath+"\vultureBase.sqf"; 		
		missionNamespace setVariable ["_vulture",_vulture,true];

		_ywing=_ywingPath+"\ywingScylla.sqf"; 		
		missionNamespace setVariable ["_ywing",_ywing,true];
 
	//Factions
		//Sides
			_blufor="\blufor"; 		
			missionNamespace setVariable ["_blufor",_blufor,true];

			_opfor="\opfor"; 		
			missionNamespace setVariable ["_opfor",_opfor,true];

			_civ="\civilian"; 		
			missionNamespace setVariable ["_civ",_civ,true];

		//Unit Factions
			_cis="\cis";
			missionNamespace setVariable ["_cis",_cis,true];

	//Scripts and functions
		_arcSmokeNorm="\arc_smoke_tip.sqf";
		missionNamespace setVariable ["_arcSmokeNorm",_arcSmokeNorm,true];

		_arcSmokePurBlu="\arc_smoke_tip_pur_blu.sqf";
		missionNamespace setVariable ["_arcSmokePurBlu",_arcSmokePurBlu,true];

		_arcSmokeRedBlu="\arc_smoke_tip_red_blu.sqf";
		missionNamespace setVariable ["_arcSmokeRedBlu",_arcSmokeRedBlu,true];

		_arcSmokeWhiteBlu="\arc_smoke_tip_white_blu.sqf";
		missionNamespace setVariable ["_arcSmokeWhiteBlu",_arcSmokeWhiteBlu,true];

		_advSlingLoad="\fn_advancedSlingLoadingInit.sqf";
		missionNamespace setVariable ["_advSlingLoad",_advSlingLoad,true];

		_atteTridentClassFnc="\atteTridentClass.sqf";
		missionNamespace setVariable ["_atteTridentClassFnc",_atteTridentClassFnc,true];

		_droidekaDriver="\droideka_driver.sqf";
		missionNamespace setVariable ["_droidekaDriver",_droidekaDriver,true];

		_dwarfDriver="\dwarf_spider_droid_driver.sqf";
		missionNamespace setVariable ["_dwarfDriver",_dwarfDriver,true];

		_flare_blufor="\flare_blufor.sqf";
		missionNamespace setVariable ["_flare_blufor",_flare_blufor,true];

		_flare_opfor="\flare_opfor.sqf";
		missionNamespace setVariable ["_flare_opfor",_flare_opfor,true];

		_laatSmoke="\laat_smoke_tip.sqf";
		missionNamespace setVariable ["_laatSmoke",_laatSmoke,true];

		_mttFnc="\_mtt.sqf";
		missionNamespace setVariable ["_mttFnc",_mttFnc,true];

		_repair65="repair_to_65.sqf";
		missionNamespace setVariable ["_repair65",_repair65,true];

		_repairMore="repair_to_more.sqf";
		missionNamespace setVariable ["_repairMore",_repairMore,true];

		_removeEject="\removeEject.sqf";
		missionNamespace setVariable ["_removeEject",_removeEject,true];

		_resupplyBox="\Resupply_boxes.sqf";
		missionNamespace setVariable ["_resupplyBox",_resupplyBox,true];

		_rngCiv="\RandomSWCIV.sqf";
		missionNamespace setVariable ["_rngCiv",_rngCiv,true];

		_wardenAmmoBox="\wardenAmmoBox.sqf";
		missionNamespace setVariable ["_wardenAmmoBox",_wardenAmmoBox,true];

		_ywingSmoke="\ywing_smoke_tip.sqf";
		missionNamespace setVariable ["_ywingSmoke",_ywingSmoke,true];

		_zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";
		missionNamespace setVariable ["_zeusVarNFncPanel",_zeusVarNFncPanel,true];

	//swop functions
		_swopBoostOn="\LAAT\initTE.sqf";
		missionNamespace setVariable ["_swopBoostOn",_swopBoostOn,true];

		_swopBoostOff="\LAAT\initTD.sqf";
		missionNamespace setVariable ["_swopBoostOff",_swopBoostOff,true];

//Quick strings for commonly used paths

	_vehicleBasedQuick=_root+_vehicleBased;
	missionNamespace setVariable ["_vehicleBasedQuick",_vehicleBasedQuick,true];

	_vehicleVariantQuick=_vehicleBasedQuick+_vehicleVariant;
	missionNamespace setVariable ["_vehicleVariantQuick",_vehicleVariantQuick,true];

	_actionBasedQuick=_vehicleBasedQuick+_actionBased;
	missionNamespace setVariable ["_actionBasedQuick",_actionBasedQuick,true];

	_airBasedQuick=_vehicleVariantQuick+_airBased;
	missionNamespace setVariable ["_airBasedQuick",_airBasedQuick,true];

	_landBasedQuick=_vehicleVariantQuick+_landBased;
	missionNamespace setVariable ["_landBasedQuick",_landBasedQuick,true];

	_mortarPathQuick=_landBasedQuick+_mortarPath;
	missionNamespace setVariable ["_mortarPathQuick",_mortarPathQuick,true];

	_aiBasedQuick=_root+_aiBased;
	missionNamespace setVariable ["_aiBasedQuick",_aiBasedQuick,true];

	_factionBasedQuick=_aiBasedQuick+_factionBased;
	missionNamespace setVariable ["_factionBasedQuick",_factionBasedQuick,true];

	_cisQuick=_factionBasedQuick+_opfor+_cis;
	missionNamespace setVariable ["_cisQuick",_cisQuick,true];


//Check sum used to check if all the exec have ran
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
};
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

	missionNamespace setVariable ["checkSum",_checkSumVariable,true];
	missionNamespace setVariable ["checkSumCounter",_checkSumCounter,true];