weaponsList=[
["magazine_Missile_rim116_x21","weapon_rim116Launcher",2,[-1,0,1]],
["4Rnd_LG_Jian","missiles_Jian",1,[-1,0,1]],
["ConMisarc_mag","conmis_arc",1,[-1]],
["Laserbatteries","Laserdesignator_pilotCamera",1,[-1,0,1]],
["400Rnd_Pomehi_Mag","PomehiLauncherXT",10,[-1,0,1]],
["10Rnd_FAST_Cannon_TIE","Cannon_TIE_FAST",100,[1]],
["SmokeLauncherMag","SmokeLauncher",10,[-1,0,1]],
["300Rnd_CMFlare_Chaff_Magazine","CMFlareLauncher",10,[-1,0,1]]
];

for [{_i=0}, {_i<(count weaponsList)}, {_i=_i+1}] do
{
itemList = (weaponsList select _i);
itemWeap= (itemList select 1);
itemMag= (itemList select 0);
itemCount= (itemList select 2);
itemSeat= (itemList select 3);

for [{_j=0}, {_j<itemCount}, {_j=_j+1}] do
{

for  [{_k=0}, {_k<(count itemSeat)}, {_k=_k+1}] do
{
_this addMagazineTurret [itemMag ,[itemSeat select _k]];  
_this addWeaponTurret[itemWeap, [itemSeat select _k]];
};
};

};


_this  addAction ["<t color='#FFFF00'>GET OUT OF VIC------------- U11</t>",
{

(vehicle (_this select 0)) setVehicleLock "UNLOCKED";
(vehicle (_this select 0)) vehicleChat "UNLOCKED";

params["_this","_user"];
moveOut _user ;
},[1],0,false,true,"User12"];




comment "Increment Throttle";
_this  addAction ["<t color='#0000FF'>Increment Throttle--------U16</t>",
{
(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))+.01);

},[1],0,false,true,"User16"];

comment "Decrement Throttle";
_this  addAction ["<t color='#FF0000'>Decrement Throttle--------U17</t>",
{
(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))-0.01);	

},[1],0,false,true,"User17"];



