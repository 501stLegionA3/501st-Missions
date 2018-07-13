private [ "_lhd_x", "_lhd_y", "_lhd_z", "_spread", "_rotation", "_posx", "_posy" ];

// GRLIB_USS_FREEDOM = true;
if ( GRLIB_USS_FREEDOM ) then {
	_lhd_x =  9;
	_lhd_y = -42;
	_lhd_z = 20;
	_spread = 6;

	_rotation = (getdir lhd);
	// _posx = (getposasl lhd select 0) + _lhd_x;
	// _posy = (getposasl lhd select 1) + _lhd_y;
	_posx =  (getPos spawnpoint) select 0;
	_posy =  (getPos spawnpoint) select 1;
	_lhd_z = _lhd_z + ( (getPosATL ussfreedom) select 2)  ; //get pos to ground and add 20 to be on deck
	_posx = (_posx + (random _spread)) - (_spread / 2);
	_posy = (_posy + (random _spread)) - (_spread / 2);
	player setPosATL [ _posx , _posy, _lhd_z ];

}else {

	if ( GRLIB_isAtlasPresent ) then {
		_lhd_x = 6;
		_lhd_y = -16;
		_lhd_z = 16.5;
		_spread = 6;

		_lhd_z = _lhd_z + (getposasl lhd select 2);

		_rotation = (getdir lhd);
		_posx = (getposasl lhd select 0) + _lhd_x;
		_posy = (getposasl lhd select 1) + _lhd_y;
		_posx = (_posx + (random _spread)) - (_spread / 2);
		_posy = (_posy + (random _spread)) - (_spread / 2);
		player setposasl [ _posx , _posy, _lhd_z ];

	} else {
		player setpos ( [ getpos lhd, random 6, random 360 ] call BIS_fnc_relPos );
	};
};
