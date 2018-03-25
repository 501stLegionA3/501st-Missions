params["_vic"];

//add the new gusn
_vic addWeaponTurret ["Cannon_EWEBSWBFgun", [0]];
for [{_i=0}, {_i<3}, {_i=_i+1}] do
{
	_vic addMagazineTurret ["1000Rnd_Laser_Cannon_EWEBSWBF" ,[0]];

};//