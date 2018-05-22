	
//"add Flare Mortar Script to the CSAT mortar";
	OpforMort={
	params["_vic"];
	
	_vic addEventHandler ["Fired",{private ["_al_flare"]; 

	_al_flare = _this select 6;[[[_al_flare],"scripts\zeus3denScripts\vehicleBased\vehicleVariants\landbased\Mortar\Opfor\Flare_opfor.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	}];		

	comment "retexture mortar";
	_vic setobjecttextureglobal [0,"optre_vehicles\hev\data\pod_CO.paa"]

	};//end of CSAT Mortar call




// "add Flare Mortar Script to the NATO mortar";
	BlueforMort={
	params["_vic"];
	
	_vic addEventHandler ["Fired",{private ["_al_flare"]; 

	_al_flare = _this select 6;[[[_al_flare],"scripts\zeus3denScripts\vehicleBased\vehicleVariants\landbased\Mortar\Bluefor\Flare_bluefor.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	}];		
 
	comment "retexture mortar";
	_vic setobjecttextureglobal [0,"LAAT\textures\gunship_2_d.paa"]; 

	};//end of Nato Mortar call

	
	
	["B_Mortar_01_F", "init",BlueforMort, true, [], true] call CBA_fnc_addClassEventHandler; 
	["O_Mortar_01_F", "init",OpforMort, true, [], true] call CBA_fnc_addClassEventHandler; 
