// Zeus control panel by Nam and Rexi
namZeusPanelHermes={
	params["_objToPlacePanelsOn"];
	
	//makes him handcuffed
		([_objToPlacePanelsOn,true] call ace_captives_fnc_setHandcuffed);
	
		removeGoggles _objToPlacePanelsOn;
		_objToPlacePanelsOn AddUniform "SWOP_CloneOf_red_F_CombatUniform";
		_objToPlacePanelsOn Addheadgear "SWOP_Cloneofficer_capR";
		
		_toggleColor="<t color='#0000FF'>";
		_colorEnd="</t>";

	
	//Hermes Control Panel
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> Hermes Control Panel</t>", 
		{
		hint "REeeE-CC Euler    Euler stop ReeEeEing--CC Angel Angle 2k18";
		}];//end
	
	//Help Command
		_objToPlacePanelsOn addAction ["<t color='#07FC0E'>Help</t>", 
		{
		hint "Actions below only work on existing vehicles/objects/infantry any vehicles/objects/infantry spawned after the action will be default";
		}];//end
	
	//Spacer
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> ---Zeus Vehicles-----</t>", 
		{
		}];//end
	
	//Removes AAT's AI Coxial turrets 
		_objToPlacePanelsOn  addAction ["<t color='#47FF1A'>Remove AAT AI Coxial Turret </t>",                
		{
		[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\AAT\aat_coxial_r.sqf";
		}];//end

	
	//Makes spawned AAT's Blue and gray
		_objToPlacePanelsOn  addAction ["<t color='#073BFC'>Make Spawned AAT's Blue Variant</t>",                
		{
		[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\AAT\aat_retext_b.sqf";
		}];//end
		
		
	//Seriously buffs the Homing Spider Droids with Titan AA missles and Rebel Laser Gun removes standard guns
		_objToPlacePanelsOn addAction ["<t color='#47FF1A'>Add AA Missles + better gun to Spider Droids </t>",                
		{
		[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\HSD\spiderdroid_buff.sqf";
		}];//end

	//Spacer
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> ---Zeus Infantry-----</t>", 
		{
		}];//end
	
	
	//Switch camo droids to Snow
		_objToPlacePanelsOn  addAction ["<t color='#FFFFFF'>Switch B1 CAMO droids to Snow Camo</t>",                
		{
		[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1_snow.sqf";	
		}];//end

		
	//Switch camo droids to Forest
		_objToPlacePanelsOn  addAction ["<t color='#1E8E00'>Switch B1 CAMO droids to Forest Camo</t>",                
		{
		[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1_forest.sqf";	
		}];//end

	
	
	//Switch B1 Secondary to AA
		_objToPlacePanelsOn  addAction ["<t color='#073BFC'>Switch B1 Secondary to AA</t>",                
		{
		[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1at_aa.sqf";	
		}];//end

	
	//Switch B1 Secondary to AT (RPG)
		_objToPlacePanelsOn  addAction ["<t color='#073BFC'>Switch B1 Secondary to RPG</t>",                
		{
		[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b1\b1at_at.sqf";
		}];//end

	//Spacer
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> ---Players-----</t>", 
		{
		}];//end
	
	//Removes Thermals from players
		_objToPlacePanelsOn  addAction ["<t color='#D1021E'>Removes Thermals from players</t>",                
		{
		[] execVM "scripts\zeus3denScripts\playerBased\Items\Thermal_R.sqf";
		}];//end
	
	//Adds Thermals back to players
		_objToPlacePanelsOn  addAction ["<t color='#0BD102'>Adds Thermals back to players</t>",                
		{
		[] execVM "scripts\zeus3denScripts\playerBased\Items\Thermal_A.sqf";
		}];//end
		
	//Removes maps and GPS' from players
		_objToPlacePanelsOn  addAction ["<t color='#D1021E'>Removes maps and gps' from players</t>",                
		{
		[] execVM "scripts\zeus3denScripts\playerBased\Items\Map_GPS_R.sqf";
		}];//end		
	
	//Adds maps and GPS' back to players
		_objToPlacePanelsOn  addAction ["<t color='#0BD102'>Add maps and gps' back to players</t>",                
		{
		[] execVM "scripts\zeus3denScripts\playerBased\Items\Map_GPS_A.sqf";
		}];//end		
	
	//remove NVGS from troopers
		_objToPlacePanelsOn  addAction ["<t color='#D1021E'>Remove NVGS from troopers</t>",                
		{
		[] execVM "scripts\zeus3denScripts\playerBased\Items\NVG_R.sqf";
		}];//end		
	
};



["B_Protagonist_VR_F", "init",namZeusPanelHermes, true, [], true] call CBA_fnc_addClassEventHandler; 



