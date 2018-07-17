//Add all Maps,GPS back	
//created by Rexi 
	{
	_x addItem "ItemGPS";
	_x assignItem "ItemGPS";
	_x addItem "ItemMap"; 
	_x assignItem "ItemMap";
	;} forEach playableUnits;

	hintSilent "Maps and GPS units added back to players";
	