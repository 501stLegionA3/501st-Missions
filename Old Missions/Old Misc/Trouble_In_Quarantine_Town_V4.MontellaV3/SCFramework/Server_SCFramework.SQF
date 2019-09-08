/*
	Server_SCFramework.SQF
	
	Script file that contains all global variables, functions, and eventhandlers related to use of BDC's Server-Client Framework
	on the server only
	
	Written by ^bdc		April 2017
	Modified for automatic headless client offloading	Jan 2018
*/

// Reset global variables
BDC_SCFramework_HeadlessClientIDs = [];
BDC_SCFramework_HeadlessClientUIDs = [];
BDC_SCFramework_PlayerClientIDs = [];
BDC_SCFramework_HasDisconnectedHC = false; // This global var flags true in the event a headless client disconnects prematurely and prompts the server to re-send all HC's new headless client numbers 

// Eventhandlers/Functions
	// This eventhandler, tied with SCFramework_PingHeadlessClient, can be used as a two-way acknowledgement
	// of the ready status of a particular headless client prior to the offloading of any AI units (setOwner/setGroupOwner)
"SCFramework_HCPingResponseServer" addPublicVariableEventHandler {
	_Array = _this select 1;
	_Num = _Array select 0;
	_Owner = _Array select 1;
	SCFramework_PingHCResponse = [_Num,_Owner]; // This array can be referenced on a server-side spawning script to ensure headless client is connected and ready
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) Response received from headless client %1. Number returned: %2. Global variable array set.",_Owner,_Num];
	};
};

	// Player client requests its client ID (uses player UID as cross-reference; table is defined and updated in onPlayerConnected)
"SCFramework_PlayerPingResponseServer" addPublicVariableEventHandler {
	_UID = _this select 1;
	{
		_Array = _x;
		_ClientID = _Array select 0;
		_SCUID = _Array select 1;
		if (_SCUID == _UID) then {
			SCFramework_PlayerSendClientID = [_UID,_ClientID];
			_ClientID publicVariableClient "SCFramework_PlayerSendClientID"; // Player_SCFramework
			if (BDC_SCFramework_DetailedLogging) then {
				diag_log format["(SCFramework) Ping received from player (UID %1). Sending client ID %2 back.",_UID,_ClientID];
			};
		};
	} forEach BDC_SCFramework_PlayerClientIDs; // onPlayerConnected
};

	// Headless client requests its client ID once SCFramework has completed loading on its end
"SCFramework_HCPingRequestClientID" addPublicVariableEventHandler {
	_UID = _this select 1;
	_Num = 0;
	_HCNumber = 1;
	{
		if (_x == _UID) then {
			if (BDC_SCFramework_DetailedLogging) then {
				diag_log format["(SCFramework) Client ID requested from headless client with UID %1.",_UID];
			};
			_ClientID = BDC_SCFramework_HeadlessClientIDs select _Num; // Select from adjacent array
			[_ClientID,_HCNumber] spawn Fnc_SCFramework_PingHCClientID;
		};
		_Num = _Num + 1;
		_HCNumber = _HCNumber + 1;
	} forEach BDC_SCFramework_HeadlessClientUIDs;
};

	// Request for ownership transfer to specific headless client from server (if a particular routine on an HC requests it specifically)
"SCFramework_RequestForGroupOwnership" addPublicVariableEventHandler {
	_Array = _this select 1;
	_Group = _Array select 0;
	_Owner = _Array select 1;
	_FoundHCNum = false;
	_Counter = 1;
	_HCNum = -1;
	{
		if (_x == _Owner && !_FoundHCNum) then {
			_FoundHCNum = true;
			_HCNum = _Counter;
		};
		_Counter = _Counter + 1;
	} forEach BDC_SCFramework_HeadlessClientIDs; // onPlayerConnected
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) Request from headless client #%1 (Client ID %2) for transference of ownership of group %3",_HCNum,_Owner,_Group];
	};
	_Return = _Group setGroupOwner _Owner;
	_Return
};

	// This event handler is sent from a player client automatically when a client exits the vehicle from the driver/pilot seat 
	// so ownership of the vehicle is retained by that player instead of being automatically xferred back to the server
	// Also works with grabbing ownership of a vehicle while sling loading - called from Player_SCFramework from GetOutMan EH
