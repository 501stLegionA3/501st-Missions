//created by Rexi
DSD={
	params["_obj"];
	_obj addAction ["<t color='#00FF00'>Convert to moveable</t>", {
    Dspawner = _this select 0;
    [Dspawner] execVM ((missionNamespace getVariable ["_cisQuick",""])+(missionNamespace getVariable ["_dwarfSpiderDroidPath",""])+(missionNamespace getVariable ["_dwarfDriver",""]));
	removeallactions dspawner
	},[1],0,false,true,""," gunner  _target == _this "];
};

["SpiderDSD", "init",DSD, true, [], false] call CBA_fnc_addClassEventHandler; 


