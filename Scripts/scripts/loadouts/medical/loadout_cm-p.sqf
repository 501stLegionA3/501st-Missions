///////////////////////////////////////////////////////////////
// 501st Legion - Loadout Script
// File: loadout_cm-p.sqf
// By: CC Cruisie
// Creation Date: 01/17/2018
// 
// Change Log:
//
//
///////////////////////////////////////////////////////////////
///////////// /\/ ( ) T E S ///////////////////////////////////
// Place this code in the init.sqf.
// nameofbox addAction ["CM-P Loadout", "scripts\loadouts\medical\loadout_cm-p.sqf"];
//
// Place this code in the init field of selected unit:
// this disableai "move"; nop = [this] execVM "scripts\loadouts\medical\loadout_cm-p.sqf";
///////////////////////////////////////////////////////////////

if (!local _unit) exitWith {};

comment "Exported from Arsenal by CM-P Shiv";

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
player forceAddUniform "SWOP_Clonetrooper_501jesse_F_CombatUniform";
for "_i" from 1 to 2 do {player addItemToUniform "ACE_fieldDressing";};
player addItemToUniform "ACE_morphine";
player addItemToUniform "ACE_Fortify";
player addItemToUniform "ACE_EntrenchingTool";
for "_i" from 1 to 5 do {player addItemToUniform "ACE_CableTie";};
player addItemToUniform "ACE_Flashlight_XL50";
player addItemToUniform "ACE_MapTools";
player addItemToUniform "ACE_microDAGR";
for "_i" from 1 to 2 do {player addItemToUniform "OPTRE_M2_Smoke_Purple";};
for "_i" from 1 to 2 do {player addItemToUniform "OPTRE_M2_Smoke";};
for "_i" from 1 to 2 do {player addItemToUniform "OPTRE_M8_Flare";};
player addItemToUniform "DCStun_Mag";
player addVest "SWOP_Clonetrooper_501diamond_armor_kama";
player addBackpack "SWOP_B_CloneBackpack_med";
for "_i" from 1 to 35 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 35 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 25 do {player addItemToBackpack "ACE_quikclot";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 20 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 35 do {player addItemToBackpack "ACE_packingBandage";};
player addItemToBackpack "ACE_personalAidKit";
player addItemToBackpack "ACE_salineIV";
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_salineIV_250";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_salineIV_500";};
player addItemToBackpack "ACE_surgicalKit";
for "_i" from 1 to 15 do {player addItemToBackpack "ACE_tourniquet";};
player addHeadgear "SWOP_Clonetrooper_501dogma_helmet";
player addGoggles "SWOP_Clones_HUD";

comment "Add weapons";
player addWeapon "scoutElectroBinoculars_F";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "tf_microdagr";
player linkItem "tf_anprc152_102";
player linkItem "ItemGPS";
player linkItem "SWOP_NVChip2";

comment "Set identity";
//player setFace "WhiteHead_03";
//player setSpeaker "ace_novoice";