"SCFramework_RequestRetainVehOwnership" addPublicVariableEventHandler {
	_Array = _this select 1;
	_ClientID = _Array select 0;
	_Vehicle = _Array select 1;
	_Driver = driver _Vehicle;
		// Only allow if vehicle is still alive and no driver is in it
	if (BDC_SCFramework_ClientRetainVehOwnership && (_Vehicle isKindOf "LandVehicle" || _Vehicle isKindOf "Ship" || _Vehicle isKindOf "Air")) then {
		if (BDC_SCFramework_DetailedLogging) then {
			diag_log format["(SCFramework) Client ID %1 requesting to retain ownership of vehicle %2 %3",_ClientID,_Vehicle,(typeOf _Vehicle)];
		};
		if (alive _Vehicle && (isNull _Driver)) then {
			if (BDC_SCFramework_DetailedLogging) then {
				diag_log format["(SCFramework) Setting ownership of vehicle %1 %2 to Client ID %3.",_Vehicle,(typeOf _Vehicle),_ClientID];
			};
			_Vehicle setOwner _ClientID;
		};
	};
};

	// Ping for request of FPS information from player client to server and HCs
"SCFramework_ServerFPSRequest" addPublicVariableEventHandler {
	_ClientID = _this select 1;
	private["_OwnedAI","_CachedAI","_Name","_FPS","_ReturnArray","_OwnedVeh","_CachedVeh"];
		// Gather owned AI (cached and not, alive only, no players)
	_OwnedAI = 0;
	_CachedAI = 0;
	{
			// Check for AI 
		if (local _x && alive _x && !isPlayer _x) then {
			_OwnedAI = _OwnedAI + 1;
			_isAIVCached = false;
			_isAIVCached = _x getVariable ["isAIVCached",false]; // Fnc_AIVManager
			if (_isAIVCached || !(simulationEnabled _x)) then {
				_CachedAI = _CachedAI + 1;
			};
		};
	} forEach allUnits;
	_OwnedVeh = 0;
	_CachedVeh = 0;
	{
		if (alive _x && !isPlayer _x) then {
			if (_x isKindOf "LandVehicle" || _x isKindOf "Ship" || _x isKindOf "Air") then {
				_OwnedVeh = _OwnedVeh + 1;
				_isAIVCached = false;
				_isAIVCached = _x getVariable ["isAIVCached",false]; // Fnc_AIVManager
				if (_isAIVCached || !(simulationEnabled _x)) then {
					_CachedVeh = _CachedVeh + 1;
				};
			};
		};
	} forEach vehicles;
		// Get server FPS and FPSmin
	_FPS = round(diag_fps);
	_ReturnArray = ["Server",_FPS,_OwnedAI,_CachedAI,_OwnedVeh,_CachedVeh];
	SCFramework_ServerFPSResponse = _ReturnArray;
	_ClientID publicVariableClient "SCFramework_ServerFPSResponse";
};
	// Reset group ownership back to server
"SCFramework_ResetGroupOwnership" addPublicVariableEventHandler {
	_Group = _this select 1;
	_Group setGroupOwner 2;
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) SCFramework_ResetGroupOwnership EH called. Resetting ownership of group %1 to server.",_Group];
	};
};

	// Function written to gather the owner/clientID of a specific headless client based on login order (1, 2, 3, etc)
	// Used by server-side mods that are configured to offload AI to a specific headless client by number instead of by name
	// How to call:
	// _HCClientID = [(Number of headless client logged in)] call Fnc_SCFramework_GetHCClientID;
	// _HCClientID = [(Number of hc logged in),"AI Spawner Script Name"] call Fnc_SCFramework_GetHCClientID;
