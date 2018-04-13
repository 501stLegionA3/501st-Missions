///////////////////////////////////////////////////////////////
// 501st Legion - Loadout Script
// File: loadout_cr.sqf
// By: CC Cruisie
// Creation Date: 01/15/2018
// 
// Change Log:
//
//
///////////////////////////////////////////////////////////////
///////////// /\/ ( ) T E S ///////////////////////////////////
// Place this code in the init.sqf.
// nameofbox addAction ["Clone Recruit Loadout", "scripts\loadouts\loadout_cr.sqf"];
//
// Place this code in the init field of selected unit:
// this disableai "move"; nop = [this] execVM "scripts\loadouts\loadout_cr.sqf";
///////////////////////////////////////////////////////////////
_unit = _this select 0;
 
if (!local _unit) exitWith {};

	removeallweapons _unit;
	removeheadgear _unit;
	removeVest _unit;

	_unit unassignItem "NVgoggles";
	_unit removeItem "NVGoggles";
	
	_unit addweapon "rangefinder";
	_unit assignitem "rangefinder";

	_unit additem "itemRadio";

	_unit addheadgear "";
	
	removebackpack _unit;