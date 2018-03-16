////////////////////////////////////////////////
//                  BCM                       //
////////////////////////////////////// by DÄZ //

		//On place un marquer pour le script "lights":  
		_marker = createMarker ["lightMarkerTest", position player];
		
		 //Script light OFF
		 0 = [0.95] call DAZ_BCM_fnc_lights_off;