Fnc_SCFramework_GetHCClientID = {
	_RequestNum = _this select 0;
	_ModuleName = "";
	if (count _this > 1) then {
		_ModuleName = _this select 1;
	};
	_ReturnID = -1; // default
	if (count BDC_SCFramework_HeadlessClientIDs > 0) then {
		_Num = _RequestNum - 1; // onPlayerConnected
		_ReturnID = BDC_SCFramework_HeadlessClientIDs select _Num;
		if (_ModuleName != "") then {
			if (BDC_SCFramework_DetailedLogging) then {
				diag_log format["(SCFramework) Request from module %1 for owner/ClientID of headless client #%2 - Returning ClientID %3",_ModuleName,_RequestNum,_ReturnID];
			};
		} else {
			if (BDC_SCFramework_DetailedLogging) then {
				diag_log format["(SCFramework) Request for owner/ClientID of headless client #%1 - Returning ClientID %2",_RequestNum,_ReturnID];
			};
		};
	} else {
		if (BDC_SCFramework_DetailedLogging) then {
			diag_log format["(SCFramework) Function called but currently no headless clients logged in to return a client ID. Returning -1."];
		};
	};
	_ReturnID
};

	// Function that will retrieve the ClientID by player UID
	// How to call from server:
	// _PlayerClientID = ["Player UID string format"] call Fnc_SCFramework_GetPlayerClientID;
Fnc_SCFramework_GetPlayerClientID = {
	_UID = _this select 0;
	_ReturnID = -1; // Default
	if (count BDC_SCFramework_PlayerClientIDs > 0) then { // onPlayerConnected
		{
			_CUID = _x select 1;
			if (_UID == _CUID) then {
				_ReturnID = _x select 0;
			};
		} forEach BDC_SCFramework_PlayerClientIDs;
	} else {
		_ReturnID = -1;
	};
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) Owner of player UID %1 requested. ClientID returned: %1",_ReturnID];
	};
	_ReturnID
};

	// Set group ownership function (called from server to move a group to a specific clientID/owner)
	// How to call from a server-side script:
	// [(Group object),(Destination Client ID),"AI Spawning Script Name"] call Fnc_SCFramework_SetGroupOwner;
Fnc_SCFramework_SetGroupOwner = {
	_Group = _this select 0;
	_ClientID = _this select 1;
	_ModuleName = _this select 2; // Module/Script name for logging purposes; ex. "ExileZ","DMS", etc - May also leave blank in quotes if not using SpecificAITable offloading
	if (_ModuleName == "") then {
		if (BDC_SCFramework_DetailedLogging) then {
			diag_log format["(SCFramework) Request from server to send group %1 to Client ID %2.",_Group,_ClientID];
		};
	} else {
		if (BDC_SCFramework_DetailedLogging) then {
			diag_log format["(SCFramework) Request from server module %1 to send group %2 to Client ID %3.",_ModuleName,_Group,_ClientID];
		};
	};
		// Move the group and all AI units
	_Return = _Group setGroupOwner _ClientID;
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) Group %1 Module %2 Destination ClientID %3 SetGroupOwner Request response: %4",_Group,_ModuleName,_ClientID,_Return];
	};
	_Return
};

	// Sub-function called by _HCOffloading in gathering number of AI owned by each headless client - Returns array
Fnc_SCFramework_BuildHCAIArray = {
	// Build our list of AI's owned by each headless client
	_HCAIArray = []; // Nested arrays: [[(HCOwnernNumber),(NumberOfAIOwned)]
	{
		_OwnedAI = 0; // default
		_HCOwner = _x;
		_BuildArray = [];
		{
			if (owner _x == _HCOwner) then {
				_OwnedAI = _OwnedAI + 1;
			};
		} forEach allUnits;
		_BuildArray = [_HCOwner,_OwnedAI];
		_HCAIArray pushBackUnique _BuildArray;
	} forEach BDC_SCFramework_HeadlessClientIDs;
	_HCAIArray
};

	// Automatic Headless Client offloading sub-function
