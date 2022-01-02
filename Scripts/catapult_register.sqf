params ["_pad", "_disp"];

if (isNil "global_catapults") then {
	global_catapults = createHashMap;
	publicVariable "global_catapults";
};

item_list = global_catapults getOrDefault ["catapults", []];
item_list append [[_pad, _disp]];
global_catapults set ["catapults", item_list];