//----------Magma Script
//created by Rexi 20/04/2018
Magma={
	params["_mag"];
_mag setSkill 1;
_mag setAnimSpeedCoef 1.45;
_mag setvariable ["ace_medical_unitDamageThreshold", [64,81,81], true]; //*Zatama 15.06.18
_mag setUnitAbility 100; 
_mag setskill ["aimingAccuracy",1]; 
_mag setskill ["aimingShake",1]; 
_mag setskill ["aimingSpeed",1]; 
_mag setskill ["spotDistance",1];
_mag setUnitRecoilCoefficient 0; 
_mag setskill ["spotTime",1]; 
_mag setskill ["courage",1]; 
_mag setskill ["reloadSpeed",1]; 
_mag setunitpos "auto"; //Zatama 15/06/18
_mag setSkill ["general", 1]; 
_mag addItem "swop_nvchipclean"; 
_mag assignItem "swop_nvchipclean";
_mag addItemToUniform  "SWOP_termDet_G";


for [{_i=0}, {_i<(5)}, {_i=_i+1}] do
	{
		_mag addItemToUniform "ACE_tourniquet";
		_mag addItemToUniform "ACE_quikclot";
		_mag addItemToUniform "ACE_CableTie";
		_mag addItemToUniform "ACE_fieldDressing";
	};
	

	for [{_i=0}, {_i<2}, {_i=_i+1}] do
	{
	_mag addItemToUniform  "ACE_epinephrine";
	_mag addItemToUniform "ACE_morphine";
	_mag addItemToUniform "SWOP_E5M_Mag";
	};    
  };


			
["SWOP_CIS_magnaguard", "init",magma, true, [], true] call CBA_fnc_addClassEventHandler;

