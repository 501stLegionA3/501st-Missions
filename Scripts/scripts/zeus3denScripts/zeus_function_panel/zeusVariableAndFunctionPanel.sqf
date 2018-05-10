// Zeus control panel by Nam and Rexi
namZeusPanelHermes={
	params["_objToPlacePanelsOn"];
	
	
	//makes him handcuffed
		([_objToPlacePanelsOn,true] call ace_captives_fnc_setHandcuffed);
	
		removeGoggles _objToPlacePanelsOn;
		_objToPlacePanelsOn AddUniform "SWOP_CloneOf_red_F_CombatUniform";
		_objToPlacePanelsOn Addheadgear "SWOP_Cloneofficer_capR";
		_objToPlacePanelsOn allowdamage false;

		//Westworld Meme
		_objToPlacePanelsOn addAction ["<t color='#A020F0'> Whats this scroll wheel about ??  </t>", 
		{
		hint "Doesn'T Look Like Anything To Me";
		},[1],0,false,true,"","_target == _this"];//end	
		_objToPlacePanelsOn addAction ["<t color='#00FF00'>Receive Hermes Blessing</t>", {
		params["_this","_user"];

	//Hermes Control Panel
		_user addAction ["<t color='#A020F0'> Hermes Control Panel</t>", 
		{
		hint "REeeE-CC Euler    Euler stop ReeEeEing--CC Angel Angle 2k18";
		},[1],0,false,true,"","_target == _this"];//end
	
	//Help Command
		_user addAction ["<t color='#07FC0E'>Help</t>", 
		{
		hint "Actions below only work on existing vehicles/objects/infantry any vehicles/objects/infantry spawned after the action will be default";
		},[1],0,false,true,"","_target == _this"];//end
	
	//Spacer
		_user addAction ["<t color='#A020F0'> ---Zeus Vehicles-----</t>", 
		{
		},[1],0,false,true,"","_target == _this"];//end
	
	//Removes AAT's AI Coxial turrets 
		_user  addAction ["<t color='#47FF1A'>Remove AAT AI Coxial Turret </t>",                
		{
		[] execVM (landBasedQuick+aatPath+aatCoax);
		},[1],0,false,true,"","_target == _this"];//end
	

	
	//Makes spawned AAT's Blue and gray
		_user  addAction ["<t color='#073BFC'>Make Spawned AAT's Blue Variant</t>",                
		{
		[] execVM(landBasedQuick+aatPath+aatRetext);
		},[1],0,false,true,"","_target == _this"];//end
		
	
	//Converts Praetorian to star wars
		_user addAction ["<t color='#47FF1A'>Converts Praetorian to star wars (CIS Colours)</t>",                
		{
		[] execVM (landBasedQuick+praetorianPath+praetorian);
		},[1],0,false,true,"","_target == _this"];//end
		
	//Seriously buffs the Homing Spider Droids with Titan AA missles and Rebel Laser Gun removes standard guns
		_user addAction ["<t color='#47FF1A'>Add AA Missles + better gun to Spider Droids </t>",                
		{
		[] execVM (landBasedQuick+homingSpiderDroidPath+homingspiderdroid);
		},[1],0,false,true,"","_target == _this"];//end

	//Spacer
		_user addAction ["<t color='#A020F0'> ---Zeus Infantry-----</t>", 
		{
		},[1],0,false,true,"","_target == _this"];//end
	
	
	//Switch camo droids to Snow
		_user  addAction ["<t color='#FFFFFF'>Switch B1 CAMO droids to Snow Camo</t>",                
		{
		[] execVM (b1Quick+b1Snow);	
		},[1],0,false,true,"","_target == _this"];//end

		
	//Switch camo droids to Forest
		_user  addAction ["<t color='#1E8E00'>Switch B1 CAMO droids to Forest Camo</t>",                
		{
		[] execVM (b1Quick+b1Forest);	
		},[1],0,false,true,"","_target == _this"];//end

	
	
	//Switch B1 Secondary to AA
		_user  addAction ["<t color='#073BFC'>Switch B1 Secondary to AA</t>",                
		{
		[] execVM (b1Quick+b1AA);	
		},[1],0,false,true,"","_target == _this"];//end
/*   - Disabled for debugging
	//Activate Phantom Protocol
		_user  addAction ["<t color='#073BFC'>Activate Phantom Protocol</t>",                
		{
		[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\Magma\Phantom.sqf";	
		},[1],0,false,true,"","_target == _this"];//end
*/
	//Spacer
		_user addAction ["<t color='#A020F0'> ---Players-----</t>", 
		{
		},[1],0,false,true,"","_target == _this"];//end
	
	//Removes Thermals from players
		_user  addAction ["<t color='#D1021E'>Removes Thermals from players</t>",                
		{
		[] execVM (playedBasedItemsQuick+removeThermal);
		},[1],0,false,true,"","_target == _this"];//end
	
	//Adds Thermals back to players
		_user  addAction ["<t color='#0BD102'>Adds Thermals back to players</t>",                
		{
		[] execVM (playedBasedItemsQuick+addThermal);
		},[1],0,false,true,"","_target == _this"];//end
		
	//Removes maps and GPS' from players
		_user  addAction ["<t color='#D1021E'>Removes maps and gps' from players</t>",                
		{
		[] execVM (playedBasedItemsQuick+removeMapGPS);
		},[1],0,false,true,"","_target == _this"];//end	
	
	//Adds maps and GPS' back to players
		_user  addAction ["<t color='#0BD102'>Add maps and gps' back to players</t>",                
		{
		[] execVM (playedBasedItemsQuick+addMapGPS);
		},[1],0,false,true,"","_target == _this"];//end	
	
	//remove NVGS from troopers
		_user  addAction ["<t color='#D1021E'>Remove NVGS from troopers</t>",                
		{
		[] execVM (playedBasedItemsQuick+removeNVG);
		},[1],0,false,true,"","_target == _this"];//end	

	//Adds nvgs back
		_user  addAction ["<t color='#0BD102'>Add NVGS to troopers</t>",                
		{
		[] execVM (playedBasedItemsQuick+addNVG);
		},[1],0,false,true,"","_target == _this"];//end	
		
	"thunder_1" remoteExec ["playSound"];"thunder_1" remoteExec ["playSound"];
	
	[_user,format["%1 Has received the blessing of Hermes %2 (Additional Zeus powers activated)",(name _user),time]] remoteExec ["sideChat", 0];
	"Hermes has a message for you! Having FPS problems mid op?  try 'Shift+numpadminus then type 'Flush'' will help in some circumstances!" remoteExec ["hint", -2]; 
	deleteVehicle _this select 0;
	}];
};



["B_Protagonist_VR_F", "init",namZeusPanelHermes, true, [], true] call CBA_fnc_addClassEventHandler; 



