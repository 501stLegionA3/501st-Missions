params ["_target", "_player", "_params"];

private _curZeus = missionnamespace getVariable ["SVLN_ZLGN_activeZeusUser", false];

diag_log text (["[SVLN]", "[ZEUS LOGIN]", "DEBUG:", "Attempting login to Zeus with player", _player, "| is there a current zeus?", _curZeus] joinString " ");

if (!_curZeus) then {
	missionNamespace setVariable ["SVLN_ZLGN_activeZeusUser", true, true];
	missionNamespace setVariable ["SVLN_ZLGN_activeZeusUserObject", _player, true];

	[_player] remoteExecCall ["SVLN_fnc_zeusLoginGrantZeus", 2];
};