weaponsList=[
["1000Rnd_Laser_Cannon_LAAT","Cannon_LAAT",2,[-1]],
["laat_proton_torpedo","laat_proton_torpedo_launcher",2,[-1,0]],
["4Rnd_LG_Jian","missiles_Jian",8,[-1,0]],
["2Rnd_Missile_AA_04_F","Missile_AA_04_Plane_CAS_01_F",10,[-1,0]],
["magazine_Missile_rim116_x21","weapon_rim116Launcher",1,[-1,0]],
["magazine_Missile_rim116_x21","weapon_rim116Launcher",2,[0]],
["SmokeLauncherMag","SmokeLauncher",10,[-1,0]],
["300Rnd_CMFlare_Chaff_Magazine","CMFlareLauncher",10,[-1,0]],
["400Rnd_Pomehi_Mag","PomehiLauncherXT",10,[-1,0]],
["10Rnd_FAST_Cannon_TIE","Cannon_TIE_FAST",100,[1,2]],
["Laserbatteries","Laserdesignator_pilotCamera",1,[-1,0]]
];
;

for [{_i=0}, {_i<2}, {_i=_i+1}] do
{
_this removeMagazineTurret ["laat_proton_torpedo" ,[-1]];  
_this removeWeaponTurret["laat_proton_torpedo_launcher", [-1]];
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



comment "gets health";
_this  addAction ["<t color='#00FF00'>Damage Report</t>",
{


hint parseText format["<t color='#0099FF'> Damage status is :%1</t>",((1-(damage (_this select 0)))*100)];

},[1],0,false,true,""," driver  _target == _this"];


