//----------Spec op droid Script
//Created by Rexi Designed by Euler
Specop={
	params["_com"];
	
	_com removealleventhandlers "handledamage"; 
	_com addeventhandler ["HandleDamage",{ 
	_unit = _com select 0; 
	_selection = _com select 1; 
	_passedDamage = _com select 2; 
	_source = _com select 3; 
	_projectile = _com select 4; 
 
	_oldDamage = 0; 
	switch(_selection)do{ 
	case("head"):{_oldDamage = _unit getHitPointDamage "HitHead";}; 
	case("body"):{_oldDamage = _unit getHitPointDamage "HitBody";}; 
	case("hands"):{_oldDamage = _unit getHitPointDamage "HitHands";}; 
	case("legs"):{_oldDamage = _unit getHitPointDamage "HitLegs";}; 
	case(""):{_oldDamage = damage _unit;}; 
	default{}; 
	}; 
 
	_return = _oldDamage + ((_passedDamage - _oldDamage) / 1.05); 
 
	_return 
	}];
	_com setUnitAbility 100; 
	_com setskill ["aimingAccuracy",100]; 
	_com setskill ["aimingShake",100]; 
	_com setskill ["aimingSpeed",100]; 
	_com setskill ["spotDistance",100]; 
	_com setskill ["spotTime",100]; 
	_com setskill ["courage",100]; 
	_com setskill ["reloadSpeed",100]; 
	_com setSkill ["general", 200]; 
	_com setAnimSpeedCoef 1.35; 



	_com AddUniform "SWOP_B1_droid_crew_F_standart";
	_com Addheadgear "H_HelmetO_ViperSP_ghex_F";
	_com AddVest "SWOP_Clonetrooper_Katarn_armor";
	_com addBackpack "CAA_InvisBag";

	
	for [{_i=0}, {_i<(4)}, {_i=_i+1}] do
	{
		_com addItemToUniform "ACE_tourniquet";
		_com addItemToUniform "ACE_quikclot";
		_com addItemToUniform "ACE_CableTie";
		_com addItemToUniform "ACE_CableTie";
		_com addItemToBackpack "swop_mag_flashbang";
		_com addItemToBackpack "swop_SmokeShell";
		_com addItemToBackpack "swop_SmokeShell";
		_com addItemToVest "swop_SmokeShell";
	};
	
	_com addWeapon "SWOP_EE4BlasterRifle";
	for [{_i=0}, {_i<5}, {_i=_i+1}] do
	{
	_com addItemToBackpack "SWOP_EE4BlasterRifle_Mag";
	_com addItemToBackpack "SWOP_EE4BlasterRifle_Mag";
	_com addItemToBackpack "SWOP_EE4BlasterRifle_Mag";
	_com addItemToUniform "ACE_fieldDressing";
	_com addItemToUniform "ACE_fieldDressing";
	_com addItemToUniform "ACE_fieldDressing";
	};    

	for [{_i=0}, {_i<2}, {_i=_i+1}] do
	{
	_com addItemToBackpack "APERSMine_Range_Mag";
	_com addItemToBackpack "ACE_M84";
	_com addItemToBackpack "SWOP_BCCKtermimploder_G";
	_com addItemToBackpack "ACE_epinephrine";
	_com addItemToBackpack "ACE_morphine";
	_com addItemToBackpack "swop_SmokeShell";
	};    

	_com addWeapon  "ElectroBinocularsB_F";
	_com addItem "ItemGPS";
	_com assignItem "ItemGPS";
	_com addItem "tf_anprc152_84"; 
	_com assignItem "tf_anprc152_84";
	
	  {
    if ((typeOf _x) in [ "O_Protagonist_VR_F"]) then {
            
	[_x,[0,"optre_vehicles\cart\data\truck_01_ext_01_co.paa"]] remoteExec ["setObjectTextureglobal",0];
	[_x,[1,"optre_vehicles\falcon\data\Falcon_Hull_Night_co.paa"]] remoteExec ["setObjectTextureglobal",0];
	[_x,[2,"optre_vehicles\cart\data\truck_01_ext_01_co.paa"]] remoteExec ["setObjectTextureglobal",0];
	    };
    } forEach allUnits;		
	
    };

			
["O_Protagonist_VR_F", "init",Specop, true, [], false] call CBA_fnc_addClassEventHandler;

