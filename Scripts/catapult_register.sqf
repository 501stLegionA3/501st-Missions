params ["_pad", "_disp"];

if (isNil "SVLN_CTPL_global_catapults") then {
	SVLN_CTPL_global_catapults = createHashMap;
	publicVariable "SVLN_CTPL_global_catapults";
};

item_list = SVLN_CTPL_global_catapults getOrDefault ["catapults", []];
item_list append [[_pad, _disp]];
SVLN_CTPL_global_catapults set ["catapults", item_list];