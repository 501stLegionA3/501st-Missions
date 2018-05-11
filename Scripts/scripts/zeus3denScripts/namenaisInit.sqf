//last update 20/4/2018 4:40 pm est by Rexi

//Factorizations

	//Locations
		aatPath="\aat";
		publicVariable "aatPath";

		actionBased="\action_menu";
		publicVariable "actionBased";

		aiBased="\ai_based";
		publicVariable "aiBased";

		airBased="\air_based";
		publicVariable "airBased";

		arc170Path="\arc170";
		publicVariable "arc170Path";

		attePath="\atte";
		publicVariable "attePath";

		aviation="\aviation";
		publicVariable "aviation";

		b1Path="\b1";
		publicVariable "b1Path";

		b2Path="\b2";
		publicVariable "b2Path";

		barcPath="\barc";
		publicVariable "barcPath";

		boost="\boost";
		publicVariable "boost";

		boxes="\boxes";
		publicVariable "boxes";

		droidekaPath="\droideka";
		publicVariable "droidekaPath";

		dwarfSpiderDroidPath="\dwarf_spider_droid";
		publicVariable "dwarfSpiderDroidPath";

		factionBased="\faction_based";
		publicVariable "factionBased";

		hailfirePath="\hailfire";
		publicVariable "hailfirePath";

		hmpPath="\hmp";
		publicVariable "hmpPath";

		homingSpiderDroidPath="\homing_spider_droid";
		publicVariable "homingSpiderDroidPath";

		laatpath="\laat";
		publicVariable "laatpath";

		landBased="\land_based";
		publicVariable "landBased";

		item="\Items";
		publicVariable "item";

		magnaPath="\magna";
		publicVariable "magnaPath";

		mortarPath="\mortar";
		publicVariable "mortarPath";

		mttPath="\mtt";
		publicVariable "mttPath";

		pilotBased="\pilot_based";
		publicVariable "pilotBased";

		playerBased="\played_based";
		publicVariable "playerBased";

		praetorianPath="\praetorian";
		publicVariable "praetorianPath";

		repair="\repair";
		publicVariable "repair";

		resupplyData="\ResupplyData";
		publicVariable "resupplyData";

		root="scripts\zeus3denScripts";
		publicVariable "root";

		sabrePath="\sabre";
		publicVariable "sabrePath";

		seaBased="\sea_based";
		publicVariable "seaBased";

		smoke="\smoke";
		publicVariable "smoke";

		specOpDroidPath="\spec_ops";
		publicVariable "specOpDroidPath";

		speedBoat="\speed_boats"; 		
		publicVariable "speedBoat";

		tridroidPath="\tridroid";
		publicVariable "tridroidPath";

		vehicleBased="\vehicle_based";
		publicVariable "vehicleBased";

		vehicleVariant="\vehicle_variants";
		publicVariable "vehicleVariant";

		vulturePath="\vulture";
		publicVariable "vulturePath";

		vwingPath="\vwing";
		publicVariable "vwingPath";

		wardenBased="\warden_based";
		publicVariable "wardenBased";

		ywingPath="\ywing";
		publicVariable "ywingPath";

		zeusFncPanel="\zeus_function_panel";
		publicVariable "zeusFncPanel";


	//Objects
		aat=aatPath+"\aatMohawkClassBase.sqf"; 		
		publicVariable "aat";

		arc170=arc170Path+"\arcXiphos.sqf"; 		
		publicVariable "arc170";

		atteBase=attePath+"\atteBase.sqf"; 		
		publicVariable "atteBase";

		atteType=attePath+"\atteTypeSelector.sqf"; 		
		publicVariable "atteType";

		b1AA="\b1at_aa.sqf";
		publicVariable "b1at";

		b1AT=b1Path+"\b1at_at.sqf"; 		
		publicVariable "b1AT";

		b1Forest="\b1_forest.sqf";
		publicVariable "b1Forest";

		b1Snow="\b1_snow.sqf";
		publicVariable "b1Snow";

		b1Heavy=b1Path+"\b1_heavy.sqf"; 		
		publicVariable "b1Heavy";

		b1Sniper=b1Path+"\b1_sniper.sqf"; 		
		publicVariable "b1Sniper";

		b2=b2Path+"\b2Reconfig.sqf"; 		
		publicVariable "b2";

		barc=barcPath+"\barc.sqf"; 		
		publicVariable "barc";

		bluforSpeedboat="\bluforSpeedBoat.sqf"; 		
		publicVariable "bluforSpeedboat";

		droideka=droidekaPath+"\droideka.sqf"; 		
		publicVariable "droideka";

		droidekaDriver="\droideka_driver.sqf";
		publicVariable "droidekaDriver";

		dwarfSpiderDroid=dwarfSpiderDroidPath+"\dwarf_spider_droid.sqf"; 		
		publicVariable "dwarfSpiderDroid";

		dwarfDriver="\dwarf_spider_droid_driver.sqf";
		publicVariable "dwarfDriver";

		hailfire=hailfirePath+"\HailfireBallista.sqf"; 		
		publicVariable "hailfire";

		homingspiderdroid="\spiderdroid_buff.sqf";
		publicVariable "homingspiderdroid";

		hmp=hmpPath+"\hmp.sqf"; 		
		publicVariable "hmp";

		laat=laatpath+"\laatClaymore.sqf"; 		
		publicVariable "laat";

		magnaDroid=magnaPath+"\magna.sqf"; 		
		publicVariable "magnaDroid";

		mortar=mortarPath+"\mortars.sqf"; 		
		publicVariable "mortar";

		mtt=mttPath+"\mttdeploy.sqf"; 		
		publicVariable "mtt";

		opforSpeedboat="\opforSpeedBoat.sqf"; 		
		publicVariable "opforSpeedboat";

		praetorian="\Praetorian.sqf";
		publicVariable "praetorian";

		sabre=sabrePath+"\Sabres.sqf"; 		
		publicVariable "sabre";

		specOpDroid=specOpDroidPath+"\spec_ops.sqf"; 		
		publicVariable "specOpDroid";

		triDroid=tridroidPath+"\tri_droid.sqf"; 		
		publicVariable "triDroid";

		vWing=vwingPath+"\vwingarrow.sqf"; 		
		publicVariable "vWing";

		vulture=vulturePath+"\vultureBase.sqf"; 		
		publicVariable "vulture";

		ywing=ywingPath+"\ywingScylla.sqf"; 		
		publicVariable "ywing";
 
	//Factions
		//Sides
			bluforFac="\blufor"; 		
			publicVariable "blufor";

			opforFac="\opfor"; 		
			publicVariable "opfor";

			civFac="\civilian"; 		
			publicVariable "civ";

		//Unit Factions
			cis="\cis";
			publicVariable "cis";

	//Scripts and functions
		aatCoax="\aat_coxial_r.sqf";
		publicVariable "aatCoax";

		aatRetext="\aat_retext_b.sqf";
		publicVariable "aatRetext";

		arcSmokeNorm="\arc_smoke_tip.sqf";
		publicVariable "arcSmokeNorm";

		arcSmokePurBlu="\arc_smoketip_pur_blu.sqf";
		publicVariable "arcSmokePurBlu";

		arcSmokeRedBlu="\arc_smoke_tip_red_blu.sqf";
		publicVariable "arcSmokeRedBlu";

		arcSmokeWhiteBlu="\arc_smoke_tip_white_blu.sqf";
		publicVariable "arcSmokeWhiteBlu";

		addMapGPS="\Map_GPS_A.sqf";
		publicVariable "addMapGPS";

		addNVG="\NVG_A.sqf";
		publicVariable "addNVG";

		addThermal="\Thermal_A.sqf";
		publicVariable "addThermal";

		advSlingLoad="\fn_advancedSlingLoadingInit.sqf";
		publicVariable "advSlingLoad";

		atteTridentClassFnc="\atteTridentClass.sqf";
		publicVariable "atteTridentClassFnc";

		flareblufor="\flare_blufor.sqf";
		publicVariable "flareblufor";

		flareopfor="\flare_opfor.sqf";
		publicVariable "flareopfor";

		laatSmoke="\laat_smoke_tip.sqf";
		publicVariable "laatSmoke";

		largeAmmo="Large_ammo.sqf";
		publicVariable "largeAmmo";

		largeMedical="Large_medical.sqf";
		publicVariable "largeMedical";

		mttFnc="\mtt.sqf";
		publicVariable "mttFnc";

		repair65="repair_to_65.sqf";
		publicVariable "repair65";

		repairMore="repair_to_more.sqf";
		publicVariable "repairMore";

		removeEject="\removeEject.sqf";
		publicVariable "removeEject";

		removeMapGPS="\Map_GPS_R.sqf";
		publicVariable "removeMapGPS";

		removeNVG="\NVG_R.sqf";
		publicVariable "removeNVG";

		removeThermal="\Thermal_R.sqf";
		publicVariable "removeThermal";

		resupplyArc170="\ARC_re.sqf";
		publicVariable "resupplyArc170";

		resupplyBox="\Resupply_boxes.sqf";
		publicVariable "resupplyBox";

		resupplyLaat="\LAAT_re.sqf";
		publicVariable "resupplyLaat";

		resupplyVwing="\Vwing_re.sqf";
		publicVariable "resupplyVwing";

		resupplyYwing="\Ywing_re.sqf";
		publicVariable "resupplyYwing";

		rngCiv="\RandomSWCIV.sqf";
		publicVariable "rngCiv";

		smallAmmo="Small_ammo.sqf";
		publicVariable "smallAmmo";

		smallMedical="Small_medical.sqf";
		publicVariable "smallMedical";

		wardenAmmoBox="\wardenAmmoBox.sqf";
		publicVariable "wardenAmmoBox";

		ywingSmoke="\ywing_smoke_tip.sqf";
		publicVariable "ywingSmoke";

		zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";
		publicVariable "zeusVarNFncPanel";

	//swop functions
		swopBoostOn="\LAAT\initTE.sqf";
		publicVariable "swopBoostOn";

		swopBoostOff="\LAAT\initTD.sqf";
		publicVariable "swopBoostOff";

