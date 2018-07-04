 //Adds Changes B1 Camo to Snow 
 //Created by Rexi 20/04/2018
  {
    if ((typeOf _x) in [ "SWOP_CIS_camo_droid_sergeant", "SWOP_CIS_camo_droid", "SWOP_CIS_camo_droid_sniper", "SWOP_CIS_camo_droid_AT"]) then {
            
	_x addBackpackglobal   "SWOP_B_Droid_heavy_backpack";;
	_x setobjecttextureglobal [0,"optre_vehicles\warthog\data\warthog_addons_snow_co.paa"]; 
	_x setobjecttextureglobal [1,"optre_unsc_units\army\data\uniform_a_snow_co.paa"]; 
	_x setobjecttextureglobal [2,"optre_unsc_units\army\data\uniform_a_snow_co.paa"];       
    };
    } forEach allUnits;
	
	hintSilent "Existing B1 CAMO droids have been changed to Snow Camo";
	
	
	


