//last update 5/16/2018 2;28 am est by Namenai
root="scripts\zeus3denScripts";
publicVariable "root";

//Calls the file that has all the factorizations, basicly a really big enum file.
[] execVM (root+"\file_paths.sqf");

//Check sum used to check if all the exec have ran
checkSumVariable=0;
checkSumCounter=1;

publicVariable "checkSum";
publicVariable "checkSumCounter";

//waits until all the file paths are declared
waitUntil { !(isNil  "filePathsDone") };

//global variables that are used----------------------- decommissioned due to public variables being too hard (REVIVED WILL WORK ON SOON)-------------------- 
//[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";

//This IF Statement is here to ensure that certain scripts wont be ran on a specific mission type. Zora's M
if(!(missionNamespace getVariable ["multipleOccupationSimulator",false])) then {
	/*The following below make changes to vr entity,and soilder for NATO and then vr soilder for csat*/

	//Allow zeus to change global variables-also Hermes Panel
	[] execVM (root+zeusFncPanel+zeusVarNFncPanel);
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

	//Eulers Spec Ops droids,vr soilder
	[] execVM (root+aiBased+factionBased+opforFac+cis+specOpDroid);	
	checkSumVariable=checkSumVariable+checkSumCounter;
	checkSumCounter=checkSumCounter+1;
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