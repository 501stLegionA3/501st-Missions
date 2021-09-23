params ["_key_object", "_key_color", "_attach_offset", "_attach_vdir", "_attach_point", "_key_name"];

// do light registration.

private _light = "#lightpoint" createVehicle (_key_object modelToworld [0, 0, 0.1]);
[_light, _key_color] remoteExec ["setLightColor", client];
[_light, _key_color] remoteExec ["setLightAmbient", client];
[_light, 50] remoteExec ["setLightBrightness", client];
[_light, 50] remoteExec ["setLightIntensity", client];
[_light, true] remoteExec ["setLightDayLight", client];

[_light, _key_object, [0, 0, 0]] remoteExec ["attachTo", client];

// Save params to hash map

key_store set [_key_name, [_key_object, _attach_offset, _attach_vdir, _attach_point, _key_name, _key_color]];
_key_object setVariable ["SVLN_key_name", _key_name];

// regisert inital pickup action.

_key_object addAction ["Pickup " + _key_name, {
	[_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3, _this select 3 select 4, _this select 1] call SVLN_fnc_pickupKey;
	(_this select 0) removeAction (_this select 2);
}, [_key_object, _attach_offset, _attach_vdir, _attach_point, _key_name]];