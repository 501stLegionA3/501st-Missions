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
_scriptPackage=missionNamespace getVariable ["missionType","normal"];

//Selects the right script package based on mission type.
switch (_scriptPackage) do {
    case "multipleOccupationSimulator": { 
		[] execVM (root+scriptPackage+"\mosPackage.sqf"); 
	};

    case "test": { 
	    [] execVM (root+scriptPackage+"\defaultPackage.sqf");
	    [] execVM (root+scriptPackage+"\testPackage.sqf"); 
	};

    default {  
	    [] execVM (root+scriptPackage+"\defaultPackage.sqf"); 
	};
};
