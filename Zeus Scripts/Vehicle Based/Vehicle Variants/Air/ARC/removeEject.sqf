
_this addEventHandler ["GetIn",{
(vehicle (_this select 0)) setVehicleLock "LOCKED";
(vehicle (_this select 0)) vehicleChat "LOCKED";
}];


_this  addAction ["<t color='#FF0000'>LOCK--------U14</t>",
{


(vehicle (_this select 0)) setVehicleLock "LOCKED";
(vehicle (_this select 0)) vehicleChat "LOCKED";


},[1],0,false,true,"User14"," driver  _target == _this"];


_this  addAction ["<t color='#00FF00'>UNLOCK--------U15</t>",
{


(vehicle (_this select 0)) setVehicleLock "UNLOCKED";
(vehicle (_this select 0)) vehicleChat "UNLOCKED";

},[1],0,false,true,"User15"];