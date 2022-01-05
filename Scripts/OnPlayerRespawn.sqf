player enableStamina false;

// START LOGGING INIT

player addAction ["Display Kill Feed", {
	[] call SVLN_fnc_displayKillFeed;
}];

player addAction ["Clear Kill Feed", {
	profileNamespace setVariable ["SVLN_Kill_Feed", ""];
}];

private _killFeedStatus = profileNamespace getVariable ["SVLN_Kill_Feed_Active", false];
if(_killFeedStatus) then {
	player addAction ["Stop Kill Feed", {
		[(_this select 1)] call SVLN_fnc_disableKillFeed;
		(_this select 1) removeAction (_this select 2);
	}];
} else {
	player addAction ["Start Kill Feed", {
		[(_this select 1)] call SVLN_fnc_enableKillFeed;
		(_this select 1) removeAction (_this select 2);
	}];
};

// private _grp = (group player) getVariable ["SLVN_Kill_Tracker_Group", "NA"];
// player setVariable ["SLVN_Kill_Tracker_Group", _grp, true];
// player setVariable ["SLVN_Kill_Tracker_Desc", roleDescription player, true];
// player setVariable ["SLVN_Kill_Tracker_Name", name player, true];

// END LOGGING INIT