//Script to retexture AATs blue only works on spawned AATs
	{
    if ((typeOf _x) in ["O_SWOP_AAT_1"]) then {
    _x setobjecttextureglobal [1,"awing\t_awing_03_cw.paa"];
	_x setobjecttextureglobal [0,"awing\t_awing_03_cw.paa"]; 
         
        };
    } forEach vehicles;
	hintSilent "Existing AAT's have had Colours changed to Blue";
