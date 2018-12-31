//Adds Changes B1 Camo to Snow 
//Created by Rexi 20/04/2018,  modified by Peterson 31/12/2018
{
    if ((typeOf _x) in [ "SWOP_CIS_camo_droid_sergeant", "SWOP_CIS_camo_droid", "SWOP_CIS_camo_droid_sniper","SWOP_CIS_camo_droid_com"]) then {
            
	removeBackpackGlobal _x;	//removes Backpack so its no longer dropped
	_x addBackpackGlobal  "SWOP_B_Droid_heavy_backpack";
	
	_x setobjecttextureglobal [0,"optre_vehicles\warthog\data\warthog_addons_snow_co.paa"]; 
	_x setobjecttextureglobal [1,"optre_unsc_units\army\data\uniform_a_snow_co.paa"]; 
	_x setobjecttextureglobal [2,"optre_unsc_units\army\data\uniform_a_snow_co.paa"];
    };
} forEach allUnits;

//Extra for AT 
{
    if ((typeOf _x) in ["SWOP_CIS_camo_droid_AT"]) then {
            
	removeBackpackGlobal _x;		//removes Backpack so its no longer dropped
	_x addBackpackGlobal  "SWOP_B_Droid_heavy_backpack";
	
	for [{_i=0}, {_i<3}, {_i=_i+1}] do			/*Adds HE and HEAT Missiles*/
	{
	_x addItemToBackpack "MRAWS_HE_F";
	_x addItemToBackpack "MRAWS_HEAT_F";
	};
	
	_x setobjecttextureglobal [0,"optre_vehicles\warthog\data\warthog_addons_snow_co.paa"]; 
	_x setobjecttextureglobal [1,"optre_unsc_units\army\data\uniform_a_snow_co.paa"]; 
	_x setobjecttextureglobal [2,"optre_unsc_units\army\data\uniform_a_snow_co.paa"];
    };
	
} forEach allUnits;
	

	hintSilent "Existing B1 CAMO droids have been changed to Snow Camo";