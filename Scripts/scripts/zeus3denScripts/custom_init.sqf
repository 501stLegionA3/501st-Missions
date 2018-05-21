//last update 5/20/2018 11;57 pm est by Namenai
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

_scriptPackage=missionNamespace getVariable ["missionType","normal"];


switch (_scriptPackage) do {
    case "multipleOccupationSimulator": { 
		[] execVM (root+"\mosPackage.sqf"); 
	};

    case "test": { 
	    [] execVM (root+"\defaultPackage.sqf");
	    [] execVM (root+"\testPackage.sqf"); 
	};

    default {  
	    [] execVM (root+"\defaultPackage.sqf"); 
	};
};
