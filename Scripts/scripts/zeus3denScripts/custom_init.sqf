//last update 5/21/2018 5;38 pm est by Namenai
root="scripts\zeus3denScripts";
publicVariable "root";

//Calls the file that has all the factorizations, basicly a really big enum file.
[] execVM (root+"\file_paths.sqf");

//waits until all the file paths are declared.
waitUntil { !(isNil  "filePathsDone") };

//Check sum used to check if all the exec have ran.
checkSumVariable=0;
checkSumCounter=1;

publicVariable "checkSum";
publicVariable "checkSumCounter";

//Obtains what kind of mission file the file is.
packageType=missionNamespace getVariable ["missionType","normal"];

//Selects the right script package based on mission type.
switch (packageType) do {
    case "multipleOccupationSimulator": { 
		[] execVM (root+scriptPackagePath+"\mosPackage.sqf"); 
	};

    case "test": { 
	    [] execVM (root+scriptPackagePath+"\defaultPackage.sqf");
	    [] execVM (root+scriptPackagePath+"\testPackage.sqf"); 
	};

    default {  
	    [] execVM (root+scriptPackagePath+"\defaultPackage.sqf"); 
	};
};