//Quick strings for commonly used paths

	vehicleBasedQuick=root+vehicleBased;
	publicVariable "vehicleBasedQuick";

	vehicleVariantQuick=vehicleBasedQuick+vehicleVariant;
	publicVariable "vehicleVariantQuick";

	actionBasedQuick=vehicleBasedQuick+actionBased;
	publicVariable "actionBasedQuick";

	airBasedQuick=vehicleVariantQuick+airBased;
	publicVariable "airBasedQuick";

	landBasedQuick=vehicleVariantQuick+landBased;
	publicVariable "landBasedQuick";

	mortarPathQuick=landBasedQuick+mortarPath;
	publicVariable "mortarPathQuick";

	aiBasedQuick=root+aiBased;
	publicVariable "aiBasedQuick";

	factionBasedQuick=aiBasedQuick+factionBased;
	publicVariable "factionBasedQuick";

	cisQuick=factionBasedQuick+opforFac+cis;
	publicVariable "cisQuick";

	b1Quick=cisQuick+b1Path;
	publicVariable "b1Quick";

	playedBasedQuick=root+playerBased;
	publicVariable "playedBasedQuick";

	playedBasedItemsQuick=playedBasedQuick+item;
	publicVariable "playedBasedItemsQuick";

	aviationPlayedBasedQuick=playedBasedQuick+aviation;
	publicVariable "aviationPlayedBasedQuick";

	wardenBasedQuick=aviationPlayedBasedQuick+wardenBased;
	publicVariable "wardenBasedQuick";

	resupplyBoxQuick=wardenBasedQuick+resupplyData;
	publicVariable "resupplyBoxQuick";

	itemsQuick=playedBasedQuick+item;
	publicVariable "itemsQuick";

	boxesQuick=itemsQuick+boxes;
	publicVariable "boxesQuick";



