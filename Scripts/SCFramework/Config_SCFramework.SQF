/*
	Config_SCFramework.SQF
	
	Configuration options for BDC's Server-Client Framework
	
	Written for CO18 Resistance Plus by ^bdc	May 2017
	Re-written for dedicated server missions and Zeus compatibility		Jan 2018
*/

// Configurable global variables
BDC_SCFramework_LoggingFreq = 300; // Timer, in seconds, that a log file on local AI ownership (cached including) as well as FPS is added (0 to disable) (default: 300)
BDC_SCFramework_LoggingDelay = 60; // Delay, in seconds, prior to starting logging loop (default: 60)
BDC_SCFramework_GroupManagerEnable = true; // Enable/disable automaticm, periodic empty group deletion function (default: true, unless another function is already setup in mission to do this)
BDC_SCFramework_ClientRetainVehOwnership = true; // If true, when player exits a vehicle, as the last person in it, will retain vehicle ownership (via EH called from client to server)
BDC_SCFramework_DetailedLogging = false; // If enabled, logging will occur from every eventhandler and function called (Used primarily for testing and initial setup) (default: false)
BDC_SCFramework_ServerFPSReport_KeyCodes = [0x3B,"F1"]; // Array of two values: [(raw dikCode),"Press x Key for Server FPS Report"] - Example: [0x3B,"F1"]
BDC_SCFramework_ServerFPSReport_AdminUIDList = [ // List of player UID's for admins in string form (used only for the Server FPS Report)
	"76561198033061067","76561197980091303","76561198063946636","76561198006790310","76561198065200898","76561198128186617","76561197998298758","76561198068431012","76561198002887102","76561198011054575"
	];
BDC_SCFramework_ServerFPSReport_ModulesNames = [ // Short Names/Acronyms (in string format) of AI modules the server and each successive headless client control, starting from 1 (used purely for display purposes in the ServerFPSReport and relates to specificAITable only)
	// Order goes: Server,HC1,HC2,HC3,HC4,HC5 -- If using no SpecificAITable, then set all 6 to be blank to prevent a display error, ex: "","","","","",""
	// "HQ AI","Marker Vehicles","","","",""   // example, if using only two headless clients and moving specific AI to each one
	"","","","",""
	];
BDC_SCFramework_HCOffloading_Enable = true; // Master enable/disable flag for having the server automatically offload AI groups (either automatically or specifically) to headless client(s)
BDC_SCFramework_HCOffloading_StartDelay = 120; // Start delay in seconds before starting (to allow all HC's to connect and collect ID's) (default: 60)
BDC_SCFramework_HCOffloading_Frequency = 30; // Timer, in seconds, that server checks allGroups for possible offloading (default: 5)
BDC_SCFramework_HCOffloading_GroupTimerMinimum = 180; // Timer in seconds that a group must exist prior to any offloading occurring (default: 5 - to allow for unit "painting", loadouts, and skill-set scripts to finish) 
BDC_SCFramework_HCOffloading_SpecificAITable_Enable = true; // Enable/disable pre-configured AI groups to move to specific headless clients per AITable below
BDC_SCFramework_HCOffloading_SpecificAITable = [ // List of Specific AI groups (flagged by specific variables) that offload to specific headless clients (by number; not by name) - (group MUST be spawned in by Fnc_SCFramework_CreateGroup)
	// ["ModuleName (txt field for RPT log reference)","Specific boolean variable name attached to Group during creation",HeadlessClientID assigned by SCFramework (1-5)]
	//["AI Module","AIModule_SpawnedGroup",2] - Examples listed below
	//["HQ AI","HQAI",1], // Theoretical AI at HQ, created by Fnc_SCFramework_CreateGroup, with variable "HQAI" attached to flag all related groups, transferred to HC #1
	];
BDC_SCFramework_HCOffloading_AutomaticOffloading_Enable = true; // Enable/disable automatic offloading, irrespective of specific configured groups, to be offloaded to headless clients - Note: Automatic offloading occurs AFTER specific offloading has run
BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable = true; // Enable/disable the automatic, timed transfer of Zeus-spawned in AI groups (player-side, locally owned AI that are NOT part of the player group) ownership to server and putting them into the HC offloading pool (default: true)
BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Frequency = 180; // Number of seconds client-side monitor checks for locally-owned AI (presumably spawned by Zeus Op) (default: 60 to 300 to allow time for waypoints and the like to be made)
BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_FlagOffloadedGroups = true; // If enabled, any initially-local, Zeus-owned groups (presumably spawned by Zeus Op) can only be automatically transferred to server once; if forcibly moved back to a Zeus op, they will be flagged unable to be automatically offloaded again, therefore will have to be moved manually to the server via addon
BDC_SCFramework_HCOffloading_AutomaticOffloading_MaxAIPerHeadlessClient = 100; // Target number of maximum AI we want on each headless client (when this number is met or slightly exceeded, routine seeks to offloading AI to next HC in the list) (there is no default for this; this must be tested for performance on each setup although I recommend 100 to start)

diag_log format["Config_SCFramework.SQF: Eventhandlers, functions, and global vars loaded."];