  

  
  
  
  _this  addAction ["<t color='#886688'>Smoker--------U13</t>",
{
  

  
  for [{_i=0}, {_i<1}, {_i=_i+1}] do
{
   _frag_grenade = createvehicle ["smokeshellpurple",((_this select 0 ) getPos [0, (direction (_this  select 0 ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
_frag_grenade attachTo [_this  select 0 ,[-8,-1.8+_i/50,-1.8]];
  
  
     _frag_grenade = createvehicle ["smokeshellblue",((_this select 0  ) getPos [0, (direction (_this  select 0 ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
_frag_grenade attachTo [_this  select 0 ,[8,-1.8+_i/50,-1.8]];
};
  
  


  

  
  

  
  },[1],0,false,true,"User13"," driver  _target == _this"];




