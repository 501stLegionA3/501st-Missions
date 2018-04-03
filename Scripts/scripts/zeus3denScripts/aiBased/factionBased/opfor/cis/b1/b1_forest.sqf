 //Adds Changes B1 Camo to Snow 
  {
    if ((typeOf _x) in [ "SWOP_CIS_camo_droid_sergeant", "SWOP_CIS_camo_droid", "SWOP_CIS_camo_droid_sniper", "SWOP_CIS_camo_droid_AT"]) then {
            
	removeBackpack _x;
	_x addBackpack  "SWOP_B_Droid_geon_backpack";
	_x setobjecttextureglobal [0,"optre_unsc_units\army\data\uniform_a_digital_co.paa"]; 
	_x setobjecttextureglobal [1,"optre_unsc_units\army\data\uniform_a_digital_co.paa"]; 
	_x setobjecttextureglobal [2,"optre_unsc_units\army\data\uniform_a_digital_co.paa"];   
    };
    } forEach allUnits;
	
	hintSilent "Existing B1 CAMO droids have been changed to Forest Camo";
	
	
	


