private ["_ia_markers_array","_ia_markers_start","_ia_markers_change","_ia_markers_pos","_ia_markers_posx","_ia_markers_posy","_ia_markers_name","_ia_markers_color"];

waitUntil {!isNull player};

_ia_markers_array = [];
_ia_markers_start = 0.2;
_ia_markers_change = 0.05;

while {true} do {
	{deleteMarkerLocal _x;} forEach _ia_markers_array;
	_ia_markers_array = [];
	{
		if ((side _x == GRLIB_side_enemy) && (({!captive _x} count (units _x) ) > 0) && ([(getpos leader _x), GRLIB_side_friendly, GRLIB_radiotower_size] call F_getNearestTower != "")) then {
			_ia_markers_pos = getPosATL leader _x;
			_ia_markers_posx = floor (_ia_markers_pos select 0);
			_ia_markers_posx = _ia_markers_posx - (_ia_markers_posx mod 500);
			_ia_markers_posy = floor (_ia_markers_pos select 1);
			_ia_markers_posy = _ia_markers_posy - (_ia_markers_posy mod 500);
			
			// Chernarus Grid Fix
			if (worldName == "Chernarus") then {
				_ia_markers_posy = _ia_markers_posy - 140;
				if ((_ia_markers_posy + 500) < (_ia_markers_pos select 1)) then {
					_ia_markers_posy = _ia_markers_posy + 500;
				};
			};
			
			// Sahrani Grid Fix
			if (worldName == "Sara") then {
				_ia_markers_posy = _ia_markers_posy - 20;
				if ((_ia_markers_posy + 500) < (_ia_markers_pos select 1)) then {
					_ia_markers_posy = _ia_markers_posy + 500;
				};
			};
			
			_ia_markers_name = format["ia_marker_grid_%1_%2", _ia_markers_posx, _ia_markers_posy];
			_ia_markers_color = format["Color%1", side _x];

			if ((markerShape _ia_markers_name) isEqualTo "RECTANGLE") then {
				_ia_markers_name setMarkerAlphaLocal ((markerAlpha _ia_markers_name) +  _ia_markers_change);
			} else {
				createMarkerLocal[_ia_markers_name, [_ia_markers_posx + 250, _ia_markers_posy + 250, 0]];
				_ia_markers_name setMarkerShapeLocal "RECTANGLE";
				_ia_markers_name setMarkerSizeLocal [250,250];
				_ia_markers_name setMarkerColorLocal _ia_markers_color;
				_ia_markers_name setMarkerAlphaLocal (_ia_markers_start +  _ia_markers_change);
				_ia_markers_array pushBack _ia_markers_name;
			};
		};
	} forEach allGroups;
	uiSleep (60 + (random 60));
};