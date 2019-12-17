/*
	Init_SCFramework.SQF
	
	SCFramework initialization script that handles which instances load what processes
*/

diag_log format["(SCFramework) Loading Configuration options and functions."];

#include "Config_SCFramework.SQF"; // Configuration file loaded for everyone
Functions_SCFramework = call compile preProcessFileLineNumbers "SCFramework\Functions_SCFramework.SQF";

if (!hasInterface && !isServer) then { // Dedicated headless client
	#include "HeadlessClient_SCFramework.SQF"; 
};
if (isServer) then { // Server only
	#include "Server_SCFramework.SQF";
};
if (hasInterface) then { // Player client only
	#include "Player_SCFramework.SQF";
	[] spawn {
			// Wait until player object is created
		waitUntil {!isNull player};
			// GetOutMan event handler - Used for retaining vehicle ownership when player is last to exit a now otherwise empty vehicle
		player addEventHandler ["GetOutMan", {
			_player = _this select 0;
			_vehicle = _this select 2;
			_isEmpty = false;
			if (count crew _Vehicle == 0 && alive _Vehicle) then {
				_isEmpty = true;
			};
			diag_log format["(SCFramework) GetOutMan EH Tripped. Vehicle %1 %2, isEmpty %3",_Vehicle,typeOf _Vehicle,_isEmpty];
			if (alive _vehicle && _isEmpty) then {
				SCFramework_RequestRetainVehOwnership = [SCFramework_ClientID,_Vehicle];
				publicVariableServer "SCFramework_RequestRetainVehOwnership";
			};
		}];
			// Send ping to server requesting our Client ID
		SCFramework_PlayerPingResponseServer = getPlayerUID player; // InitServer
		publicVariableServer "SCFramework_PlayerPingResponseServer";
		diag_log format["(SCFramework) Sending server request (UID %1) for my client ID.",(getPlayerUID player)];
	};
};

diag_log format["(SCFramework) Initialization script complete."];