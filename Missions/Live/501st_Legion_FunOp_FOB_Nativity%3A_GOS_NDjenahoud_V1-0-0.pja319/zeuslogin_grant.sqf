params ["_player"];

if(isServer) then {

	private _curModule = missionnamespace getVariable ["SVLN_ZLGN_curatorModule", objNull];

	if(isNull _curModule) then {
		diag_log text (["[SVLN]", "[ZEUS LOGIN]", "DEBUG:", "No curator object found, spawning new one."] joinString " ");

		_curModule = (createGroup west) createUnit ["ModuleCurator_F", position _player, [], 0, "CAN_COLLIDE"];
		missionnamespace setVariable ["SVLN_ZLGN_curatorModule", _curModule, true];
	};

	diag_log text (["[SVLN]", "[ZEUS LOGIN]", "DEBUG:", "Assigning", _player, "to curator object", _curModule] joinString " ");

	_player assignCurator _curModule;

	[_player, "logged into zeus."] remoteExecCall ["SVLN_fnc_zeusLoginGlobalMessage", 0];
};