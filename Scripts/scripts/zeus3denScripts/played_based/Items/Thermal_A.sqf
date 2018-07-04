//add back thermals
//Created by Rexi
	
	{  
   	_items = assigneditems _x;  
	if ("OPTRE_NVG" in _items) then {  
	_x unassignItem "OPTRE_NVG"; 
	_x removeItem "OPTRE_NVG"; 
	_x addItem "swop_nvchipclean"; 
	_x assignItem "swop_nvchipclean";
	} 
	else{ 
		;}
	;} forEach playableUnits;  
	
	
	
hintSilent "Thermals have been added back to players";
		
	
	
	