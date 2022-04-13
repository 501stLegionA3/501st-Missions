params ["_target", "_player", "_params"];

private _curZeus = missionnamespace getVariable ["SVLN_ZLGN_activeZeusUserObject", objNull];

_res = _curZeus == _player;
if (isDedicated) then {
	_res = _res or (admin _player) != 0;
};

diag_log text (["[SVLN]", "[ZEUS LOGIN]", "DEBUG:", "Attempting logout from Zeus with player", _player, "and current zeus", _curZeus, "with logic gate", _res] joinString " ");

if (_res) then {
	missionNamespace setVariable ["SVLN_ZLGN_activeZeusUser", false, true];
	missionNamespace setVariable ["SVLN_ZLGN_activeZeusUserObject", objNull, true];

	[_curZeus] remoteExecCall ["SVLN_fnc_zeusLoginRevokeZeus", 2];
};