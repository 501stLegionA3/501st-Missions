  

  
  
  
  _this  addAction ["<t color='#886688'>Smoker--------U13</t>",
{
  

  
  for [{_i=0}, {_i<10}, {_i=_i+1}] do
{
   _frag_grenade = createvehicle ["smokeshell",((_this select 0 ) getPos [0, (direction (_this  select 0 ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
   _frag_grenade attachTo [_this select 0  ,[-8.8,-.5,-1]];
  
  
     _frag_grenade = createvehicle ["smokeshellblue",((_this select 0  ) getPos [0, (direction (_this  select 0 ))]) ,[],0,"none"]; 
   
   comment "side,forward,up";
    _frag_grenade attachTo [_this  select 0  ,[8.8,-.5,-1]];
};
  
  


  

  
  

  
  },[1],0,false,true,"User13"," driver  _target == _this"];

