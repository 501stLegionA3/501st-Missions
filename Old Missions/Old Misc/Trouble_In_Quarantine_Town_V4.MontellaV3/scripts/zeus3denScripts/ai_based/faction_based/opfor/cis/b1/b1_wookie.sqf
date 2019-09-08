//Adds Changes B1 to wookie
//Created by Peterson 01/01/2019
  {
    if ((typeOf _x) in [ "SWOP_CIS_droid", "SWOP_CIS_droid_sergeant", "SWOP_CIS_droid_sniper", "SWOP_CIS_droid_mg"]) then {

	removeBackpackGlobal _x;
	_x addBackpackGlobal  "RD501_Spec_Droid_backpack";
	
	
	_x setobjecttextureglobal [0,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];	
	_x setobjecttextureglobal [1,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];
	_x setobjecttextureglobal [2,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];
	
    };
    }	forEach allUnits;
	
	//Extra for AT Droid
	{
    if ((typeOf _x) in ["SWOP_CIS_droid_AT"]) then {
            
	removeBackpackGlobal _x;
	_x addBackpackGlobal  "RD501_Spec_Droid_backpack";
	
	for [{_i=0}, {_i<3}, {_i=_i+1}] do			/*Adds HE and HEAT Missiles*/
	{
	_x addItemToBackpack "MRAWS_HE_F";
	_x addItemToBackpack "MRAWS_HEAT_F";
	};
	
	_x setobjecttextureglobal [0,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];	
	_x setobjecttextureglobal [1,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];
	_x setobjecttextureglobal [2,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];
	
    };
    }	forEach allUnits;
	
	//Extra for AA Droid
	{
    if ((typeOf _x) in ["RD501_droid_AA"]) then {
            
	removeBackpackGlobal _x;
	_x addBackpackGlobal  "RD501_Spec_Droid_backpack";

	
	for [{_i=0}, {_i<4}, {_i=_i+1}] do			/*Adds Titan_AA Missiles*/
	{
	_x addItemToBackpack "Titan_AA";
	};
	
	_x setobjecttextureglobal [0,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];	
	_x setobjecttextureglobal [1,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];
	_x setobjecttextureglobal [2,"OPTRE_Vehicles\Pelican\data\PelicanExterior_green_co.paa"];
	
    };
	
    }	forEach allUnits;
	
	hintSilent "Existing B1 droids have been changed to Wookie";
	
	 
	



