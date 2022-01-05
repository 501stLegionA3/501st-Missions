// Pad Selection
lbClear 1515; 
if (!isNil 'global_catapults') then { 
	{ 
		lbAdd [1515, (_x select 1)];
	} forEach (global_catapults getOrDefault ['catapults', []]);
};

// Acceleration
ctrlSetText [1501, "30"];
// Speed
ctrlSetText [1502, "400"];
// Pitch
ctrlSetText [1503, "20"];
// Distance
ctrlSetText [1504, "500"];

// Hover
ctrlSetText [1511, "10"];
// Rotation
ctrlSetText [1512, "180"];
// Hover Cycles
ctrlSetText [1513, "40"];
// Sleep Timer
ctrlSetText [1514, "0.05"];