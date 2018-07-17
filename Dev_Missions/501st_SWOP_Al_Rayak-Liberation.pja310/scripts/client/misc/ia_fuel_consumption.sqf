/*
ia_fuel_consumption.sqf
Author: Wyqer
Website: www.killahpotatoes.de
Date: 2017-02-02

Description:
This script handles the fuel consumption of vehicles, so that refueling will be necessary more often.

Parameters:
_this select 0 - OBJECT - Vehicle

Method:
execVM

Example for initPlayerLocal.sqf:
player addEventHandler ["GetInMan", {[ _this select 2] execVM "scripts\ia_fuel_consumption.sqf";}];
*/

private ["_ia_neutral_consumption","_ia_normal_consumption","_ia_max_consumption"];

/*
CONFIG
*/
// Time in Minutes till a full tank depletes when the vehicle is standing with running engine
_ia_neutral_consumption = IA_liberation_fuel_neutral;
// Time in Minutes till a full tank depletes when the vehicle is driving
_ia_normal_consumption = IA_liberation_fuel_normal;
// Time in Minutes till a full tank depletes when the vehicle is driving at max speed
_ia_max_consumption = IA_liberation_fuel_max;

/*
DO NOT EDIT BELOW
*/

if (isNil "ia_fuel_consumption_vehicles") then {
	ia_fuel_consumption_vehicles = [];
};

if (!((_this select 0) in ia_fuel_consumption_vehicles)) then {
	ia_fuel_consumption_vehicles pushBack (_this select 0);
	while {local (_this select 0)} do {
		if (isEngineOn (_this select 0)) then {
			if (speed (_this select 0) > 5) then {
				if (speed (_this select 0) > (getNumber (configFile >> "CfgVehicles" >> typeOf (_this select 0) >> "maxSpeed") * 0.9)) then {
					(_this select 0) setFuel (fuel (_this select 0) - (1 / (_ia_max_consumption * 60)));
				} else {
					(_this select 0) setFuel (fuel (_this select 0) - (1 / (_ia_normal_consumption * 60)));
				};
			} else {
				(_this select 0) setFuel (fuel (_this select 0) - (1 / (_ia_neutral_consumption * 60)));
			};
		};
		uiSleep 1;
	};
	ia_fuel_consumption_vehicles deleteAt (ia_fuel_consumption_vehicles find (_this select 0));
};