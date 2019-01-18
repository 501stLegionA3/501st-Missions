
//delets body on death
Player addEventHandler ["GetInMan", {
_x addMPEventHandler ["MPkilled",{deleteVehicle (_this select 0);}];

}];
	
Player addEventHandler ["GetOutMan", {
_x removeAllMPEventHandlers "MPKILLED";

}];

player enableFatigue False;  
player addEventHandler ["Respawn", {player enableFatigue false}];
