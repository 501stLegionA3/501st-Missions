mttpos setfuel 0;
hintsilent "deploying droids";
_handle = [] spawn {
mttopen = "Swop_mtt_static" createVehicle [0,0,0];  
[mttopen , true] remoteExec ["hideObjectglobal", 0];
	sleep 4;
	mttopen attachTo [mttpos,[0,0,0]];  
	mttopen setdir 180;
	sleep 6;
	[mttopen , false] remoteExec ["hideObjectglobal", 0];
	sleep 0.5;
	mttpos setobjecttextureglobal [0,""]; 
	mttpos setobjecttextureglobal [1,""]; 
	mttpos removeWeaponTurret ["Cannon_ATAT" ,[0]];  
	mttpos removeWeaponTurret["Cannon_MTT_mc", [0]];
	mttpos removeWeaponTurret["Cannon_MTT_mc2", [0,0]];
	mttpos removeWeaponTurret["Cannon_ATAT", [0,0]];
	};



