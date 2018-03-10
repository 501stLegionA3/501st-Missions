Here is the file path of various scripts,if its not listed here then its probably 1)scriptis being prepped or 2) we forgot :P


//laat weapon
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\LAAT\laatClaymore.sqf";
	
//arc-170 weapon
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\arcXiphos.sqf";
	
//arc-170 prevent ejection,note this is tied into the arc-170 weapon script
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\removeEject.sqf";
	
//y-wing weapons
	[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\YWING\ywingScylla.sqf";


//kappa-cruisie boost not ready for xeh server use
	[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
	[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";


//arc-170 wing tip smoke not ready for xeh server use
	[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipPrB.sqf";
	[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipRB.sqf";
	[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipWB.sqf";

//laat wing tip smoke 
	[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTip.sqf";



//pilot kill detector not ready for xeh server use
	[] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";
	
//warden resupply ammo not ready for xeh server use
	[] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";
	
//b2 reconfig
	[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b2\b2Reconfig.sqf";