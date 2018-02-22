weaponsList=[
["500Rnd_Cannon_ARCback","Cannon_ARCback",20,[-1,0]],
["c7_airedblaster_mag","c7_airedblaster",20,[-1,0]],
["2Rnd_Missile_AA_04_F","Missile_AA_04_Plane_CAS_01_F",3,[-1,0]],
["2Rnd_Missile_AA_04_F","Missile_AA_04_Plane_CAS_01_F",3,[0]],
["magazine_Missile_rim116_x21","weapon_rim116Launcher",1,[-1,0]],
["4Rnd_LG_Jian","missiles_Jian",14,[-1,0]],
["Mg7_proton_torpedo","Mg7_proton_torpedo_launcher",10,[-1,0]],
["PylonMissile_1Rnd_BombCluster_01_F","BombCluster_01_F",10,[-1,0]],
["4Rnd_Bomb_04_F","Bomb_04_Plane_CAS_01_F",10,[-1,0]],
["Laserbatteries","Laserdesignator_pilotCamera",1,[-1,0]],
["400Rnd_Pomehi_Mag","PomehiLauncherXT",10,[-1,0]]
];
 
for [{_i=0}, {_i<5}, {_i=_i+1}] do
{
_this removeMagazineTurret ["ProtonBombM" ,[-1]];  
_this removeWeaponTurret["ProtonBombW", [-1]];

_this removeMagazineTurret ["ProtonBombMCluster" ,[-1]];  
_this removeWeaponTurret["ProtonBombWCLUSTER", [-1]];
};
 
 
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



comment "Increment Throttle";
_this  addAction ["<t color='#0000FF'>Increment Throttle</t>",
{
(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))+.01);

},[1],0,false,true,"User16"," driver  _target == _this"];


comment "Decrement Throttle";
_this  addAction ["<t color='#FF0000'>Decrement Throttle</t>",
{
(_this select 0) setAirplaneThrottle ((airplaneThrottle (_this select 0))-0.01);	

},[1],0,false,true,"User17"," driver  _target == _this"];






