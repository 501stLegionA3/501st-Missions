// Spawn Vic Script

diag_log text (["[SVLN]", "[VIC SPAWNER]", "DEBUG:", "Called spawn vic."] joinString " ");

if((!isNil 'SVLN_VSPW_registered_vics') and (!isNil 'SVLN_VSPW_registered_positions')) then {
	_vicSel = lbSelection (displayCtrl 5001);
	_vicSelIndex = _vicSel select 0;

	if(isNil '_vicSelIndex') then {
		_vicSelIndex = 0;
	};

	_posSel = lbSelection (displayCtrl 5002);
	_posSelIndex = _posSel select 0;

	if(isNil '_posSelIndex') then {
		_posSelIndex = 0;
	};

	diag_log text (["[SVLN]", "[VIC SPAWNER]", "DEBUG:", "Attempting to grab vic at index", _vicSelIndex, "and spawn point at index", _posSelIndex] joinString " ");

	private _vicDat = (SVLN_VSPW_registered_vics getOrDefault ["vics", []]) select _vicSelIndex;
	private _locDat = (SVLN_VSPW_registered_positions getOrDefault ["pads", []]) select _posSelIndex;
	
	diag_log text (["[SVLN]", "[VIC SPAWNER]", "DEBUG:", "Vic and Location data dump:", _vicDat, _locDat] joinString " ");

	private _vic = createVehicle [_vicDat select 0, getPosATL (_locDat select 0), [], 0, "CAN_COLLIDE"];
	_vic setDir (_locDat select 2);
};

// Close the open dialouge
closeDialog 1;