////////////////////////////////////////////////
//                  BCM                       //
////////////////////////////////////// by DÄZ //


_objet = _this select 0;

_logic = createVehicle ["Land_HelipadEmpty_F", position _objet, [], 0, "CAN_COLLIDE"];
[_logic,"DAZ_Hack_son"] remoteExec ["say3d"];
_objet setVariable ["speaker", _logic];