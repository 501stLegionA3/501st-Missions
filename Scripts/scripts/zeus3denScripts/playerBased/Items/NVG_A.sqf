//Emergency Restore of to all players
//Created by Rexi
	{
	_x unassignItem "swop_nvchipclean"; 
	_x unassignItem "SWOP_NVChip"; 
	_x unassignItem "SWOP_NVChip2"; 
	_x removeItem "swop_nvchipclean"; 
	_x removeItem "SWOP_NVChip"; 
	_x removeItem "SWOP_NVChip2"; 
	} forEach playableUnits;

	
	hintSilent "NVGS have been replaced on all players.";
	
