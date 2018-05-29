//remove thermal
	
	{  
   	_items = assigneditems _x;  
	_NVGS = ["SWOP_NVChipClean","SWOP_NVChip", "SWOP_NVChip2"];
	if ("SWOP_NVChipClean" in _items) then {  
	_x unassignItem "SWOP_NVChipClean"; 
	_x removeItem "SWOP_NVChipClean"; 
	_x addItem "OPTRE_NVG"; 
	_x assignItem "OPTRE_NVG";
	} 

		else{ 
		if ("SWOP_NVChip" in _items) then {  
		_x unassignItem "SWOP_NVChip"; 
		_x removeItem "SWOP_NVChip"; 
		_x addItem "OPTRE_NVG"; 
		_x assignItem "OPTRE_NVG";
		} 
			else{ 
			if ( "SWOP_NVChip2" in _items) then {  
			_x unassignItem  "SWOP_NVChip2"; 
			_x removeItem  "SWOP_NVChip2"; 
			_x addItem "OPTRE_NVG"; 
			_x assignItem "OPTRE_NVG";
			} 
			;}
	;}
	

	
	;} forEach playableUnits;  
	
		
hintSilent "Thermals have been removed from players";
	