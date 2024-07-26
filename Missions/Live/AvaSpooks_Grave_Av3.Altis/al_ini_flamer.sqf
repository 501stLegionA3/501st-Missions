// by ALIAS

[marker,territory_radius,damage_inflicted,health_points] execvm "AL_flamer\al_flamer.sqf";

marker				- string, name of the marker where you want to place the anomaly
territory_radius	- number, radius in meters of FLAMERs territory
damage_inflicted	- number, damage inflicted by FLAMERs main attack
health_points		- number, amount of health/hit points FLAMER has

>>>>> EXAMPLE

["flamer_1",300,0.1,5000] execvm "AL_flamer\al_flamer.sqf";