//Check sum used to check if all the exec have ran
checkSumVariable=0;
checkSumCounter=1;

publicVariable "checkSum";
publicVariable "checkSumCounter";

//global variables that are used----------------------- decommissioned due to public variables being too hard-------------------- 
	//[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";
try {	
//Allow zeus to change global variables-also Hermes Panel
	[] execVM (root+zeusFncPanel+zeusVarNFncPanel);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;
}
catch {
};
//Hades Panel - Currently decommissioned
	//[] execVM "scripts\zeus3denScripts\ZeusfunctionPanel\zeusVariableAndFunctionPanelHades.sqf";

//laat weapons,adds weapons and wingtip smoke
	[] execVM (root+vehicleBased+vehicleVariant+airBased+laat);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//arc-170 weapon,adds weapons,wingtip smoke and ejection prevention
	[] execVM (root+vehicleBased+vehicleVariant+airBased+arc170);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;	

//y-wing weapons,adds weapons and wingtip smoke
	[] execVM (root+vehicleBased+vehicleVariant+airBased+ywing);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;	

//b2 reconfig,forces b2's to walk
	[] execVM (root+aiBased+factionBased+opforFac+cis+b2);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Blufor Speedboat,adds republic eweb for rear and u-wing gunner gun for main cannon
	[] execVM (root+vehicleBased+vehicleVariant+seaBased+speedBoat+bluforFac+bluforSpeedboat);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Opfor Speedboat,adds imperial eweb for rear and u-wing gunner gun for main cannon
	[] execVM (root+vehicleBased+vehicleVariant+seaBased+speedBoat+opforFac+opforSpeedboat);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;	

