 //Adds Changes B1 Camo to Snow 
 //Created by Rexi 20/04/2018,  modified by Peterson 31/12/2018
{
    if ((typeOf _x) in [ "SWOP_CIS_camo_droid_sergeant", "SWOP_CIS_camo_droid", "SWOP_CIS_camo_droid_sniper","SWOP_CIS_camo_droid_com"]) then {
            
	removeBackpackGlobal _x;
	_x addBackpackGlobal  "RD501_Spec_Droid_backpack";
	
	_x setobjecttextureglobal [0,"OPTRE_Vehicles\Warthog\data\warthog_addons_CO.paa"]; 
	_x setobjecttextureglobal [1,"OPTRE_Vehicles\Warthog\data\warthog_addons_CO.paa"]; 
	_x setobjecttextureglobal [2,"OPTRE_Vehicles\Warthog\data\warthog_addons_CO.paa"];
    };
} forEach allUnits;
//Extra for AT 
{
    if ((typeOf _x) in ["SWOP_CIS_camo_droid_AT"]) then {
            
	removeBackpackGlobal _x;		//removes Backpack so its no longer dropped
	_x addBackpackGlobal  "RD501_Spec_Droid_backpack";		//Adds new backpack, its darker so it fits better
	
	
	for [{_i=0}, {_i<3}, {_i=_i+1}] do			/*Adds HE and HEAT Missiles*/
	{
	_x addItemToBackpack "MRAWS_HE_F";
	_x addItemToBackpack "MRAWS_HEAT_F";
	};
	
	_x setobjecttextureglobal [0,"OPTRE_Vehicles\Warthog\data\warthog_addons_CO.paa"]; 		//Changes Skin
	_x setobjecttextureglobal [1,"OPTRE_Vehicles\Warthog\data\warthog_addons_CO.paa"]; 
	_x setobjecttextureglobal [2,"OPTRE_Vehicles\Warthog\data\warthog_addons_CO.paa"];
    };
} forEach allUnits;
	

	hintSilent "Existing B1 CAMO droids have been changed to Forest Camo";