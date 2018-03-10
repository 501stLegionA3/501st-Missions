last update 3/10/2018 3:13 pm est by namenai

Here is the file path of various scripts,if its not listed here then its probably 1)scripts being prepped or 2) we forgot :P

/////////////////NOTE THESE FILE PATHS ARE ALL RELAVTIVE TO THE MAIN INIT.SQF FILE////////////////////////////////



///////////////            KEY              ////////////////////
/*
---H means head,usually a script that is automatically ran via EH or CBA XEH.
---X means tied to a ---H, no need to really apply it.
---F free script,meaning you can either use in 3den or zeus if you need it.


*/
///////////////         END KEY              ////////////////////

//To run namenaiInit do/add the following
[] execVM "scripts\zeus3denScripts\namenaisInit.sqf";



//Vehicle scripts
	//weapon
		//laat weapon,no need to worry as it will auto apply ---H
			[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\LAAT\laatClaymore.sqf";
			
		//arc-170 weapon,no need to worry as it will auto apply ---H
			[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\arcXiphos.sqf";
			
		//arc-170 prevent ejection,note this is tied into the arc-170 weapon script ---X
			[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\removeEject.sqf";
			
		//y-wing weapons,no need to worry as it will auto apply ---H
			[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\YWING\ywingScylla.sqf";
			
	//supporting vehicle scripts
		//arc-170 wing tip smoke,tied to arc weapon ---X
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipPrB.sqf";
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipRB.sqf";
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipWB.sqf";

		//laat wing tip smoke ,tied to laat weapon ---X
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTip.sqf";

		//Y-wing thruster tip smoke ,tied to y-wing weapon ---X
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\YWING\ywingSmokeTip.sqf";
	
	//Vehicle Action Menu Based
		
		//kappa-cruisie boost ---F
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";
			
			//3den use,note dont use both,working on fixing so that both can be used
			[this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
			[this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";
			
			//zeus use,note dont use both,working on fixing so that both can be used
			[_this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
			[_this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";


			
//Played Based	
	//Aviation Based
		//pilot kill detector ---F
			[] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";
			[this] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";//for when you want this on a object in 3den
			[_this] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";//for when you want to apply it during zeus
			
		//warden resupply ammo ---F
			[] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";
			[this] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";//for when you want this on a object in 3den
			[_this] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";//for when you want to apply it during zeus

	
	
//AI Based
	//FactionBased
		//OPFOR Based
			//CIS
				//b2 reconfig,no need to worry as it will auto apply---H
					[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b2\b2Reconfig.sqf";
		//BLUFOR Based
		
		//INDEPENDENT Based
		
		//CIVILLIAN Based
		
		
		
		
		
		
		