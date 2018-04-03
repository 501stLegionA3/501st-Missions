/*
(_this select 0) addEventHandler ["InventoryOpened", {
	
	namUnit=(_this select 0);
	_namBackPack=typeof(unitBackpack namUnit);
	_namIsConfigured=namUnit getVariable ["namJumpPackConfig", false];
	if(!_namIsConfigured && {_namBackPack isEqualTo "SWOP_B_CloneDV"}) then
	{
	
		[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpAssinger.sqf";
		[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpShort.sqf";
		[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpLong.sqf";
		[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpHandler.sqf";
		namUnit setVariable ["namJumpPackConfig", true, true];

		hint parseText  format["<t color='#40e0d0'>Namenai's Horseborne JumpScript Protocal has been initiated.(HJS Protocal) at time %1 </t> <img image='scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\horseborneImage.jpg' <img size='10' />",time];
	};
	
}];


(_this select 0) addMPEventHandler ["MPRespawn", {
namUnit=(_this select 0);
namUnit setVariable ["namJumpPackConfig", false, true];
}];
*/