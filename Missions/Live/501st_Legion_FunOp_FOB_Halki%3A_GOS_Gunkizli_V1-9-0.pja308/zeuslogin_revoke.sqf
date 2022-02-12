params ["_player"];

if(isServer) then {

	private _curModule = missionnamespace getVariable ["SVLN_ZLGN_curatorModule", objNull];

	if(isNull _curModule) then {
		_curModule = (createGroup west) createUnit ["ModuleCurator_F", position _player, [], 0, "CAN_COLLIDE"];
		missionnamespace setVariable ["SVLN_ZLGN_curatorModule", _curModule, true];
	};

	diag_log text (["[SVLN]", "[ZEUS LOGIN]", "DEBUG:", "Revoking access from", _curModule] joinString " ");

	unassignCurator _curModule;

	[_player, "logged out of zeus."] remoteExecCall ["SVLN_fnc_zeusLoginGlobalMessage", 0];
};
