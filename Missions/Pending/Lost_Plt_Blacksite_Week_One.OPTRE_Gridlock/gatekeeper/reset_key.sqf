params ["_key_object"];

private _data = key_store get _key_object;

if (not (isNil "_data")) then {
	// Add the pickup action again

	(_data select 0) addAction ["Pickup " + _key_name, {
		[_this select 3 select 0, _this select 3 select 1, _this select 3 select 2, _this select 3 select 3, _this select 3 select 4, _this select 1] call SVLN_fnc_pickupKey;
		(_this select 0) removeAction (_this select 2);
	}, _data];
};