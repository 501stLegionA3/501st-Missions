//created by Rexi
DSD={
	params["_obj"];
	_obj addAction ["<t color='#00FF00'>Convert to moveable</t>", {
    Dspawner = _this select 0;
    [Dspawner] execVM "scripts\zeus3denScripts\ai_based\faction_based\opfor\cis\dwarf_spider_droid\dsd_driver.sqf";
	removeallactions dspawner
	},[1],0,false,true,""," gunner  _target == _this "];
};

["SpiderDSD", "init",DSD, true, [], false] call CBA_fnc_addClassEventHandler; 
