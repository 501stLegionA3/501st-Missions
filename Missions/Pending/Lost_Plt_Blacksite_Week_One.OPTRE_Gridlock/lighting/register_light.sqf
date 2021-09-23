params ["_object", "_light_color"];

private _light = "#lightpoint" createVehicleLocal ((_this select 0) modelToworld [0, 0, 0.1]);
_light setLightColor (_this select 1);
_light setLightAmbient (_this select 1);
_light setLightBrightness 250;
_light setLightIntensity 250;
_light setLightDayLight true;