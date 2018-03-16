////////////////////////////////////////////////
//                  BCM                       //
////////////////////////////////////// by DÄZ //

_objet_Hack = pc_lumiere_off;

	_password_elec = with uiNamespace do {ctrlText (findDisplay 1984 displayCtrl 1400);};	
		
	if (_password_elec == DAZ_mdp_courant) then
	{
	
		playSound "DAZ_mdp_ok";
		
		closeDialog 1984;
		_objet_Hack setObjectTexture [0, "DAZ_BCM_POWER_PLANT\images\hack_Acces_ok.paa"];
		
		sleep 2;
		createDialog "DAZ_Power_Plan";
       
	}
	else
	{
	
		playSound "DAZ_mdp_erreur";
			
		_objet_Hack setObjectTexture [0, "DAZ_BCM_POWER_PLANT\images\hack_Acces_Refu.paa"];
		
		sleep 2;
		_objet_Hack setObjectTexture [0, "DAZ_BCM_POWER_PLANT\images\hack_courant.paa"];
		removeAllActions _objet_Hack;
		
		sleep 0.1;
		_objet_Hack addAction ["<t color='#FF0000'>Hacker le PC</t>", {[pc_lumiere_off] spawn DAZ_BCM_fnc_hack_courant_action}];

	};