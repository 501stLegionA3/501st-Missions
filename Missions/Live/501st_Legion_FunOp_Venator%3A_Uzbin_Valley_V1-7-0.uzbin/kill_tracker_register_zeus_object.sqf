params ["_curator", "_entity"];

if ((_entity isKindOf "AllVehicles") and not (_entity isKindOf "Man")) then {
	_entity addEventHandler ["Killed", {
		params ["_a", "_b", "_c", "_d"];
		[_a, _b, _c, _d, true] remoteExec ["SVLN_fnc_saveNewKill", 0];
	}];
};