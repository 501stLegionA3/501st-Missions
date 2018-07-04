  

  
  

	params ["_vic"];
  
	_namLeftSmoke="smokeshellpurple";
	_namRightSmoke="SmokeShellpurple";
  
  
	 for [{_i=0}, {_i<1}, {_i=_i+1}] do
	{
		//left
	   _frag_grenade = createvehicle [_namLeftSmoke,((_vic ) getPos [0, (direction (_vic ))]) ,[],0,"none"]; 
	   
		comment "side,forward,up";
		_frag_grenade attachTo [_vic ,[-6,-14+_i/50,-1.2]];
	  
		//right
		_frag_grenade = createvehicle [_namRightSmoke,((_vic  ) getPos [0, (direction (_vic))]) ,[],0,"none"]; 
	   
	   comment "side,forward,up";
		_frag_grenade attachTo [_vic ,[6,-14+_i/50,-1.2]];
		
		
		
		//center
		_frag_grenade = createvehicle [_namRightSmoke,((_vic  ) getPos [0, (direction (_vic))]) ,[],0,"none"]; 
	   
	   comment "side,forward,up";
		_frag_grenade attachTo [_vic ,[0,-6+_i/50,-1.2]];
	};
  
  
  
  




