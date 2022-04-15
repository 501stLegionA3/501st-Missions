params ["_vic", "_disp"];

if (isNil "SVLN_VSPW_registered_vics") then {
	SVLN_VSPW_registered_vics = createHashMap;
	publicVariable "SVLN_VSPW_registered_vics";
};

item_list = SVLN_VSPW_registered_vics getOrDefault ["vics", []];
item_list append [[_vic, _disp]];
SVLN_VSPW_registered_vics set ["vics", item_list];

diag_log text (["[SVLN]", "[VIC SPAWNER]", "DEBUG:", "Registered Vic", _vic, "(", _disp, ")"] joinString " ");