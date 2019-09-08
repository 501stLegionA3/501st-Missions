/*
	HeadlessClient_SCFramework.SQF
	
	Script file for any and all headless clients that connect to dedicated server
	containing eventhandlers and related functions
*/

if (hasInterface || isServer) exitWith {}; // Headless clients only

// Reset global variables
SCFramework_HCPingResponseServer = []; // Reset default
SCFramework_ClientID = nil; // ClientID is the owner number that is used during publicVariableClient calls from the server for offloading AI units/groups
SCFramework_HCNumber = nil; // HC Number differs from ClientID; Number is an arbitrary figure

// Eventhandlers/Functions
	// Called from server-side AI spawning module that checks for ready state of a specific headless client - Randomnumber and owner ID is sent
	// Can be used to verify said ready state for selected headless client (via ClientID) from any server-side script
"SCFramework_PingHeadlessClient" addPublicVariableEventHandler { 
	_Array = _this select 1;
	_RandomNum = _Array select 0;
	_Owner = _Array select 1;
	if (BDC_SCFramework_DetailedLogging) then {
		diag_log format["(SCFramework) Received ping from server (%1). Sending response back.",_RandomNum];
	};
	SCFramework_HCPingResponseServer = [_RandomNum,_Owner];
	publicVariableServer "SCFramework_HCPingResponseServer";
};
	// One-way ping sent from server during onPlayerConnected routine that sends the headless client its unique Client ID (SCFramework_ClientID) 
	// as well as its headless client number (1, 2, 3, etc). Can be referenced in other scripts when sending requests to server
"SCFramework_HCSendClientID" addPublicVariableEventHandler {
	_Array = _this select 1;
	_SentNum = _Array select 0;
	_SentClientID = _Array select 1;
	_SendHCNumber = _Array select 2;
	if (_SentNum == 1) then {
		SCFramework_ClientID = _SentClientID; 
		SCFramework_HCNumber = _SendHCNumber; 
		if (BDC_SCFramework_DetailedLogging) then {
			diag_log format["(SCFramework) Ping sent from server - Headless Client owner ID: %1 | Headless Client number: %2",SCFramework_ClientID,SCFramework_HCNumber];
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
	_VehArray = [];
	{
			// Check for AI 
		if (local _x && alive _x && !isPlayer _x) then {
			if (vehicle _x != _x) then {
				if !(vehicle _x in _VehArray) then {
					_VehArray pushBackUnique (vehicle _x) 
				};
			};
			_OwnedAI = _OwnedAI + 1;
			_isAIVCached = false;
			_isAIVCached = _x getVariable ["isAIVCached",false]; // Fnc_AIVManager
			if (_isAIVCached || !(simulationEnabled _x)) then {
				_CachedAI = _CachedAI + 1;
			};
		};
	} forEach allUnits;
		// Get server FPS and FPSmin
	_FPS = round(diag_fps);
		// Add to array we are building to send back to client
	_Name = "";
	switch (SCFramework_HCNumber) do {
		case 1 : { _Name = "HC1"; };
		case 2 : { _Name = "HC2"; };
		case 3 : { _Name = "HC3"; };
		case 4 : { _Name = "HC4"; };
		case 5 : { _Name = "HC5"; };
	};
	_ReturnArray = [_Name,_FPS,_OwnedAI,_CachedAI,0,0];
	SCFramework_ServerFPSResponse = _ReturnArray;
	_ClientID publicVariableClient "SCFramework_ServerFPSResponse";
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
			diag_log format["(SCFramework) Headless Client #%5 - Current FPS: %1 | FPS Min: %2 | Locally Owned AI: %3 | Cached AI: %4 | Active AI: %6",_FPS,_FPSMin,_OwnedUnits,_CachedAI,SCFramework_HCNumber,_ActiveAI]; 
		};
		sleep 30;
	};
};

// Logging routine starter
_LogRoutine = {
	if (BDC_SCFramework_LoggingFreq > 0) then {
		if (BDC_SCFramework_LoggingDelay > 0) then {
			diag_log format["(SCFramework) Delaying start of performance and AI ownership automated logging for %1 seconds.",BDC_SCFramework_LoggingDelay];
			sleep BDC_SCFramework_LoggingDelay;
		};
		if (!isServer) then {
			diag_log format["(SCFramework) Starting performance and AI ownership logging for Headless Client %1 every %2 seconds.",SCFramework_HCNumber,BDC_SCFramework_LoggingFreq];
		} else {
			diag_log format["(SCFramework) Starting performance and AI ownership logging for server every %2 seconds.",BDC_SCFramework_LoggingFreq];
		};
		[] spawn BDC_SCFramework_Logging;
	};
};

// Request our Client ID
if (BDC_SCFramework_DetailedLogging) then {
	diag_log format["(SCFramework) Requesting our Client ID and Headless Client Number from server. Sending UID: %1",(getPlayerUID player)];
	
};
SCFramework_HCPingRequestClientID = (getPlayerUID player);
publicVariableServer "SCFramework_HCPingRequestClientID";

// Start logging routine, if enabled
[] spawn _LogRoutine;

diag_log format["(SCFramework) HeadlessClient: Global variables reset and eventhandlers/functions loaded."];