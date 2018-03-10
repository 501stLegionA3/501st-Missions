  

  
  

	params ["_vic"];
  
	_namLeftSmoke="smokeshellred";
	_namRightSmoke="SmokeShellGreen";
  
  
  
	  namVicType=typeOf _vic;

	if (namVicType isEqualTo "swop_LAAT") then
	{
		_namLeftSmoke="smokeshellYellow";
		_namRightSmoke="SmokeShellblue";
		namSmokePath="vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTipYwB.sqf";
	}
	else
	{
		if (namVicType isEqualTo "swop_LAATmk2") then
		{
			_namLeftSmoke="smokeshell";
			_namRightSmoke="SmokeShellblue";
			namSmokePath="vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTipWB.sqf";
		}
		else
		{
			if (namVicType isEqualTo "swop_LAATmk2_104") then
			{
				_namLeftSmoke="smokeshellYellow";
				_namRightSmoke="SmokeShellblue";
				namSmokePath="vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTipYwB.sqf";
			}
			else
			{
				if (namVicType isEqualTo "swop_LAATmk2_74") then
				{
					_namLeftSmoke="smokeshellYellow";
					_namRightSmoke="SmokeShellblue";
					namSmokePath="vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTipYwB.sqf"; 
				}
				else
				{
					if (namVicType isEqualTo "swop_LAATmk2_spec") then
					{
						_namLeftSmoke="smokeshellred";
						_namRightSmoke="SmokeShellblue";
						namSmokePath="vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTipRB.sqf";
					}
					else
					{
						if (namVicType isEqualTo "swop_LAATmk2_ARC") then
						{
							_namLeftSmoke="smokeshellblue";
							_namRightSmoke="SmokeShellblue";
							namSmokePath="vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTipBB.sqf"; 
						}
						else
						{
							
						};
					};
				};
			};
		};
	};
  
  
	 for [{_i=0}, {_i<1}, {_i=_i+1}] do
	{
		//left
	   _frag_grenade = createvehicle [_namLeftSmoke,((_vic ) getPos [0, (direction (_vic ))]) ,[],0,"none"]; 
	   
		comment "side,forward,up";
		_frag_grenade attachTo [_vic ,[-8,-1.8+_i/50,-1.8]];
	  
		//right
		_frag_grenade = createvehicle [_namRightSmoke,((_vic  ) getPos [0, (direction (_vic))]) ,[],0,"none"]; 
	   
	   comment "side,forward,up";
	_frag_grenade attachTo [_vic ,[8,-1.8+_i/50,-1.8]];
	};
  
  


  

  
  




