////////////////////////////////////////////////
//                  BCM                       //
////////////////////////////////////// by DÄZ //

_objet_Hack = _this select 0;

		removeAllActions _objet_Hack;
		
[_objet_Hack] call DAZ_BCM_fnc_son;

_objet_Hack setObjectTexture  [0, "DAZ_BCM_POWER_PLANT\images\hack_En_cours.paa"];

// Hacking
		
		hintSilent parseText "<t size='0.90' font='Zeppelin33' color='#004EFF'>Hacking started...</t>";
sleep 3;

	_seconde = 5;
	
while {_seconde != 100} do {
     hintSilent parseText format["<t size='0.90' font='Zeppelin33' color='#004EFF'>Hacking %1%2 completed.</t>",_seconde,"%"];
     _seconde = _seconde + 1;
     sleep 0.10;
};

hintSilent parseText format["<t size='0.90' font='Zeppelin33' color='#004EFF'>Hacking 99%1 completed.</t>","%"];

sleep 1;
hintSilent parseText format["<t size='0.90' font='Zeppelin33' color='#004EFF'>Hacking 100%1 completed.</t>","%"];

sleep 0.1;
deleteVehicle (_objet_Hack getVariable ["speaker", objNull]);

sleep 0.1;
[] spawn hack_mdp;
_objet_Hack addAction["Consulter le PC",{createDialog "DAZ_Login_elec";}];
hintSilent "";