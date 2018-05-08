//Warden Ammo Box Created by Namenai - Updated by Rexi 21/04/2018

Warden=
	{
	params["_obj"];
	[_obj,[0,"optre_vehicles\longsword\data\LS_bay2_co.paa"]] remoteExec ["setObjectTexture",-2];
	_obj addAction ["<t color='#00FF00'>Become Aviation Warden</t>", {

	params["_this","_user"];
//LAAT
	_user  addAction ["<t color='#0000FF'>Resupply Low Altitude Assault Transport</t>",
	{
	[] execVM (resupplyBoxQuick+resupplyLaat);
	},[1],0,false,true,"","_target == _this"];

	
//ARC 170 - Resupply ARC 170 
		_user  addAction ["<t color='#0000FF'>Resupply ARC 170 Multi Role Fighter</t>",
	{
	[] execVM (resupplyBoxQuick+resupplyArc170);
	},[1],0,false,true,"","_target == _this"];

	
//V-WING --- Add Ammo Action for V-WING 
		_user  addAction ["<t color='#0000FF'>Resupply V-Wing Interceptor>",
	{
	[] execVM (resupplyBoxQuick+resupplyVwing);
	},[1],0,false,true,"","_target == _this"];
	
	
		
	
	
//Y-WING --- Add Ammo Action for Y-WING 
		_user  addAction ["<t color='#0000FF'>Resupply Y-Wing Bomber>",
	{
	[] execVM (resupplyBoxQuick+resupplyYwing);
	},[1],0,false,true,"","_target == _this"];
	
	


//Fuel --- Add Fuel
	_user  addAction ["<t color='#0320FF'>Resupply Fuel</t>",
	{
		if (player distance cursorTarget < 5) then 
	{
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;		
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
	
	cursorTarget setfuel 1;
	hintSilent "Refuelled vehicle";
	};
	},[1],0,false,true,"","_target == _this"];
					
[_user,format["%1 Has become a warden at time %2 (Unlimited resupplies for user)",(name _user),time]] remoteExec ["sideChat", 0];


	_user  addAction ["<t color='#0000FF'>Resupply Generic Vehicle</t>",
	{
		if (player distance cursorTarget < 5) then 
	{
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;		
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
	cursortarget setVehicleAmmo 1;
	hintSilent "Rearmed vehicle";
	};
	},[1],0,false,true,"","_target == _this"];

			
//Repair		
	_user  addAction ["<t color='#0000FF'>Do a field repair on vehicle</t>",
	{	
	_truck=cursortarget;
	if (vehicle player == player) then 
	{
	if (player distance _truck < 8) then 
	{
		if ("ToolKit" in items player) then 
			{
				if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
					{
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
							player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;		
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;		
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
						player playActionNow "stop";
						
						player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
							sleep 3;
					};
					
					sleep 3;
					player removeItem "ToolKit";
					
					_truck setdammage 0.15;

					hintSilent "Repaired vehicle";
			}			
		else
			{
				hintSilent "You need a toolkit to repair this vehicle!";
			};
	};
	
	};
	},[1],0,false,true,"","_target == _this"];

		
	},[1],0,false,true,""," driver  _target == _this "];

};


	["OPTRE_cart", "init",Warden, true, [], true] call CBA_fnc_addClassEventHandler; 