  

  
  
  params ["_vic"];
  
  for [{_i=0}, {_i<10}, {_i=_i+1}] do
{
	//left
   _frag_grenade = createvehicle ["smokeshellred",((_vic ) getPos [0, (direction (_vic ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
   _frag_grenade attachTo [_vic  ,[-8.8,-.5,-1]];
  
  
  
	//right
    _frag_grenade = createvehicle ["smokeshell",((_vic  ) getPos [0, (direction (_vic ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
   _frag_grenade attachTo [_vic  ,[8.8,-.5,-1]];
	
	
	//center
	_frag_grenade = createvehicle ["smokeshellblue",((_vic  ) getPos [0, (direction (_vic ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
    _frag_grenade attachTo [_vic  ,[0.0,-4,-1]];
};
  
  


  

  
  

  


