  

  
  params ["_vic"];

  
  for [{_i=0}, {_i<1}, {_i=_i+1}] do
{
   _frag_grenade = createvehicle ["smokeshellpurple",((_vic ) getPos [0, (direction (_vic ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
_frag_grenade attachTo [_vic ,[-8,-1.8+_i/50,-1.8]];
  
  
     _frag_grenade = createvehicle ["smokeshellblue",((_vic  ) getPos [0, (direction (_vic))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
_frag_grenade attachTo [_vic ,[8,-1.8+_i/50,-1.8]];
};
  





