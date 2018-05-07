//last update 20/4/2018 4:40 pm est by Rexi

//Factorizations

	//Locations
		_aiBased="\aiBased";
		_airBased="\airBased";
		_aviation="\aviation";
		_factionBased="\factionBased";
		_landBased="\landBased";
		_item="\Items";
		_playerBased="\playerBased";
		_root="scripts\zeus3denScripts";
		_seaBased="\seaBased";
		_speedBoat="\speedBoats";
		_vehicleBased="\vehicleBased";
		_vehicleVariant="\vehicleVariants";
		_wardenBased="\wardenBased";
		_zeusFncPanel="\ZeusfunctionPanel";

	//Objects
		_aat="\AAT\aatMohawkClassBase.sqf";
		_arc170="\ARC\arcXiphos.sqf";
		_atteBase="\ATTE\atteBase.sqf";
		_atteType="\ATTE\atteTypeSelector.sqf";
		_b1AT="\b1\b1at_at.sqf";
		_b1Heavy="\b1\b1heavy.sqf";
		_b1Sniper="\b1\b1sniper.sqf";
		_b2="\b2\b2Reconfig.sqf";
		_barc="barc\barc.sqf";
		_bluforSpeedboat="\bluforSpeedBoat.sqf";
		_droideka="\Droideka\Droideka.sqf";
		_dwarfSpiderDroid="\DSD\DSD.sqf";
		_hailfire="\Hailfire\HailfireBallista.sqf";
		_hmp="\HMP\hmp.sqf";
		_laat="\LAAT\laatClaymore.sqf";
		_magnaDroid="\Magma\Magma.sqf";
		_mortar="\Mortar\mortars.sqf";
		_mtt="\MTT\mttdeploy.sqf";
		_opforSpeedboat="\opforSpeedBoat.sqf";
		_sabre="\sabres\Sabres.sqf";
		_specOpDroid="\spec_ops\spec_ops.sqf";
		_triDroid="\TRIDROID\tri_droid.sqf";
		_vWing="\VWing\vwingarrow.sqf";
		_vulture="\VULTURE\vultureBase.sqf";
		_ywing="\YWING\ywingScylla.sqf";

	//Factions
		//Sides
			_blufor="\blufor";
			_opfor="\opfor";
			_civ="\Civilian";

		//Unit Factions
			_cis="\cis";

	//Scripts and functions
		_advSlingLoad="\fn_advancedSlingLoadingInit.sqf";
		_resupplyBox="\Resupply_boxes.sqf";
		_rngCiv="\RandomSWCIV.sqf";
		_wardenAmmoBox="\wardenAmmoBox.sqf";
		_zeusVarNFncPanel="\zeusVariableAndFunctionPanel.sqf";


_checkSumVariable=0;
_checkSumCounter=1;

//global variables that are used----------------------- decommissioned due to public variables being too hard-------------------- 
	//[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";
	
//Allow zeus to change global variables-also Hermes Panel
	[] execVM (_root+_zeusFncPanel+_zeusVarNFncPanel);
	_checkSumVariable=_checkSumVariable+_checkSumCounter;
	_checkSumCounter=_checkSumCounter+1;
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