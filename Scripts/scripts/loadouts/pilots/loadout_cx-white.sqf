///////////////////////////////////////////////////////////////
// 501st Legion - Loadout Script
// File: loadout_cx-white.sqf
// By: CC Cruisie
// Creation Date: 01/16/2018
// 
// Change Log:
//
//
///////////////////////////////////////////////////////////////
///////////// /\/ ( ) T E S ///////////////////////////////////
// Place this code in the init.sqf.
// nameofbox addAction ["CX White's Loadout", "scripts\loadouts\pilots\loadout_cx-white.sqf"];
//
// Place this code in the init field of selected unit:
// this disableai "move"; nop = [this] execVM "scripts\loadouts\pilots\loadout_cx-white.sqf";
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
player forceAddUniform "SWOP_Clonetrooper_501dogma_F_CombatUniform";
player addItemToUniform "ACE_packingBandage";
player addItemToUniform "ACE_morphine";
player addItemToUniform "ACE_tourniquet";
player addItemToUniform "ACE_fieldDressing";
player addItemToUniform "SWOP_termDet_G";
for "_i" from 1 to 3 do {player addItemToUniform "SWOP_DC15_Mag";};
player addVest "SWOP_Clonetrooper_501_armor_recon2";
player addBackpack "SWOP_B_CloneDVa";
for "_i" from 1 to 8 do {player addItemToBackpack "SWOP_DC15_Mag";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke_Blue";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke_Green";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke_Orange";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke_Purple";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke_Red";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke";};
for "_i" from 1 to 2 do {player addItemToBackpack "OPTRE_M2_Smoke_Yellow";};
player addHeadgear "SWOP_Clonetrooper_pilot_helmet501raven";
player addGoggles "SWOP_Clones_HUD";

comment "Add weapons";
player addWeapon "SWOP_DC15";
player addPrimaryWeaponItem "SWOP_DC15S_HoloScope";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "tf_anprc152_9";
player linkItem "ItemGPS";
player linkItem "SWOP_NVChipClean";

comment "Set identity";
player setFace "WhiteHead_17";
player setSpeaker "ace_novoice";
