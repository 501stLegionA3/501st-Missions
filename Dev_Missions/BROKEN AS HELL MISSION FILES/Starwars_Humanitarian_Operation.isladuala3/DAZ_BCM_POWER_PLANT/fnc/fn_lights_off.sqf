_types = ["Lamps_Base_F", "PowerLines_base_F", "A3_Air_F_Heli_Light_01", "A3_Structures_F_Civ_Lamps", "A3_Structures_F_Items_Electronics", "Land_LampHarbour_F", "Land_LampHalogen_F", "Land_i_Shed_Ind_F", "Land_LampStreet_small_F","Land_PowerPoleWooden_L_F"];
_onoff = _this select 0;

for [{_i=0},{_i < (count _types)},{_i=_i+1}] do
{
	_lamps = getMarkerPos "lightMarkerTest" nearObjects [_types select _i, 1500];
	sleep 1;
	{_x setDamage _onoff} forEach _lamps;
};