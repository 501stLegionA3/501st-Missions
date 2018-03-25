//----------
//Now this file is called in the init.sqf. Thus whenever an independent AAF VR entity is spawned,this is ran

//general script
rexirandomswciv={
	params["_swciv"];
	
	removeallweapons _swciv;
	removeBackpack _swciv;
	removeVest _swciv;
//Uniforms to select from
	_SWUniforms = ["SWOP_Reb_f_WW_Bith_rebel_CombatUniform","SWOP_Reb_f_WB_Bith_rebel_CombatUniform","SWOP_RebGB_Bith_rebelI_CombatUniform","SWOP_RebDB_Bith_rebelI_CombatUniform","SWOP_RebB_Bith_rebelI_CombatUniform","SWOP_RebF_Bith_rebelI_CombatUniform","SWOP_RebU_Bith_rebelI_CombatUniform",
	"SWOP_RebW_Bith_rebelI_CombatUniform","SWOP_RebD_Bith_rebelI_CombatUniform","SWOP_RebDsvet_Bith_rebelI_CombatUniform","SWOP_RebWbr_Bith_rebelI_CombatUniform","SWOP_RebWdark_Bith_rebelI_CombatUniform","SWOP_RebC_Bith_rebelI_CombatUniform",
	"SWOP_bossk_CombatUniform","SWOP_c_21_CombatUniform","SWOP_Arena_F_CombatUniform","SWOP_dengar_CombatUniform","SWOP_RebDsvet_Drabata_rebelI_CombatUniform","SWOP_RebD_Drabata_rebelI_CombatUniform","SWOP_CIS_f_genosian_CombatUniform",
	"SWOP_CIS_f_genosian2_CombatUniform","SWOP_CIS_f_genosian3_CombatUniform","SWOP_CIS_f_genosian_worker_CombatUniform","SWOP_CIS_f_genosian_elite_CombatUniform","SWOP_GreClothes_F_CombatUniform","SWOP_GreClothes_BlBr_F_CombatUniform",
	"SWOP_GreClothes_BlBl_F_CombatUniform","SWOP_GreClothes_reb_F_CombatUniform","SWOP_GreClothes_ReBl_F_CombatUniform","SWOP_GreClothes_smug_F_CombatUniform","SWOP_GreClothes_FR_CombatUniform","SWOP_GreClothes_BlBr_FR_CombatUniform",
	"SWOP_GreClothes_BlBl_FR_CombatUniform","SWOP_GreClothes_reb_FR_CombatUniform","SWOP_GreClothes_ReBl_FR_CombatUniform","SWOP_GreClothes_smug_FR_CombatUniform","SWOP_tuskent_CombatUniform","SWOP_Reb_f_cape_kaleesh_CombatUniform",
	"SWOP_Reb_f_kaleesh_CombatUniform","SWOP_Reb_f_Kel_Dor_CombatUniform","SWOP_Reb_f_Kel_Dor2_CombatUniform","SWOP_Kota_F_CombatUniform","SWOP_Kota2_F_CombatUniform","SWOP_Reb_f_WW_mon_calamari_rebel_CombatUniform","SWOP_Reb_f_WB_mon_calamari_rebel_CombatUniform",
	"SWOP_RebGB_mon_calamari_rebelI_CombatUniform","SWOP_RebDB_mon_calamari_rebelI_CombatUniform","SWOP_RebB_mon_calamari_rebelI_CombatUniform","SWOP_RebF_mon_calamari_rebelI_CombatUniform","SWOP_RebU_mon_calamari_rebelI_CombatUniform",
	"SWOP_RebW_mon_calamari_rebelI_CombatUniform","SWOP_RebD_mon_calamari_rebelI_CombatUniform","SWOP_RebDsvet_mon_calamari_rebelI_CombatUniform","SWOP_RebWbr_mon_calamari_rebelI_CombatUniform","SWOP_RebWdark_mon_calamari_rebelI_CombatUniform",
	"SWOP_RebC_mon_calamari_rebelI_CombatUniform","SWOP_Reb_f_WW_togrutaI_CombatUniform","SWOP_Reb_f_WB_togrutaI_CombatUniform","SWOP_RebGB_togrutaI_CombatUniform","SWOP_RebDB_togrutaI_CombatUniform","SWOP_RebB_togrutaI_CombatUniform",
	"SWOP_RebF_togrutaI_CombatUniform","SWOP_RebU_togrutaI_CombatUniform","SWOP_RebW_togrutaI_CombatUniform","SWOP_RebD_togrutaI_CombatUniform","SWOP_RebDsvet_togrutaI_CombatUniform","SWOP_RebWbr_togrutaI_CombatUniform",
	"SWOP_RebWdark_togrutaI_CombatUniform","SWOP_RebC_togrutaI_CombatUniform","SWOP_Reb_f_WW_Twilek2_CombatUniform","SWOP_Reb_f_WB_Twilek2_CombatUniform","SWOP_RebGB_Twilek2I_CombatUniform","SWOP_RebDB_Twilek2I_CombatUniform","SWOP_RebB_Twilek2I_CombatUniform",
	"SWOP_RebF_Twilek2I_CombatUniform","SWOP_RebU_Twilek2I_CombatUniform","SWOP_RebW_Twilek2I_CombatUniform","SWOP_RebD_Twilek2I_CombatUniform","SWOP_RebDsvet_Twilek2I_CombatUniform","SWOP_RebWbr_Twilek2I_CombatUniform","SWOP_RebWdark_Twilek2I_CombatUniform",
	"SWOP_RebC_Twilek2I_CombatUniform","SWOP_Reb_f_WW_Twilek_CombatUniform","SWOP_Reb_f_WB_Twilek_CombatUniform","SWOP_RebGB_TwilekI_CombatUniform","SWOP_RebDB_TwilekI_CombatUniform","SWOP_RebB_TwilekI_CombatUniform",
	"SWOP_RebF_TwilekI_CombatUniform","SWOP_RebU_TwilekI_CombatUniform","SWOP_RebW_TwilekI_CombatUniform","SWOP_RebD_TwilekI_CombatUniform","SWOP_RebDsvet_TwilekI_CombatUniform","SWOP_RebWbr_TwilekI_CombatUniform",
	"SWOP_RebWdark_TwilekI_CombatUniform","SWOP_RebC_TwilekI_CombatUniform","SWOP_Reb_f_WW_vurkI_CombatUniform","SWOP_Reb_f_WB_vurkI_CombatUniform","SWOP_RebGB_vurkI_CombatUniform","SWOP_RebDB_vurkI_CombatUniform","SWOP_RebB_vurkI_CombatUniform",
	"SWOP_RebF_vurkI_CombatUniform","SWOP_RebU_vurkI_CombatUniform","SWOP_RebW_vurkI_CombatUniform","SWOP_RebD_vurkI_CombatUniform","SWOP_RebDsvet_vurkI_CombatUniform","SWOP_RebWbr_vurkI_CombatUniform","SWOP_RebWdark_vurkI_CombatUniform",
	"SWOP_RebC_vurkI_CombatUniform","SWOP_Mercenario1_f_WW_weequay_CombatUniform","SWOP_Mercenario2_f_WW_weequay_CombatUniform","SWOP_Mercenario3_f_WW_weequay_CombatUniform","SWOP_Reb_f_WW_weequay_rebel_CombatUniform",
	"SWOP_Reb_f_WB_weequay_rebel_CombatUniform","SWOP_RebGB_weequay_rebelI_CombatUniform","SWOP_RebDB_weequay_rebelI_CombatUniform","SWOP_RebB_weequay_rebelI_CombatUniform","SWOP_RebF_weequay_rebelI_CombatUniform",
	"SWOP_RebU_weequay_rebelI_CombatUniform","SWOP_RebW_weequay_rebelI_CombatUniform","SWOP_RebD_weequay_rebelI_CombatUnifom","SWOP_RebDsvet_weequay_rebelI_CombatUniform","SWOP_RebWbr_weequay_rebelI_CombatUniform",
	"SWOP_RebWdark_weequay_rebelI_CombatUniform","SWOP_RebC_weequay_rebelI_CombatUniform","SWOP_21B_uniform","SWOP_4lom_uniform","SWOP_C3PO_uniform","SWOP_hk47_uniform","SWOP_HK51_uniform","SWOP_ig88_unifrom"];
	_Uniformcount = count _SWUniforms;
//selects random uniform
	_swciv forceAddUniform (_SWUniforms select floor random _Uniformcount);
	
};//end SW Random Uniform Selector

["I_C_Soldier_Bandit_1_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_2_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_3_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_4_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_5_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_6_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_7_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
["I_C_Soldier_Bandit_8_F", "init",rexirandomswciv, true, [], true] call CBA_fnc_addClassEventHandler; 
		
	
								