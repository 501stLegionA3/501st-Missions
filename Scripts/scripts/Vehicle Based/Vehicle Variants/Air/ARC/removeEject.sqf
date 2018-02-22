
_this addEventHandler ["GetIn",{
(vehicle (_this select 0)) setVehicleLock "LOCKED";
(vehicle (_this select 0)) vehicleChat "LOCKED";
}];
