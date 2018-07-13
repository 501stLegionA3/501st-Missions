//DooDziO 18.17 add ship
if ( GRLIB_USS_FREEDOM ) then {

	if ( isServer ) then {
		lhd setpos getmarkerpos "USS_FREEDOM";
		lhd hideObject true;
		{ deleteVehicle _x } foreach ( ( getmarkerpos "base_chimera" ) nearObjects 500 );
		{ deleteVehicle _x } foreach ( ( getmarkerpos "lhd" ) nearObjects 500 );

		GRLIB_isAtlasPresent = false;
		publicVariable "GRLIB_isAtlasPresent"
	}else{
		//client wait for server to complete. Then remove local markers of bases
		waitUntil { !isNil "GRLIB_isAtlasPresent" };
	};
	deleteMarkerLocal "lhd";
	deleteMarkerLocal "base_chimera";

} else {
	//no ship
	if ( isServer ) then {
		//no ship so remove ship
		{ deleteVehicle _x } foreach ( ( getmarkerpos "USS_FREEDOM" ) nearObjects 500 );

		_isAtlas = isClass ( configFile / "cfgVehicles" / "ATLAS_B_LHD_helper" );

		if ( _isAtlas ) then {

			[ lhd, [ 'ATLAS_LHD_1','ATLAS_LHD_2','ATLAS_LHD_3','ATLAS_LHD_4','ATLAS_LHD_5','ATLAS_LHD_5a',
			'ATLAS_LHD_6','ATLAS_LHD_7','ATLAS_LHD_house_1','ATLAS_LHD_house_2','ATLAS_LHD_elev_1',
			'ATLAS_LHD_elev_2','ATLAS_LHD_Light2','ATLAS_LHD_Int_1','ATLAS_LHD_Int_2','ATLAS_LHD_Int_3' ] ]
			execVM "ATLAS_Water\scripts\large_object_attach.sqf";
			[ lhd ] execVM "ATLAS_WAter\LHD\scripts\initlights.sqf";
			lhd hideObject true;
			{ deleteVehicle _x } foreach ( ( getmarkerpos "base_chimera" ) nearObjects 500 );

			GRLIB_isAtlasPresent = true; publicVariable "GRLIB_isAtlasPresent";
		} else {
			lhd setpos getmarkerpos "base_chimera";
			lhd hideObject true;
			{ deleteVehicle _x } foreach ( ( getmarkerpos "lhd" ) nearObjects 500 );
			GRLIB_isAtlasPresent = false; publicVariable "GRLIB_isAtlasPresent";
		};
	} else {
		waitUntil { !isNil "GRLIB_isAtlasPresent" };
	};
	//remove marker
	deleteMarkerLocal "USS_FREEDOM";

	if ( GRLIB_isAtlasPresent ) then {
		deleteMarkerLocal "base_chimera";
	} else {
		deleteMarkerLocal "lhd";
	};
};
