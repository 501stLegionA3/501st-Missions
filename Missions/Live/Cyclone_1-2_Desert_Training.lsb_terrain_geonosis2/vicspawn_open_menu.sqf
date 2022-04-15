params ["_filter"];

createDialog "SVLN_VSPW_SpawnMenu";

lbClear 5001;
if (!isNil 'SVLN_VSPW_registered_vics') then { 
	{
		lbAdd [5001, (_x select 1)];
	} forEach (SVLN_VSPW_registered_vics getOrDefault ['vics', []]);
};

lbClear 5002;
if (!isNil 'SVLN_VSPW_registered_positions') then { 
	{ 
		if(isNil '_filter' or _filter == -1) then {
			lbAdd [5002, (_x select 1)];
		} else {
			if(_filter == (_x select 3)) then {
				lbAdd [5002, (_x select 1)];
			} else {
				lbAdd [5002, ""];
			}
		};
	} forEach (SVLN_VSPW_registered_positions getOrDefault ['pads', []]);
};