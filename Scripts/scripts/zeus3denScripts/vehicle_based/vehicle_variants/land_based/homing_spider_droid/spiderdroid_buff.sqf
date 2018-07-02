/*

 //Buffs the spider droids AI,AT and AA ability only works on spawned Spiders
 //Created by Rexi 
	{
	    if ((typeOf _x) in ["SpiderOG"]) then {
			_x removeweapon "Cannon_Spiderdroidog9";
		  	_x addWeaponTurret ["weapon_rim116Launcher", [0]];
		  	
			for [{_i=0}, {_i<5}, {_i=_i+1}] do
			{
				_x addMagazineTurret ["magazine_Missile_rim116_x21" ,[0]];
			};
		     	_x addWeaponTurret ["Cannon_Antana", [0]];
			for [{_i=0}, {_i<3}, {_i=_i+1}] do
			{
				_x addMagazineTurret ["1000Rnd_Laser_Cannon_Antana" ,[0]];
			};    
	    };
    } forEach vehicles;
	
		hintSilent "Existing Homing spiders AT droids have had AA Launcher added and main cannon changed";
