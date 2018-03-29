_igiload = execVM "IgiLoad\IgiLoadInit.sqf";


if ((!isServer) && (player != player)) then {waitUntil {player == player};};

// ====================================================================================
// DAZ_BCM_POWER_PLANT SCRIPT
// ====================================================================================

Bouton_off1 = true;
Bouton_off2 = true;
Bouton_off3 = true;
Bouton_off4 = true;
Bouton_off5 = true;

// DAZ_BCM_HACK PASSWORD
// ====================================================================================
DAZ_mdp_courant = "BCM-DAZ";
// ====================================================================================

// HINT DAZ_BCM_HACK PASSWORD
hack_mdp = { 

hint parseText  "<t color='#ffffff' size='1' shadow='1' shadowColor='#000000' align='center'>Mdp:</t> <t color='#5ab300' size='1.2' shadow='1' shadowColor='#000000' align='center'>KIL-YUN</t>"

};