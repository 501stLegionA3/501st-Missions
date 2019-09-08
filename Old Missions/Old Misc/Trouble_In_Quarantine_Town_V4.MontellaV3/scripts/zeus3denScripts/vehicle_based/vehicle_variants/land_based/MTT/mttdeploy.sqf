	//Add ability to deploy mtt
mttv1={
	params["_vic"];

	comment "Spawns droid";
	
	_vic   addAction ["<t color='#00FF00'>DEPLOY THE DROIDS</t>",
	{
	mttpos = _this select 0;

    [] execVM (landBasedQuick+mttPath+mttFnc);
	removeAllActions mttpos;
	},[1],0,false,true,""," commander  _target == _this "];
		
	};

	["o_swop_mtt_1", "init",mttv1, true, [], false] call CBA_fnc_addClassEventHandler; 
	
