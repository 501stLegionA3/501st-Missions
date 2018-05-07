// by ALIAS (modified by IndominusRexi)
// Flare Fix - Blue Flares for NATO



// flare intensity, replace 30 with desired value
al_flare_intensity = 30;
publicvariable "al_flare_intensity";

// flare range, replace 500 with desired value
al_flare_range = 200;
publicvariable "al_flare_range";

al_mortar_flare_intensity = 100;
publicvariable "al_mortar_flare_intensity";

al_mortar_flare_range = 450;
publicvariable "al_mortar_flare_range";




private ["_al_shooter","_al_color_flare","_al_flare_light","_flare_brig","_inter_flare","_int_mic","_al_flare","_type_flares"];

if (!hasInterface) exitWith {};

_al_flare = _this select 0;

// you need to list in array bellow the class names for flares you want to alter
	_type_flares = ["F_40mm_White","F_40mm_Red","F_40mm_Yellow","F_40mm_Green","Flare_82mm_AMOS_White","Sh_82mm_AMOS"];

_mortar_flare_on = false;
	
if ((typeOf _al_flare) in _type_flares) then {
	
switch (typeOf _al_flare) do {
    case "F_40mm_White": {/* hint "White Flare";*/_al_color_flare = [0.7,0.7,0.8]};
    case "F_40mm_Red": { /*hint "Red Flare";*/_al_color_flare = [0.7,0.15,0.1] };
    case "Sh_82mm_AMOS": { /*hint "Blue Flare";*/_al_color_flare = [0.1,0.3,0.7] };
    case "F_40mm_Yellow": {/* hint "Yellow Flare";*/_al_color_flare = [0.7,0.7,0] };
    case "F_40mm_Green": { /*hint "Green Flare"*/;_al_color_flare = [0.2,0.7,0.2] };
    case "Flare_82mm_AMOS_White": { /*hint "White Flare"*/;_al_color_flare = [1,1,1]; _mortar_flare_on = true };
};
	sleep 3;
	
	_al_flare_light = "#lightpoint" createVehicle getPosATL _al_flare;  
	_al_flare_light setLightAmbient _al_color_flare;  
	_al_flare_light setLightColor _al_color_flare;
	_al_flare_light setLightIntensity al_flare_intensity;
	if (_mortar_flare_on) then {_al_flare_light setLightIntensity al_mortar_flare_intensity};
	_al_flare_light setLightUseFlare true;
	_al_flare_light setLightFlareSize 10;
	_al_flare_light setLightFlareMaxDistance 2000;
	_al_flare_light setLightAttenuation [/*start*/ al_flare_range, /*constant*/1, /*linear*/ 100, /*quadratic*/ 0, /*hardlimitstart*/50,/* hardlimitend*/al_flare_range-10]; 
	if (_mortar_flare_on) then {_al_flare_light setLightAttenuation [/*start*/ al_mortar_flare_range, /*constant*/1, /*linear*/ 100, /*quadratic*/ 0, /*hardlimitstart*/50,/* hardlimitend*/al_mortar_flare_range-10];_mortar_flare_on = false;}; 
	_al_flare_light setLightDayLight true;

	// lumina intermitent 23

	_inter_flare = 0;
	
	if (_mortar_flare_on) then {type_flare=al_mortar_flare_intensity} else {type_flare = al_flare_intensity};

	while {!isNull _al_flare /*_inter_flare<21*/} do {
		_int_mic = 0.05 + random 0.01;
		sleep _int_mic;
		_flare_brig = type_flare+random 10;
		_al_flare_light setLightIntensity _flare_brig;
		_inter_flare = _inter_flare + _int_mic;
		_al_flare_light setpos (getPosATL _al_flare);
	};
};
