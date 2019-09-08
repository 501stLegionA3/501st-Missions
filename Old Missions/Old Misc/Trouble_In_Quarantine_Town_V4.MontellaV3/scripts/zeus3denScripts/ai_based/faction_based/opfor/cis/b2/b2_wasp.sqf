 //Adds Changes B2 to wasp
 //Created by Peterson 01/01/2019
  {
    if ((typeOf _x) in [ "SWOP_CIS_superdroid_B2"]) then {

	_x setobjecttextureglobal [0,"A3\air_f\Heli_Light_01\data\skins\Heli_Light_01_ext_wasp_co.paa"];	
	_x setobjecttextureglobal [1,"A3\air_f\Heli_Light_01\data\skins\Heli_Light_01_ext_wasp_co.paa"];
	_x setobjecttextureglobal [2,"A3\air_f\Heli_Light_01\data\skins\Heli_Light_01_ext_wasp_co.paa"];
	
    };
    }	forEach allUnits;
	hintSilent "Existing B2 droids have been changed to Wasp";
	
	 
	
