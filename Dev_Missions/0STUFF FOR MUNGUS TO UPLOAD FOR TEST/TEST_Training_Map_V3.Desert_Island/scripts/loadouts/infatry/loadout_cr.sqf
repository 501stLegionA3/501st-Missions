///////////////////////////////////////////////////////////////
// 501st Legion - Loadout Script
// File: loadout_cr.sqf
// By: CC Cruisie
// Creation Date: 01/15/2018
// 
// Change Log:
// 1-16-2018: Comment Out therma+
//
///////////////////////////////////////////////////////////////
///////////// /\/ ( ) T E S ///////////////////////////////////
// Place this code in the init.sqf.
// nameofbox addAction ["Clone Recruit Loadout", "scripts\loadouts\loadout_cr.sqf"];
//
// Place this code in the init field of selected unit:
// this disableai "move"; nop = [this] execVM "scripts\loadouts\loadout_cr.sqf";
///////////////////////////////////////////////////////////////
//_unit = _this select 0;

 if (!local _unit) exitWith {};
 
//	removeAllWeapons _unit;
//	removeAllItems _unit;
//	removeAllAssignedItems _unit;
//	removeUniform _unit;
//	removeVest _unit;
//	removeBackpack _unit;
//	removeHeadgear _unit;
//	removeGoggles _unit;

//	_unit forceAddUniform "SWOP_Clonetrooper_F_CombatUniform";
//	_unit addVest "SWOP_Clonetrooper_armor";
	
//	_unit addHeadgear "SWOP_Clonetcadet_helmet";
//	_unit addGoggles "SWOP_Clones_HUD";

//comment "Exported from Arsenal by CC Cruisie";

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

//comment "Add containers";
player forceAddUniform "SWOP_Clonetrooper_F_CombatUniform";
//player addItemToUniform "ACE_fieldDressing";
//player addItemToUniform "ACE_packingBandage";
//player addItemToUniform "ACE_morphine";
//player addItemToUniform "ACE_tourniquet";
//for "_i" from 1 to 2 do {player addItemToUniform "SWOP_termDet_G";};
player addVest "SWOP_Clonetrooper_armor";
player addHeadgear "SWOP_Clonetcadet_helmet";
player addGoggles "SWOP_Clones_HUD";

//comment "Add weapons";

//comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "tf_anprc152_4";
player linkItem "ItemGPS";

//comment "Set identity";
//player setFace "TanoanHead_A3_02";
//player setSpeaker "ace_novoice";
