barc={
	params["_vic"];
	comment "gets health";
	
	[_vic, 4] call ace_cargo_fnc_setSize;
	
};

["SW_BARC", "init",barc, true, [], true] call CBA_fnc_addClassEventHandler; 
