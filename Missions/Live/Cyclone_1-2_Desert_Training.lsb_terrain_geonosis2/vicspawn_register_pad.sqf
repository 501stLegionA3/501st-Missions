params ["_pad", "_disp", "_rot", "_filter"];

if (isNil "SVLN_VSPW_registered_positions") then {
	SVLN_VSPW_registered_positions = createHashMap;
	publicVariable "SVLN_VSPW_registered_positions";
};

item_list = SVLN_VSPW_registered_positions getOrDefault ["pads", []];
item_list append [[_pad, _disp, _rot, _filter]];
SVLN_VSPW_registered_positions set ["pads", item_list];

diag_log text (["[SVLN]", "[VIC SPAWNER]", "DEBUG:", "Registered Pad", _pad, "(", _disp, ")", "at", getPos _pad] joinString " ");