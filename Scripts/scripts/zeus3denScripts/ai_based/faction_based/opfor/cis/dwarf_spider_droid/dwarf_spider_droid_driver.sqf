// Created by Rexi to make things move
	 params["_vic"];
	_group = createGroup east;
	aidrive = _group createUnit ["O_Soldier_VR_F", position _vic, [], 0, "FORM"];
	_vic attachTo [aidrive,[0,-0.3,1.45]];
	aidrive AddUniform "SWOP_tacticdroid_black_F_spec";
	aidrive setUnitPos "down";
	aidrive setBehaviour "CARELESS";
	[aidrive, true] remoteExec ["hideObjectGlobal", 0];
	