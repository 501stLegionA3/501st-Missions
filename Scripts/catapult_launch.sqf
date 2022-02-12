// Example call
// [launch_pad_one, 180, 50, 750, -15, 5, 500] call SVLN_fnc_launchCatapult;

params ["_pad", "_dir", "_speed", "_launch_speed", "_launch_rot", "_launch_height", "_max_dist", "_hover_cycles", "_sleep_timer"];

diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "Attempting launch with params:", _pad, _dir, _speed, _launch_speed, _launch_rot, _launch_height] joinString " ");

private _vic = [_pad] call SVLN_fnc_detectCatapultVic;

if (!(isNil "_vic")) then {
	// [_vic, _dir] call BIS_fnc_aircraftCatapultLaunch;

	// Save settings for next launch:
	if (isNil 'SVLN_CTPL_launch_settings') then {
		SVLN_CTPL_launch_settings = createHashMap;
		publicVariable "SVLN_CTPL_launch_settings";
	};

	item_list = SVLN_CTPL_launch_settings getOrDefault ["last_use", []];
	item_list set [0, _this];
	SVLN_CTPL_launch_settings set ["last_use", item_list];

	// Start the launch process.

	diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "Found vic:", _vic] joinString " ");

	_vic setDir _dir;
	
	diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "Rotated vic to:", _dir] joinString " ");

	private _alt = getPosASL _vic;
	_alt = _alt vectorAdd [0, 0, _launch_height];
	_vic setPosASL _alt;

	diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "Set vic position:", _alt] joinString " ");

	// Do funky hold position thing.
	private _sin = sin _dir;
	private _cos = cos _dir;
	private _vertSin = sin _launch_rot;

	private _counter = _hover_cycles;
	while { _counter > 0 } do {
		_vic setPosASL _alt;
		
		_vic setVectorDir [
			_sin,
			_cos,
			0
		];

		[_vic, _launch_rot, 0] call BIS_fnc_setPitchBank;

		sleep _sleep_timer;

		_counter = _counter - 1;
	};

	private _pad_pos = getPosASL _pad;
	while { (speed _vic <= _launch_speed) and (((getPosASL _vic) distance _pad_pos) <= _max_dist) } do {
		private _vel = velocity _vic;
		// private _vDir = vectorDir _vic;
		// private _vUp = vectorUp _vic;

		_vic setVectorDir [
			_sin,
			_cos,
			0
		];

		[_vic, _launch_rot, 0] call BIS_fnc_setPitchBank;

		_vic setVelocity [
			(_vel select 0) + _sin * _speed,
			(_vel select 1) + _cos * _speed,
			(_vel select 2) + _vertSin * _speed
		];

		diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "Pushed vic to:", getPos _vic] joinString " ");

		sleep _sleep_timer;
	};
} else {
	diag_log text (["[SVLN]", "[CATAPULT]", "DEBUG:", "No vic found."] joinString " ");
};