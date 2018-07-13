//DooDziO 8.17
params [ "_veh" ];

if ( !isNull _veh ) then {
	_veh setPosATL [(getPosATL _veh) select 0,(getPosATL _veh) select 1, ( (getPosATL _veh) select 2 ) +  2];
	_veh setVectorUp surfaceNormal position _veh;
};
