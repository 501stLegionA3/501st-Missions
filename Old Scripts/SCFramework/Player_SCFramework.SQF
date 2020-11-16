/*
	Player_SCFramework.SQF
	
	Player-side global variables, functions, and eventhandlers for BDC's Client ID's Framework
	
	Written for A3 by ^bdc		May 2017
*/

if (!hasInterface || isServer) exitWith {}; // player clients only

SCFramework_ClientID = nil; // This global variable may be referenced by any other script if needed for owner/clientID purposes
	// Eventhandler that sent from server when initial eventhandler below is called by player client machine
"SCFramework_PlayerSendClientID" addPublicVariableEventHandler {
	_Array = _this select 1;
	_SentUID = _Array select 0;
	_SentClientID = _Array select 1;
	if (getPlayerUID player == _SentUID) then {
		SCFramework_ClientID = _SentClientID; // This global variable may be referenced by any other script if needed
		diag_log format["(SCFramework) Response received from server. My Client ID: %1",SCFramework_ClientID];
	};
};
	// Response from server for on-the-fly ServerFPSReport
"SCFramework_ServerFPSResponse" addPublicVariableEventHandler {
	if (ServerFPSReport_Enabled) then {
		_Array = _this select 1;
		ServerFPSReport_Received = ServerFPSReport_Received + [_Array];
	};
};

	// Display event handler that captures keystroke to fire up ServerFPSReport
BDC_SCFramework_ServerFPSReportKeystroke = {
		// Passed Args
	_dikCode = _this select 1;
	_shiftState = _this select 2;
	_ctrlState = _this select 3;
	_altState = _this select 4;
	_handled = false;
		// Server FPS Report (Configured keystroke) (SCFramework)
	if (_dikCode == (BDC_SCFramework_ServerFPSReport_KeyCodes select 0) && !_shiftState && !_ctrlState && !_altState) then {
		if (ServerFPSReport_Enabled) then {
			hintSilent "";
			ServerFPSReport_Enabled = false;
			cutText ["Server FPS Reporting DISABLED.", "PLAIN DOWN"];
		} else {
			ServerFPSReport_Enabled = true;
			[] spawn SCFramework_DisplayFPSReport;
			cutText ["Server FPS Reporting ENABLED.", "PLAIN DOWN"];
		};
		_handled = true;
	};
	if (_dikCode == (0x3C) && !_shiftState && !_ctrlState && !_altState) then {
		if (BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable) then {
			BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable = false;
			cutText ["Automatic Transferrence of Zeus-spawned AI DISABLED.", "PLAIN DOWN"];
		} else {
			BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable = true;
			cutText ["Automatic Transferrence of Zeus-spawned AI ENABLED.", "PLAIN DOWN"];
			if (!BDC_SCFramework_TransferZeusOwnedAI_InitialEnable) then {
				BDC_SCFramework_TransferZeusOwnedAI_InitialEnable = true;
				[] spawn BDC_SCFramework_TransferZeusOwnedAI;
			};
		};
	};
	//diag_log format["keystroke EH TEST - dikcode %1 shiftstate %2 ctrlstate %3 altstate %4 handled %5",_dikCode,_shiftState,_ctrlState,_altSTate,_handled];
	_handled
};

diag_log format["(SCFramework) Player Client: Global variables reset and eventhandlers/functions loaded."];

BDC_SCFramework_TransferZeusOwnedAI = {
	// Check if Zeus operator owns spawned-in AI
	diag_log format["(SCFramework) Starting TransferZeusOwnedAI monitor."];
	while {true} do {
		_PlayerGroup = group player;
		{
			_Group = _x;
			_ZeusFlagged = false;
			_ZeusFlagged = _Group getVariable ["ZeusFlagged",false];
			if (local _Group && (_PlayerGroup != _Group) && (!_ZeusFlagged) && BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable) then { // We'll skip checking the group that we're in; otherwise it'll spam the server
				if (count units _Group > 0) then {
					if (BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_FlagOffloadedGroups) then {
						_Group setVariable ["ZeusFlagged",true,true]; // If enabled, only allow this group to automatically move to server once if it is moved back to a Zeus Op
					};
					SCFramework_ResetGroupOwnership = _Group;
					publicVariableServer "SCFramework_ResetGroupOwnership";
					if (BDC_SCFramework_DetailedLogging) then {
						diag_log format["(SCFramework) Transferring locally-owned AI group %1 to server.",_Group];
					};
				};
			};
		} forEach allGroups;
		sleep BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Frequency;
	};
};

	// Check if admin for Server FPS report
waitUntil {!isNull player};
sleep 3;
if ((getPlayerUID player) in BDC_SCFramework_ServerFPSReport_AdminUIDList) then {
	Fnc_ServerFPSReport = compile preProcessFileLineNumbers "SCFramework\Fnc_ServerFPSReport.SQF";
	[] spawn Fnc_ServerFPSReport;
	player addEventHandler ["Respawn",{ [] spawn Fnc_ServerFPSReport; }];
	BDC_SCFramework_ServerFPSReport_KeyboardPress = (findDisplay 46) displayAddEventHandler ["KeyDown","_this call BDC_SCFramework_ServerFPSReportKeystroke"];
	diag_log format["(SCFramework) Admin eventhandlers added. Press the F1 key to access the Server FPS report."];
};

	// Automatic transfer of Zeus-owned AI
if (BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable) then {
	[] spawn BDC_SCFramework_TransferZeusOwnedAI;
	BDC_SCFramework_TransferZeusOwnedAI_InitialEnable = true;
} else {
	BDC_SCFramework_TransferZeusOwnedAI_InitialEnable = false;
};