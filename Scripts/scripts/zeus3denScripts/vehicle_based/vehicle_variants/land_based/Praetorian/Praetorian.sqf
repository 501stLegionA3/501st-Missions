  //Script to change praetorians 
  //Created by Rexi 20/04/2018
	{
	    if ((typeOf _x) in ["B_AAA_System_01_F"]) then {
			_x removeweapon "weapon_Cannon_Phalanx";
		  	_x addWeaponTurret ["Cannon_Geon", [0]];
			for [{_i=0}, {_i<5}, {_i=_i+1}] do
			{
				_x addMagazineTurret ["1000Rnd_Cannon_GeonF",[0]];
			};
		  
			_x  setskill ["spotDistance",100]; 
			_x  setskill ["spotTime",100]; 
			_x  setskill ["reloadSpeed",0];
			_x  setobjecttextureglobal [1,"awing\t_awing_03_cw.paa"];
			_x  setobjecttextureglobal [0,"awing\t_awing_03_cw.paa"]; 
		
		
		};    
    } forEach vehicles;
	
	hintSilent "Existing Praetorians have been switch to Star Wars CIS";

	
