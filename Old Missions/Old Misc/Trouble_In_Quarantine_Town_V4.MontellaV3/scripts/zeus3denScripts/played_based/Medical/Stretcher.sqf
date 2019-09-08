// created by Rexi screw other units we are the only ones with a working stretcher.
Medicalbox=
	{
params["_obj"];
	_obj addAction ["<t color='#00FF00'>Pickup Stretcher Beacon</t>", {

	params["_this","_user"];
		
	_user addAction ["<t color='#00FF00'>Call for Medivac droid</t>", {
	params["_obj"];
	
	_veh = "B_Quadbike_01_F" createVehicle position player;
	[_veh] remoteExecCall ["disableCollisionWith", 0, player];
	_veh lockDriver true;
	_veh allowdamage false;
	 clearItemCargoGlobal _veh;
	[_veh,[0,""]] remoteExec ["setObjectTexture",0];
	[_veh,[1,""]] remoteExec ["setObjectTexture",0];
	_veh3 = "cwa_Stretcher" createVehicle position player;
	_veh2 =  "SWOP_Rebel_Dio_Droid" createVehicle position player;
	[_veh2] remoteExecCall ["disableCollisionWith", 0, player];
	_veh2 enableSimulation false;
	_veh attachTo [_veh2, [0,0.45,0.2] ]; 
		 _veh setdir 180;
	_veh3 attachTo [_veh2, [0,1.2,-0.4] ];

	_veh addAction ["<t color='#00FF00'>Become Stretcher Bearer</t>", {
	params["_this","_user"];
	_user addAction ["<t color='#0000FF'>Transport Mode</t>",{
	_vex= nearestObject [player, "SWOP_Rebel_Dio_Droid"];
	_vex attachTo [player, [0,3,0.5],"Pelvis"]; 
	_vex setdir 180;
	},[1],0,false,true,"","_target == _this"];
	
	
	_user addAction ["<t color='#0000FF'>Park</t>", {
	_stretcher = nearestObject [player, "SWOP_Rebel_Dio_Droid"];
	detach _stretcher; 
	},[1],0,false,true,"","_target == _this"];	
	}];
			
	_veh  addAction ["<t color='#0000FF'>Repack Stretcher</t>",
	{
	params["_obj"];
	_delobj1 = nearestObject [player, "B_Quadbike_01_F"];
	deleteVehicle _delobj1;
	

	_delobj2 = nearestObject [player, "cwa_Stretcher"];
	deleteVehicle _delobj2;
	
	_delobj3 = nearestObject [player, "SWOP_Rebel_Dio_Droid"];
	deleteVehicle _delobj3;
	}];
	},[1],0,false,true,"","_target == _this"];
	
	

	
		}];
	};	
["medammobox", "init",medicalbox, true, [], true] call CBA_fnc_addClassEventHandler; 

	