Fnc_SCFramework_HCOffloading = {
		// Start delay
	if (BDC_SCFramework_HCOffloading_StartDelay > 0) then {
		if (BDC_SCFramework_DetailedLogging) then {
			diag_log format["(SCFramework) Start delay configured for Headless Client offloading of %1 seconds...",BDC_SCFramework_HCOffloading_StartDelay];
		};
		sleep BDC_SCFramework_HCOffloading_StartDelay;
	};
		// Grab HC client ID's
	_HeadlessClientIDs = [];
	if (count BDC_SCFramework_HeadlessClientIDs == 0) exitWith {
		diag_log format["(SCFramework) No headless clients connected to the server. HC Offloading suspended."];
	};
		// Start function
	diag_log format["(SCFramework) Starting specific headless client offloading."];
	while {true} do {
			// Check all existing groups to see if we can offload any	
		_AllGroups = allGroups;
		_GroupsToOffload = [];
			// Check spawntime on each group first
		{
					// Check creation time of group - We use this to keep track of group lifetime prior to automatic offloading
			_Group = _x;
			_SpawnTime = 0;
			_SpawnTime = _Group getVariable ["SpawnTime",0];
			if (_SpawnTime == 0) then {
				_Group setVariable ["SpawnTime",time,true];
			};
		} forEach _AllGroups;
			// Specific AI Table - For groups of AI that've been spawned in using Fnc_SCFramework_CreateGroup via script and configured in SpecificAITable to be offloaded to a specific headless client
		if (BDC_SCFramework_HCOffloading_SpecificAITable_Enable) then {
			{
				_Array = _x;
				_ModuleName = _Array select 0;
				_VariableName = _Array select 1;
				_HCClientNum = _Array select 2;
				if (_HCClientNum != 0) then { // If set to 0, then that's server; ignore it
					{
						_Group = _x;
						if (local _Group) then {
							_Var = false;
							_Var = _Group getVariable [_VariableName,false];
							_SpawnTime = time;
							_SpawnTime = _Group getVariable ["SpawnTime",0];
							_TimeDiff = time - _SpawnTime;
							if (_Var && (_TimeDiff >= BDC_SCFramework_HCOffloading_GroupTimerMinimum)) then {
								_AllGroups = _AllGroups - [_Group];
									// Grab specific HC Client ID from client number passed
								_Num = _HCClientNum - 1;
								_HCClientID = BDC_SCFramework_HeadlessClientIDs select _Num;
									// Add record to array
								_AddToOffloadArray = [];
								_AddToOffloadArray = [_Group,_HCClientID,_ModuleName];
								_GroupsToOffload pushbackUnique _AddToOffloadArray;
							};
						};
					} forEach _AllGroups;
				};
			} forEach BDC_SCFramework_HCOffloading_SpecificAITable;
		};
			// Did we collect any specific-configured groups to offload? Let's go
		if (count _GroupsToOffload > 0) then {
			{
				_Array = _x;
				_Group = _Array select 0;
				_HCClientID = _Array select 1;
				_ModuleName = _Array select 2;
				[_Group,_HCClientID,_ModuleName] call Fnc_SCFramework_SetGroupOwner;
				sleep 0.25; // Brief delay in between each
			} forEach _GroupsToOffload;
		};
			// Automatic offloading, if configured
		if (BDC_SCFramework_HCOffloading_AutomaticOffloading_Enable && (count _AllGroups > 0)) then {	
				// We're using _allGroups as it's already had groups removed per specific AI table config prior to this - So we'll look for groups that we can automatically offload that are leftover
				// Gather ownership numbers from each HC, if any connected
			if (count BDC_SCFramework_HeadlessClientIDs > 0) then {
				_HCAIArray = [] call Fnc_SCFramework_BuildHCAIArray; // Build our array of live AI owned by each headless client
				{
					_Group = _x;
					if (local _Group) then {
						_SpawnTime = time;
						_SpawnTime = _Group getVariable ["SpawnTime",0];
						_TimeDiff = time - _SpawnTime;
						if (_TimeDiff >= BDC_SCFramework_HCOffloading_GroupTimerMinimum) then { // Group that server owns that's been around long enough to offload - let's go
							_FoundHC = false;
							//_HCAIArray = [] call Fnc_SCFramework_BuildHCAIArray; // Build our array of live AI owned by each headless client
							_HCCount = 0;
							{
								_BuildArray = _x;
								_HCOwner = _BuildArray select 0;
								_OwnedAI = _BuildArray select 1;
								if (!_FoundHC && (_OwnedAI < BDC_SCFramework_HCOffloading_AutomaticOffloading_MaxAIPerHeadlessClient)) then {
									_FoundHC = true;
									_GroupCount = count (units _Group);
									_NewOwnedAI = _OwnedAI + _GroupCount;
									_BuildArray = [_HCOwner,_NewOwnedAI];
									_HCAIArray set [_HCCount,_BuildArray];
									[_Group,_HCOwner,""] call Fnc_SCFramework_SetGroupOwner;
									sleep 0.25; // Brief delay in between each
								};
								_HCCount = _HCCount + 1;
							} forEach _HCAIArray;
						};
					};
				} forEach _allGroups;
			};
		};
		sleep BDC_SCFramework_HCOffloading_Frequency;
	};
};

