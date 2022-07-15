if (isServer) then {
	addMissionEventHandler ["MPEnded", {
		["MP Ended Event Fired", 2, "MPSTATUS"] call RD501_fnc_logMessage;
	}];

	["Added MPEnded event to server.", 2, "MPSTATUS"] call RD501_fnc_logMessage;
};

// addMissionEventHandler ["Ended", {
// 	["Ended Event Fired", 2, "MPSTATUS"] call RD501_fnc_logMessage;
// }];