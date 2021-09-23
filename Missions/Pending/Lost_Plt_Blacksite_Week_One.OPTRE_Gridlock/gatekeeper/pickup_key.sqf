params ["_key_object", "_attach_offset", "_attach_vdir", "_attach_point", "_key_name", "_caller"];

// Attach the key to the player

_key_object attachTo [_caller, _attach_offset, _attach_point, true];
_key_object setVectorDirAndUp _attach_vdir;

// Listed to a killed event

_caller addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	{
		detach _x;
		[_x getVariable ["SVLN_key_name", ""]] call SVLN_fnc_resetKey;
	} forEach attachedObjects _unit;
	_unit removeEventHandler ["Killed", _thisEventHandler];
}];

// Register the drop interaction

_caller addAction ["Drop " + _key_name, {
	[_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3, _this select 3 select 4, _this select 1] call SVLN_fnc_dropKey;
	(_this select 0) removeAction (_this select 2);
}, [_key_object, _attach_offset, _attach_vdir, _attach_point, _key_name]];