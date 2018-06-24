///////////////////////////////////////////////////////////////
// 501st Legion - WeaponsBox Script
// File: WeaponsBox.sqf
// By: CC Cruisie
// Creation Date: 01/15/2018
// 
// Change Log:
//
//
///////////////////////////////////////////////////////////////
///////////// /\/ ( ) T E S ///////////////////////////////////
// Create a ammobox and place the following code in the init line of the box.
//
// hnill = this execVM "crates\WeaponsBox.sqf";
///////////////////////////////////////////////////////////////

_crate = _this select 0;   

//Clear pre-existing Inventory
clearWeaponCargo _crate;
clearMagazineCargo _crate;

//Weapons
//_crate addWeaponCargo ["CUP_arifle_M16A4_Base", 50];
 

//Attachments
//_crate addItemCargo ["CUP_optic_ACOG", 50];
//_crate addItemCargo ["optic_Arco", 50];
//_crate addItemCargo ["optic_Hamr", 50];


//Ammo
//_crate addMagazineCargo ["MEU_30Rnd_M855A1_556x45_Stanag", 200];