//AT-TE Base scripts,the armor and repair
	[] execVM (root+vehicleBased+vehicleVariant+landBased+atteBase);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//AT-TE Type Selector that spawns in the at-te class type
	[] execVM (root+vehicleBased+vehicleVariant+landBased+atteType);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//AAT weapons
	[] execVM (root+vehicleBased+vehicleVariant+landBased+aat);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Vulture droid weapons
	[] execVM (root+vehicleBased+vehicleVariant+airBased+vulture);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Add's flares to simulate plasma Mortars NATO and CSAT
	[] execVM (root+vehicleBased+vehicleVariant+landBased+mortar);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Sabre adds weapons and smokes and damage reports
	[] execVM (root+vehicleBased+vehicleVariant+landBased+sabre);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//barc allows barcs to be loaded into vehicles with a cargo space 4 or greater
	[] execVM (root+vehicleBased+vehicleVariant+landBased+barc);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Eulers Spec Ops droids,vr soilder
	[] execVM (root+aiBased+factionBased+opforFac+cis+specOpDroid);	
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//adds deploy option to mtt
	[] execVM (root+vehicleBased+vehicleVariant+landBased+mtt);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//adds  Make B1 ats have better launchers
	[] execVM (root+aiBased+factionBased+opforFac+cis+b1AT);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//adds  Make B1 Heavy have better weapons
	[] execVM (root+aiBased+factionBased+opforFac+cis+b1Heavy);	
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//adds  Make  Magma Droids Stronger
	[] execVM  (root+aiBased+factionBased+opforFac+cis+magnaDroid);	
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//adds advanced sling loading
	[] execVM (root+vehicleBased+vehicleVariant+airBased+advSlingLoad);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Star Wars Civilian Spawner
	[] execVM (root+aiBased+factionBased+civFac+rngCiv);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Resupply Boxes
	[] execVM (root+playerBased+item+resupplyBox);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Warden ammo and fuel system	
	[] execVM (root+playerBased+aviation+wardenBased+wardenAmmoBox);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Tri Droid
	[] execVM (root+vehicleBased+vehicleVariant+airBased+triDroid);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//V-Wing
	[] execVM(root+vehicleBased+vehicleVariant+airBased+vWing);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;	

//Hailfire Droid
	[] execVM (root+vehicleBased+vehicleVariant+landBased+hailfire);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Sniper Droid	
	[] execVM (root+aiBased+factionBased+opforFac+cis+b1Sniper);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Droideka spawny script
	[] execVM (root+aiBased+factionBased+opforFac+cis+droideka);	
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//Dwarf Spider Droid spawny script
	[] execVM (root+aiBased+factionBased+opforFac+cis+dwarfSpiderDroid);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;

//HMP Gunship
	[] execVM (root+vehicleBased+vehicleVariant+airBased+hmp);
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;	

	publicVariable "checkSum";
	publicVariable "checkSumCounter";