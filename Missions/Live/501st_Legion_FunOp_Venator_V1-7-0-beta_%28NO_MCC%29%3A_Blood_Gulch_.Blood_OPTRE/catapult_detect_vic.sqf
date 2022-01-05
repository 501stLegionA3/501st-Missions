params ["_origin"];

// 30 metere sphere to check in aorund the center
// of the origin point.
private _dist = 15;
private _pos = getPosASL _origin;

private _vicPos = vehicles findIf { (getPosASL _x) distance _pos <= _dist };

diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "Found pos", _vicPos, "near", _pos] joinString " ");

if (_vicPos > -1) then {
	private _vic = vehicles select _vicPos;

	_vic
};