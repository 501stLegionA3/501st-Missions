////////////////////////////////////////////////
//                  BCM                       //
////////////////////////////////////// by DÄZ //

/////////////////


switch (_this select 0) do {

	case "off1": {
	
			if (Bouton_off1) then {
		disableSerialization;
		
			playSound "DAZ_Power_plant_Bouton";
				
			ctrlSetText [1201, "DAZ_BCM_POWER_PLANT\Dialog\images\off_1.paa"];
			ctrlSetText [1203, ""];
			ctrlSetText [1205, ""];
			
			Bouton_off3 = true;
			Bouton_off1 = false;
			Bouton_off5 = true;
			
		} else {
		
			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1201, ""];
			ctrlSetText [1203, "DAZ_BCM_POWER_PLANT\Dialog\images\off_3.paa"];
			ctrlSetText [1205, "DAZ_BCM_POWER_PLANT\Dialog\images\off_5.paa"];
			
			Bouton_off1 = true;
			Bouton_off3 = false;
			Bouton_off5 = false;
		};
	};
	
	case "off2": {
	
			if (Bouton_off2) then {
		disableSerialization;
		
			playSound "DAZ_Power_plant_Bouton";	
			
			ctrlSetText [1202, "DAZ_BCM_POWER_PLANT\Dialog\images\off_2.paa"];
			ctrlSetText [1204, "DAZ_BCM_POWER_PLANT\Dialog\images\off_4.paa"];
			
			Bouton_off2 = false;
			Bouton_off4 = false;

			
		} else {

			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1202, ""];
			ctrlSetText [1204, ""];
			
			Bouton_off2 = true;
			Bouton_off4 = true;

		};
	};
	
	case "off3": {
	
			if (Bouton_off3) then {
		disableSerialization;

			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1204, ""];
			ctrlSetText [1203, "DAZ_BCM_POWER_PLANT\Dialog\images\off_3.paa"];
			ctrlSetText [1202, ""];
			
			Bouton_off4 = true;
			Bouton_off2 = true;
			Bouton_off3 = false;

			
		} else {

			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1204, "DAZ_BCM_POWER_PLANT\Dialog\images\off_4.paa"];
			ctrlSetText [1203, ""];
			ctrlSetText [1202, "DAZ_BCM_POWER_PLANT\Dialog\images\off_2.paa"];
			
			Bouton_off4 = false;
			Bouton_off2 = false;
			Bouton_off3 = true;

		};
	};
	
	case "off4": {
	
			if (Bouton_off4) then {
		disableSerialization;
		
			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1204, "DAZ_BCM_POWER_PLANT\Dialog\images\off_4.paa"];
			ctrlSetText [1202, ""];
			ctrlSetText [1201, ""];
			
			Bouton_off2 = true;
			Bouton_off4 = false;
			Bouton_off1 = true;
			
		} else {

			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1204, ""];
			ctrlSetText [1202, "DAZ_BCM_POWER_PLANT\Dialog\images\off_2.paa"];
			ctrlSetText [1201, "DAZ_BCM_POWER_PLANT\Dialog\images\off_1.paa"];
			
			Bouton_off2 = false;
			Bouton_off4 = true;
			Bouton_off1 = false;
		};
	};
	case "off5": {
	
			if (Bouton_off5) then {
		disableSerialization;

			playSound "DAZ_Power_plant_Bouton";	
			
			ctrlSetText [1205, "DAZ_BCM_POWER_PLANT\Dialog\images\off_5.paa"];
			ctrlSetText [1204, ""];
			
			Bouton_off4 = true;
			Bouton_off5 = false;
			
		} else {

			playSound "DAZ_Power_plant_Bouton";
			
			ctrlSetText [1205, ""];
			ctrlSetText [1204, "DAZ_BCM_POWER_PLANT\Dialog\images\off_4.paa"];
			
			Bouton_off4 = false;
			Bouton_off5 = true;
		};
	};
	
};

	if (!Bouton_off1 && !Bouton_off2 && !Bouton_off3 && !Bouton_off4 && !Bouton_off5) then {
	
	//playSound "DAZ_Power_plant_Off";
	[pc_lumiere_off,"DAZ_Power_plant_Off"] remoteExec ["say3d"];
	
	sleep 4;
	
	[] spawn DAZ_BCM_fnc_hack_courant;
	
	removeAllActions pc_lumiere_off;
	
	test_1 setDamage 1;
	test_2 setDamage 1;
	
	pc_lumiere_off setObjectTexture [0, "DAZ_BCM_POWER_PLANT\images\hack_courant_ok.paa"];
	sleep 1;
	closedialog 0;
	sleep 1;
	
	};

	
waitUntil { !dialog }; 

	Bouton_off1 = true;
	Bouton_off2 = true;
	Bouton_off3 = true;
	Bouton_off4 = true;
	Bouton_off5 = true;