// Headless Client automated AI offloading
if (BDC_SCFramework_HCOffloading_Enable) then {
	[] spawn Fnc_SCFramework_HCOffloading;
};

// Performance/AI Ownership logging
BDC_SCFramework_Logging = {
	_LastLog = 0;
	while {true} do {
		_TimeDiff = time - _LastLog;
		if (_TimeDiff >= BDC_SCFramework_LoggingFreq) then {
			_LastLog = time;
			_StartLogTime = time;
			_FPS = diag_FPS;
			_FPSMin = diag_fpsMin;
			_CachedAI = 0;
			_OwnedUnits = 0;
			{
				if (local _x && !isPlayer _x) then {
					_OwnedUnits = _OwnedUnits + 1;
					if !(simulationEnabled _x) then { 
						_CachedAI = _CachedAI + 1; 
					};
				};
			} forEach allUnits;
			_ActiveAI = _OwnedUnits - _CachedAI;
			if (!isServer) then {
				diag_log format["(SCFramework) Headless Client #%5 - Current FPS: %1 | FPS Min: %2 | Locally Owned AI: %3 | Cached AI: %4 | Active AI: %6",_FPS,_FPSMin,_OwnedUnits,_CachedAI,SCFramework_HCNumber,_ActiveAI]; 
			} else {
				diag_log format["(SCFramework) Server - Current FPS: %1 | FPS Min: %2 | Locally Owned AI: %3 | Cached AI: %4 | Active AI: %5",_FPS,_FPSMin,_OwnedUnits,_CachedAI,_ActiveAI];
				diag_log format["(SCFramework) Connected Headless Clients: %1",(count BDC_SCFramework_HeadlessClientIDs)];
			};
		};
		sleep 30;
	};
};

// Ping headless client to send it its client ID after connection (called from onPlayerConnected below)
Fnc_SCFramework_PingHCClientID = {
	_owner = _this select 0;
	_count = _this select 1;
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) Sending ping to headless client owner %1 with HCNumber %2.",_owner,_count];
	};
	SCFramework_HCSendClientID = [1,_owner,_count];
	_owner publicVariableClient "SCFramework_HCSendClientID";
};

// OnPlayerConnected (or headless client) - used to dole out client IDs
Fnc_SCFramework_onPlayerConnected = {
		// Passed Args
	_UID = _this select 0;
	_name = _this select 1;
	_owner = _this select 2;
		// Determine if headless client logging in
	_isHC = false;
	_NewStr = _UID select [0,2]; // Grab first 2 letters of the UID; all HC's logging in use 'HC' and then a number (drawn from PID of arma.exe process in TaskMan)
	if (_NewStr == "HC") then { 
		_isHC = true; 
		BDC_SCFramework_HeadlessClientIDs pushBackUnique _owner;
		BDC_SCFramework_HeadlessClientUIDs pushBackUnique _UID; // This array is used to cross-reference ping to client ID when HC initially pings server requesting its client ID - ^bdc
		diag_log format["(SCFramework) onPlayerConnected: Headless Client %1 %2 with ClientID %3 connected.",_UID,_name,_owner];
		diag_log format["(SCFramework) Current number of headless clients now connected: %1",(count BDC_SCFramework_HeadlessClientIDs)];
		if (!BDC_SCFramework_HasDisconnectedHC) then {
			[_owner,(count BDC_SCFramework_HeadlessClientIDs)] spawn Fnc_SCFramework_PingHCClientID; 
		} else {
			BDC_SCFramework_HasDisconnectedHC = false;
			diag_log format["(SCFramework) Crashed/Disconnected Headless Client re-connecting. Re-sending ID's to all HC's."];
			_Count = 1;
			{
				[_x,_Count] spawn Fnc_SCFramework_PingHCClientID;
				_Count = _Count + 1;
			} forEach BDC_SCFramework_HeadlessClientIDs;
		};
	} else { // Keep track of player client id's in a separate array
		if (_name != "__SERVER__") then {
			if (_UID in BDC_SCFramework_ServerFPSReport_AdminUIDList) then {
				diag_log format["(SCFramework) onPlayerConnected: ADMIN %1 (%2) has connected.",_name,_UID];
			} else {
				diag_log format["(SCFramework) onPlayerConnected: Player %1 (%2) has connected.",_name,_UID];
			};
			_SCArray = [_owner,_UID]; // Two element array containing client ID (from owner) and the player UID (so as to remove possibility of difference with player names)
			BDC_SCFramework_PlayerClientIDs pushBackUnique _SCArray;
		};
	};
};

