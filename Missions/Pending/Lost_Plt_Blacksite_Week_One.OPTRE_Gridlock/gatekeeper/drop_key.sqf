params ["_key_object", "_attach_offset", "_attach_vdir", "_attach_point", "_key_name", "_caller"];

// Drop the key

detach _key_object;

// Remove the killed event handler

_caller removeEventHandler ["Killed", 0];

// Register the pickup action

_key_object addAction ["Pickup " + _key_name, {
	[_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3, _this select 3 select 4, _this select 1] call SVLN_fnc_pickupKey;
	(_this select 0) removeAction (_this select 2);
}, [_key_object, _attach_offset, _attach_vdir, _attach_point, _key_name]];