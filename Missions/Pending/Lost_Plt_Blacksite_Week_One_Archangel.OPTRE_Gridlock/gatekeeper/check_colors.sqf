params ["_objects", "_key"];

private _total = [0, 0, 0];
{
	{
		private _name = _x getVariable ["SVLN_key_name", nil];
		private _set = key_store get _name;
		private _color = _set select 5;
		_total = _total vectorAdd _color;
	} forEach attachedObjects _x;
} forEach _objects;

private _res = false;
if (_total isEqualTo _key or _total isEqualTo [2, 2, 2]) then {
	_res = true;
};

_res