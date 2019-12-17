/*
	Functions_SCFramework.SQF
	
	External file containing useful functions that can be called from server, any headless client, and any player client 
*/

	// Create group that never returns NULL
Fnc_SCFramework_CreateGroup = {
	private ["_Group","_Side","_Variable"];
	_Side = _this select 0;
	_Variable = "";
	if (count _this > 1) then {
		_Variable = _this select 1;
	};
	_RunCreationLoop = true;
	_Center = createCenter _Side;
	sleep 0.1;
	while {_RunCreationLoop} do {
		_Group = createGroup [_Side,true];
		if (!isNull _Group) then { 
			_RunCreationLoop = false; 
		};
		sleep 0.1;
	};
	if (_Variable != "") then {
		_Group setVariable [_Variable,true,true];
	};
	_Group setVariable ["SpawnTime",time,true]; // Config_SCFramework
	diag_log format["(SCFramework) Fnc_SCFramework_CreateGroup: Group %1 %2 created.",_Group,_Side];
	_Group
};

	// Remove specified element from an array - Returns array
Fnc_SCFramework_DeleteArrayElement = {
	_Array = _this select 0;
	_Element = _this select 1;
	_Count = 0;
	{
		if (_x == _Element) then {	
			_Array deleteAt _Count;
		};
		_Count = _Count + 1;
	} forEach _Array;
	_Array
};

	// Remove duplicate elements and sort array alphabetically
Fnc_SCFramework_CleanArray = {
	_Array = _this select 0;
	_TArray = [];
	{
		_TArray pushBackUnique _x;
	} forEach _Array;
	_TArray sort true;
	_Arra = _TArray;
	_Array
};

	// Called from any module that needs to spawn a vehicle within a certain radius of a specified point on a road; will increment radius per 100m until suitable road is found and then will return that position
Fnc_SCFramework_FindRoadPos = {
	_SpawnPos = _this select 0;
	_Radius = _this select 1;
		// Correct if radius is too small
	if (_Radius <= 100) then { _Radius = 100; };
	_FoundRoad = false;
	_RunLoop = true;
	_SearchRadius = 0;
	while {_RunLoop} do {
			// Work in increments of 100
		_SearchRadius = _SearchRadius + 100;
		_NearRoads = _SpawnPos nearRoads _SearchRadius;
		if (count _NearRoads > 0) then {
			_Road = _NearRoads call BIS_fnc_SelectRandom;
			_FoundRoad = true;
			_SpawnPos = getPos _Road;
			diag_log format["(SCFramework) Fnc_SCFramework_FindRoadPos: Found suitable spawn position on road at %1",_SpawnPos];
		};
		if (_FoundRoad) then {
			_RunLoop = false;
		};
		if (_SearchRadius > _Radius) then {
			_RunLoop = false;
		};
		sleep 0.05;
	};
	if (!_FoundRoad) then {
		diag_log format["(SCFramework) Fnc_SCFramework_FindRoadPos: Failed to find road from given position %1 and radius %2. Returning original position.",_SpawnPos,_Radius];
	};
	_SpawnPos
};

	// Completely strip a unit of all of its gear
Fnc_SCFramework_ClearUnit = {
	_Unit = _this select 0;
	_Unit unlinkItem (goggles player);
	removeAllWeapons _Unit;
	removeAllItems _Unit;
	removeAllItemsWithMagazines _Unit;
	removeVest _Unit;
	removeHeadgear _Unit;
	removeBackpack _Unit;
	removeUniform _Unit;
	removeGoggles _Unit;
};

	// Set fuel on a vehicle EH
"Fnc_SCFramework_SetFuel" addPublicVariableEventHandler {
	_Array = _this select 1;
	_Vehicle = _Array select 0;
	_Fuel = _Array select 1;
	if (local _Vehicle && alive _Vehicle) then {
		_Vehicle setFuel _Fuel;
		diag_log format["(SCFramework) Setting local vehicle %1 %2 fuel to %3.",_Vehicle,typeOf _Vehicle,_Fuel];
	};
};

	// Set Fuel, Repair, and Reammo Cargo EH
"Fnc_SCFramework_SetCargo" addPublicVariableEventHandler {
	_Array = _this select 1;
	_Vehicle = _Array select 0;
	_CargoType = _Array select 1;
	_CargoAmt = _Array select 2;
	if (local _Vehicle && alive _Vehicle) then {
			// Determine cargo type: Fuel = 1, Repair = 2, Reammo = 3
		switch (_CargoType) do {
			case 1: { 
				_Vehicle setFuelCargo _CargoAmt;
				diag_log format["(SCFramework) Setting local vehicle %1 %2 fuel cargo to %3.",_Vehicle,typeOf _Vehicle,_CargoAmt];
			};
			case 2: {
				_Vehicle setRepairCargo _CargoAmt;
				diag_log format["(SCFramework) Setting local vehicle %1 %2 repair cargo to %3.",_Vehicle,typeOf _Vehicle,_CargoAmt];
			};
			case 3: {
				_Vehicle setAmmoCargo _CargoAmt;
				diag_log format["(SCFramework) Setting local vehicle %1 %2 ammo cargo to %3.",_Vehicle,typeOf _Vehicle,_CargoAmt];
			};
		};
	};
};

diag_log format["Functions_SCFramework.SQF: Functions loaded."];