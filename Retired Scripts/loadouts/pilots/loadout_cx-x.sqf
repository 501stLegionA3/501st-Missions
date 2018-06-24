///////////////////////////////////////////////////////////////
// 501st Legion - Loadout Script
// File: loadout_cx-x.sqf
// By: CC Cruisie
// Creation Date: 01/16/2018
// 
// Change Log:
//
//
///////////////////////////////////////////////////////////////
///////////// /\/ ( ) T E S ///////////////////////////////////
// Place this code in the init.sqf.
// nameofbox addAction ["CX-X Loadout", "scripts\loadouts\pilots\loadout_cx-x.sqf"];
//
// Place this code in the init field of selected unit:
// this disableai "move"; nop = [this] execVM "scripts\loadouts\pilots\loadout_cx-x.sqf";
///////////////////////////////////////////////////////////////

if (!local _unit) exitWith {};

comment "Exported from Arsenal by CX White";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "SWOP_Clonetrooper_501_F_CombatUniform";
//player addItemToUniform "ACE_packingBandage";
//player addItemToUniform "ACE_morphine";
//player addItemToUniform "ACE_tourniquet";
//player addItemToUniform "ACE_fieldDressing";
//for "_i" from 1 to 2 do {player addItemToUniform "SWOP_termDet_G";};
player addVest "SWOP_Clonetrooper_501_armor";
player addHeadgear "SWOP_Clonetrooper_pilot_helmet501";
player addGoggles "SWOP_Clones_HUD";

comment "Add weapons";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "tf_anprc152_7";
player linkItem "ItemGPS";

comment "Set identity";
//player setFace "WhiteHead_17";
//player setSpeaker "ace_novoice";