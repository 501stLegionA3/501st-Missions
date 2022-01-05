createDialog "SVLN_CTPL_LaunchController";

if(isNil 'first_menu_open') then {
	[] call SVLN_fnc_loadMenuDefaults;
	first_menu_open = true;
	publicVariable 'firest_menu_open';
} else {
	if (isNil 'launch_settings') then {
		[] call SVLN_fnc_loadMenuDefaults;
	} else {
		lbClear 1515; 
		if (!isNil 'global_catapults') then { 
			{ 
				lbAdd [1515, (_x select 1)];
			} forEach (global_catapults getOrDefault ['catapults', []]);
		};

		item_list = launch_settings getOrDefault ["last_use", []];
		private _vals = item_list select 0;

		// Acceleration
		ctrlSetText [1501, format ["%1", (_vals select 2)]];
		// Speed
		ctrlSetText [1502, format ["%1", (_vals select 3)]];
		// Pitch
		ctrlSetText [1503, format ["%1", (_vals select 4)]];
		// Distance
		ctrlSetText [1504, format ["%1", (_vals select 6)]];

		// Hover
		ctrlSetText [1511, format ["%1", (_vals select 5)]];
		// Rotation
		ctrlSetText [1512, format ["%1", (_vals select 1)]];
		// Hover Cycles
		ctrlSetText [1513, format ["%1", (_vals select 7)]];
		// Sleep Timer
		ctrlSetText [1514, format ["%1", (_vals select 8)]];
	};
};