// OnPlayerDisconnected (or HC) - We are using this only to track the disconnection of a headless client
Fnc_SCFramework_onPlayerDisconnected = {
		// Passed Args
	_UID = _this select 0;
	_name = _this select 1;
	_owner = _this select 2;
		// Determine if headless client logging in
	_isHC = false;
	_NewStr = _UID select [0,2]; 
	if (_NewStr == "HC") then { 
		BDC_SCFramework_HeadlessClientIDs = [BDC_SCFramework_HeadlessClientIDs,_owner] call Fnc_SCFramework_DeleteArrayElement; // Functions_SCFramework
		BDC_SCFramework_HeadlessClientUIDs = [BDC_SCFramework_HeadlessClientUIDs,_UID] call Fnc_SCFramework_DeleteArrayElement;
		diag_log format["(SCFramework) Headless Client %1 %2 with ClientID %3 has either crashed or disconnected in an unknown manner. Removing from global arrays.",_UID,_name,_owner];
		diag_log format["(SCFramework) Current number of headless clients now connected: %1",(count BDC_SCFramework_HeadlessClientIDs)];
		BDC_SCFramework_HasDisconnectedHC = true; // Will flag false if another HC logs in; reason being is we want to re-shuffle all the headless client ID's after one crashes and re-connects successfully
	} else {
		diag_log format["(SCFramework) Player %1 (%2) disconnected.",_name,_UID];
		_TArray = [_owner,_UID];
		BDC_SCFramework_PlayerClientIDs = BDC_SCFramework_PlayerClientIDs - [_TArray];
	};
};


// Group manager (empty group deletion) function
Fnc_SCFramework_GroupManager = {
	sleep BDC_SCFramework_HCOffloading_StartDelay; // Sleep before starting - we wait until the HCOffloading start delay has expired
	diag_log format["(SCFramework) Server - Starting empty group deletion manager."];
	while {true} do {
		_Ctr = 0;
		_CountBefore = count allGroups;
		{
			if (count units _x == 0) then {
				deleteGroup _x; // Delete empty group
			};
		} forEach allGroups;
		_CountAfter = count allGroups;
		_Ctr = (_CountBefore - _CountAfter);
		if (_Ctr > 0) then {
			diag_log format["(SCFramework) Group Manager: Deleted %1 empty groups. Groups prior: %2 | Active groups remaining: %3",_Ctr,_CountBefore,_CountAfter];
		};
		sleep 300; // Run once every 5 minutes
	};
};

	// Performance logging routine
_LogRoutine = {
	if (BDC_SCFramework_LoggingFreq > 0) then {
		if (BDC_SCFramework_LoggingDelay > 0) then {
			diag_log format["(SCFramework) Delaying start of performance and AI ownership automated logging for %1 seconds.",BDC_SCFramework_LoggingDelay];
			sleep BDC_SCFramework_LoggingDelay;
		};
		diag_log format["(SCFramework) Starting performance and AI ownership logging for server every %1 seconds.",BDC_SCFramework_LoggingFreq];
		[] spawn BDC_SCFramework_Logging;
	};
};

// Stacked EH for onPlayerConnected and onPlayerDisconnected - track when clients connect and disconnect/crash
["SCFrameworkOnPlayerConnected", "onPlayerConnected", { [_uid, _name, _owner] call Fnc_SCFramework_onPlayerConnected; }] call BIS_fnc_addStackedEventHandler;
["SCFrameworkOnPlayerDisconnected", "onPlayerDisconnected", { [_uid, _name, _owner] call Fnc_SCFramework_onPlayerDisconnected; }] call BIS_fnc_addStackedEventHandler;	

// Start logging routine, if enabled
[] spawn _LogRoutine;

// Start group manager
if (BDC_SCFramework_GroupManagerEnable) then {
	[] spawn Fnc_SCFramework_GroupManager;
};

diag_log format["(SCFramework) Server: Headless and player client ID's arrays initialized. SCFramework server-side eventhandlers and functions loaded."];