/*
	Fnc_ServerFPSReport.SQF
	
	An on-the-fly server and headless client FPS report that sends information on owned AI and vehicles
	as well as any of the two that might have cached ones
	
	Check Config_SCFramework for configuration options
*/

diag_log format["(SCFramework) ServerFPSReport Script started."];

// Action and default global var
s_player_FPSReport = -1;
ServerFPSReport_Enabled = false;

SCFramework_DisplayFPSReport = {
	_DoLoop = true;
	while {_DoLoop} do {
		ServerFPSReport_Received = [];
		SCFramework_ServerFPSRequest = SCFramework_ClientID;
		publicVariable "SCFramework_ServerFPSRequest";
		sleep 1; // Wait for response (Server_SCFramework)
			// Re-organize
		_SArray = [0,0,0,0,0,0];
		_HC1Array = [0,0,0,0,0,0];
		_HC2Array = [0,0,0,0,0,0];
		_HC3Array = [0,0,0,0,0,0];
		_HC4Array = [0,0,0,0,0,0];
		_HC5Array = [0,0,0,0,0,0];
		{
			_ProcessArray = _x;
			_Name = _ProcessArray select 0;
			switch (_Name) do {
				case "Server": { _SArray = _ProcessArray; };
				case "HC1": { _HC1Array = _ProcessArray; };
				case "HC2": { _HC2Array = _ProcessArray; };
				case "HC3": { _HC3Array = _ProcessArray; };
				case "HC4": { _HC4Array = _ProcessArray; };
				case "HC5": { _HC5Array = _ProcessArray; };
			};
		} forEach ServerFPSReport_Received;
			// Create main array to be split up
		ServerFPSReport_Received = [_SArray,_HC1Array,_HC2Array,_HC3Array,_HC4Array,_HC5Array];
			// Gather module names
		_SrvName = "";
		_HC1Name = "";
		_HC2Name = "";
		_HC3Name = "";
		_HC4Name = "";
		_HC5Name = "";
		if (BDC_SCFramework_ServerFPSReport_ModulesNames select 0 != "") then {
			_SrvName = format["\n%1",BDC_SCFramework_ServerFPSReport_ModulesNames select 0];
		};
		if (BDC_SCFramework_ServerFPSReport_ModulesNames select 1 != "") then {
			_HC1Name = format["\n%1",BDC_SCFramework_ServerFPSReport_ModulesNames select 1];
		};
		if (BDC_SCFramework_ServerFPSReport_ModulesNames select 2 != "") then {
			_HC2Name = format["\n%1",BDC_SCFramework_ServerFPSReport_ModulesNames select 2];
		};
		if (BDC_SCFramework_ServerFPSReport_ModulesNames select 3 != "") then {
			_HC3Name = format["\n%1",BDC_SCFramework_ServerFPSReport_ModulesNames select 3];
		};
		if (BDC_SCFramework_ServerFPSReport_ModulesNames select 4 != "") then {
			_HC4Name = format["\n%1",BDC_SCFramework_ServerFPSReport_ModulesNames select 4];
		};
		if (BDC_SCFramework_ServerFPSReport_ModulesNames select 5 != "") then {
			_HC5Name = format["\n%1",BDC_SCFramework_ServerFPSReport_ModulesNames select 5];
		};
			// Create vars for display
		_SA = ServerFPSReport_Received select 0;
			_SFPS = _SA select 1; _SOAI = _SA select 2; _SCAI = _SA select 3; _SLAI = (_SOAI - _SCAI); _SOV = _SA select 4; _SCV = _SA select 5; _SAV = _SOV - _SCV;
		_HC1A = ServerFPSReport_Received select 1;
			_HC1FPS = _HC1A select 1; _HC1OAI = _HC1A select 2; _HC1CAI = _HC1A select 3;  _HC1LAI = (_HC1OAI - _HC1CAI);
		_HC2A = ServerFPSReport_Received select 2;
			_HC2FPS = _HC2A select 1; _HC2OAI = _HC2A select 2; _HC2CAI = _HC2A select 3; _HC2LAI = (_HC2OAI - _HC2CAI); 
		_HC3A = ServerFPSReport_Received select 3;
			_HC3FPS = _HC3A select 1; _HC3OAI = _HC3A select 2; _HC3CAI = _HC3A select 3; _HC3LAI = (_HC3OAI - _HC3CAI); 
		_HC4A = ServerFPSReport_Received select 4;
			_HC4FPS = _HC4A select 1; _HC4OAI = _HC4A select 2; _HC4CAI = _HC4A select 3; _HC4LAI = (_HC4OAI - _HC4CAI);
		_HC5A = ServerFPSReport_Received select 5;
			_HC5FPS = _HC5A select 1; _HC5OAI = _HC5A select 2; _HC5CAI = _HC5A select 3; _HC5LAI = (_HC5OAI - _HC5CAI);
		_TActiveAI = 0;
		_TActiveAI = _SLAI + _HC1LAI + _HC2LAI + _HC3LAI + _HC4LAI + _HC5LAI;
		//_TVActive = _HC1AV + _HC2AV + _HC3AV + _HC4AV + _HC5AV;
		_LocalGroups = 0;
		_LocalAI = 0;
		_LocalGroupsStr = "";
		_LocalGroupsCont = 0;
		{
			if (local _x) then { 
				if (group player != _x && (count units _x > 0)) then {
					_LocalGroups = _LocalGroups + 1; 
					_LocalAI = _LocalAI + (count units _x);
					_ZeusFlagged = _x getVariable ["ZeusFlagged",false];
					_Str = format["%1 %2\n",_x,side _x];
					if (_ZeusFlagged) then {
						_Str = format["%1 %2 (Flagged)\n",_x,side _x];
					};
					_LocalGroupsCont = _LocalGroupsCont + 1;
					if (_LocalGroupsCont == 1) then {
						_LocalGroupsStr = "\nLocally Owned Groups:\n";
					};
					_LocalGroupsStr = _LocalGroupsStr + _Str;
				};
			};
		} forEach allGroups;
		_AutomaticOffloading = "Enabled";
		if (!BDC_SCFramework_HCOffloading_AutomaticOffloading_Enable) then {
			_AutomaticOffloading = "Disabled";
		};
		_TransferZeusOpAI = "Enabled";
		if (!BDC_SCFramework_HCOffloading_AutomaticOffLoading_TransferZeusOperatorAI_Enable) then {
			_TransferZeusOpAI = "Disabled";
		};
			// Display hint
		hint format [
			"Server/HC FPS Report:\n\nServer - %2 FPS%1\nAI: %3 Active | %4 Owned | %5 Cached\nVehs: %6 Active | %7 Total | %8 Cached\n\n
			Headless Client 1 - %10 FPS%9\nAI: %11 Active | %12 Owned | %13 Cached\n\n
			Headless Client 2 - %15 FPS%14\nAI: %16 Active | %17 Owned | %18 Cached\n\n
			Headless Client 3 - %20 FPS%19\nAI: %21 Active | %22 Owned | %23 Cached\n\n
			Headless Client 4 - %25 FPS%24\nAI: %26 Active | %27 Owned | %28 Cached\n\n
			Headless Client 5 - %30 FPS%29\nAI: %31 Active | %32 Owned | %33 Cached\n\n
			%34 Total Active Server AI\n\nAutomatic HCOffloading: %35\nAuto-Transfer Zeus-Op AI: %36\n\nLocally Owned Groups: %37 (%38 AI)\n
			%39",
			_SrvName,_SFPS,_SLAI,_SOAI,_SCAI,_SAV,_SOV,_SCV,
			_HC1Name,_HC1FPS,_HC1LAI,_HC1OAI,_HC1CAI,
			_HC2Name,_HC2FPS,_HC2LAI,_HC2OAI,_HC2CAI,
			_HC3Name,_HC3FPS,_HC3LAI,_HC3OAI,_HC3CAI,
			_HC4Name,_HC4FPS,_HC4LAI,_HC4OAI,_HC4CAI,
			_HC5Name,_HC5FPS,_HC5LAI,_HC5OAI,_HC5CAI,
			_TActiveAI,_AutomaticOffloading,_TransferZeusOpAI,
			_LocalGroups,_LocalAI,_LocalGroupsStr
		];
		if (!ServerFPSReport_Enabled) then { _DoLoop = false; hint ""; };
	};
};
