params ["_trigger", "_endpoints"];

_trigger setVariable ["SVLN_itr_endpoints", _endpoints, true];

_trigger setTriggerStatements [
	"this",
	"{ if (_x isKindOf 'AllVehicles') then { [_x, thisTrigger] call SVLN_fnc_iterativeTeleport; };} forEach thisList;",
	""
];