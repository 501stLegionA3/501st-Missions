// Zeus control panel by Nam and Rexi Hermes evil counterpart !
namZeusPanelHades={
	params["_objToPlacePanelsOn"];
	 
  
	//makes him handcuffed
		([_objToPlacePanelsOn,true] call ace_captives_fnc_setHandcuffed);
	
		removeGoggles _objToPlacePanelsOn;
		_objToPlacePanelsOn AddUniform  "SWOP_Reb_f_cape_kaleesh_CombatUniform";
		_objToPlacePanelsOn allowdamage false;

	//Hermes Control Panel
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> Hades Control Panel</t>", 
		{
		hint "REeeE-CC Euler    Euler stop ReeEeEing--CC Angel Angle 2k18";
		}];
	
	//Help Command
		_objToPlacePanelsOn addAction ["<t color='#A020F0'>Help</t>", 
		{
		hint "Hades is an opfor special unit spawner! Make sure you are invisible when spawning from Hades,though I cant make you do it because I'm just a script :(  "
		}];
		
	//Spacer
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> ---Infantry-----</t>", 
		{
		}];
	
	//Spawns test group
		_objToPlacePanelsOn  addAction ["<t color='#47FF1A'>Placeholder </t>",                

		{
				}];//end


	};



["O_Protagonist_VR_F", "init",namZeusPanelHades, true, [], true] call CBA_fnc_addClassEventHandler; 



