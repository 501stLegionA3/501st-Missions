////////////////////////////////////////
//    Simple Vehicle Locking System   //
//         scripts\unlock.sqf         //
//          Sgt Justin [GCF]          //
////////////////////////////////////////

private ["_vehicle","_lockState","_nearvehicle"];
_nearvehicle = nearestObjects [player, ["Armored", "Car", "Support", "Submarine", "LandVehicle", "Ship", "Air"], 5];
_vehicle = _nearvehicle select 0;
_lockState = locked _vehicle;

if(_lockState == 1) then
	{
		//Lock the vehicle
		//_vehicle lock true;
		[_vehicle,true] remoteExec ["lock", _vehicle]; 
		
		//Lock the vehicles inventory
		//_vehicle lockCargo true;
		[_vehicle,true] remoteExec ["lockCargo", _vehicle]; 
		
		//Set a variable that describes that the vehicle is locked
		_vehicle setVariable ["objectLocked", true, true];
		
		//Turn off the vehicles engine
		_vehicle engineOn false;
		
		//Turn on the vehicles headlights
		Player action ["lightOn", _vehicle];
		
		//Wait 1/2 a second
		sleep 0.5;
		
		//Turn off the vehicles headlights
		player action ["lightOff", _vehicle];
		
		//Display a notification at the bottom of the screen
		titleText ["Vehicle Locked!","PLAIN DOWN"]; titleFadeOut 2;
	}
	else
	{
		//Unlock the vehicle
		//_vehicle lock false;
		[_vehicle,false] remoteExec ["lock", _vehicle]; 
		
		//Unlock the vehicles inventory
		//_vehicle lockCargo false;
		[_vehicle,false] remoteExec ["lockCargo", _vehicle]; 
		
		//Set a variable that describes that the vehicle is unlocked
		_vehicle setVariable ["objectLocked", false, true];
		
		//Turn off the vehicles engine
		_vehicle engineOn false;
		
		//Turn on the vehicles headlights
		Player action ["lightOn", _vehicle];
		
		//Wait 1/2 a second
		sleep 0.5;
		
		//Turn off the vehicles headlights
		player action ["lightOff", _vehicle];  
		
		//Display a notification at the bottom of the screen
		titleText ["Vehicle unlocked!","PLAIN DOWN"]; titleFadeOut 2;  
	};
	