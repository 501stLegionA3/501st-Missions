 //Adds Changes Spec ops to black
 //Created by Rexi 20/04/2018
  {
    if ((typeOf _x) in ["O_Protagonist_VR_F"]) then {
            

	_x setobjecttextureglobal [0,"optre_vehicles\cart\data\truck_01_ext_01_co.paa"]; 
	_x setobjecttextureglobal [1,"optre_vehicles\falcon\data\Falcon_Hull_Night_co.paa"]; 
	_x setobjecttextureglobal [2,"optre_vehicles\cart\data\truck_01_ext_01_co.paa"];   
    };
    } forEach allUnits;
	
	hintSilent "Existing B1 CAMO droids have been changed to Forest Camo";
	
	
	
