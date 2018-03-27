// Zeus control panel by Nam and Rexi
namZeusPanelHermes=
{
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
		hint "REeeE-CC Euler    Euler stop ReeEeEing--CC Angel Angle 2k18"
	}];
	
	//Help Command
	_objToPlacePanelsOn addAction ["<t color='#A020F0'>Help</t>", 
	{
		hint "Actions below only work on existing vehicles any vehicles spawned after the action will be default"
	}];
	
	
	//Removes AAT's AI Coxial turrets 
	_objToPlacePanelsOn  addAction ["<t color='#47FF1A'>Remove AAT AI Coxial Turret </t>",                
	{
		{
		if ((typeOf _x) in ["O_SWOP_AAT_1"]) then {
				
		_x removeWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
		for [{_i=0}, {_i<3}, {_i=_i+1}] do
		{
		_x removeMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];

		};
			 
			};
		} forEach vehicles;
		
		hintSilent "Existing AATs have had Coaxial turret removed";
	
	}];//end

	//Makes spawned AAT's Blue and gray
	_objToPlacePanelsOn  addAction ["<t color='#47FF1A'>Make Spawned AAT's Blue Variant</t>",                
	{
		{
			if ((typeOf _x) in ["O_SWOP_AAT_1"]) then
			{
				_x setobjecttextureglobal [1,"awing\t_awing_03_cw.paa"];
				_x setobjecttextureglobal [0,"awing\t_awing_03_cw.paa"]; 
				 
			};
		} forEach vehicles;
		hintSilent format["Existing AAT's have had Colours changed to Blue"];
	}];//end
		
	//Seriously buffs the Homing Spider Droids with Titan AA missles and Rebel Laser Gun removes standard guns
	_objToPlacePanelsOn _this  addAction ["<t color='#47FF1A'>Add AA Missles + better gun to Spider Droids </t>",                
	{
		{
			if ((typeOf _x) in ["SpiderOG"]) then 
			{
				_x removeWeaponTurret ["missiles_titan", [0]];
				for [{_i=0}, {_i<5}, {_i=_i+1}] do
				{
					_x removeMagazineTurret ["4Rnd_Titan_long_missiles" ,[0]];
				};
				_x removeWeaponTurret ["Cannon_Antana", [0]];
				for [{_i=0}, {_i<3}, {_i=_i+1}] do
				{
					_x removeMagazineTurret ["1000Rnd_Laser_Cannon_Antana" ,[0]];
				}; 
					
				_x removeweapon "Cannon_Spiderdroidog9"
				
				_x addWeaponTurret ["missiles_titan", [0]];
				for [{_i=0}, {_i<5}, {_i=_i+1}] do
				{
					_x addMagazineTurret ["4Rnd_Titan_long_missiles" ,[0]];
				};
					_x addWeaponTurret ["Cannon_Antana", [0]];
				for [{_i=0}, {_i<3}, {_i=_i+1}] do
				{
					_x addMagazineTurret ["1000Rnd_Laser_Cannon_Antana" ,[0]];
				};    

					
			};
		} forEach vehicles;
	}];//end


};



["B_Protagonist_VR_F", "init",namZeusPanelHermes, true, [], true] call CBA_fnc_addClassEventHandler; 



