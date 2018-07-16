	//Add ability to deploy mtt
mttv1={
	params["_vic"];
	_vic addWeaponTurret ["Cannon_ATAT", [0]];
	for [{_i=0}, {_i<75}, {_i=_i+1}] do
	{
	_vic addMagazineTurret ["2Rnd_Laser_Cannon_ATAT" ,[0]];
	};    
	
	_vic addWeaponTurret ["Cannon_ATAT", [0,0]];
	for [{_i=0}, {_i<75}, {_i=_i+1}] do
	{
	_vic addMagazineTurret ["2Rnd_Laser_Cannon_ATAT" ,	[0,0]];
	};    
	
	comment "Spawns droid";
	
	_vic   addAction ["<t color='#00FF00'>DEPLOY THE DROIDS</t>",
	{
	mttpos = _this select 0;

    [] execVM (landBasedQuick+mttPath+mttFnc);
	removeAllActions mttpos;
	},[1],0,false,true,""," commander  _target == _this "];
		
	};

	["o_swop_mtt_1", "init",mttv1, true, [], false] call CBA_fnc_addClassEventHandler; 
	
