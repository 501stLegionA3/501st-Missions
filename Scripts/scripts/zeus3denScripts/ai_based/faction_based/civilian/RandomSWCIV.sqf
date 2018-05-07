//----------
//Now this file is called in the init.sqf. Thus whenever an independent AAF VR entity is spawned,this is ran

//general script
rexirandomswciv={
	params["_swciv"];
//Uniforms to select from
	if (!isServer) exitWith {};
	_SWUniforms = ["SWOP_Reb_f_WW_Bith_rebel_CombatUniform","SWOP_Reb_f_WB_Bith_rebel_CombatUniform","SWOP_RebGB_Bith_rebelI_CombatUniform","SWOP_RebDB_Bith_rebelI_CombatUniform","SWOP_RebB_Bith_rebelI_CombatUniform","SWOP_RebF_Bith_rebelI_CombatUniform","SWOP_RebU_Bith_rebelI_CombatUniform",
	"SWOP_RebW_Bith_rebelI_CombatUniform","SWOP_RebD_Bith_rebelI_CombatUniform","SWOP_RebDsvet_Bith_rebelI_CombatUniform","SWOP_RebWbr_Bith_rebelI_CombatUniform","SWOP_RebWdark_Bith_rebelI_CombatUniform","SWOP_RebC_Bith_rebelI_CombatUniform",
	"SWOP_bossk_CombatUniform","SWOP_c_21_CombatUniform","SWOP_Arena_F_CombatUniform","SWOP_dengar_CombatUniform","SWOP_RebDsvet_Drabata_rebelI_CombatUniform","SWOP_RebD_Drabata_rebelI_CombatUniform",
	"SWOP_GreClothes_F_CombatUniform","SWOP_GreClothes_BlBr_F_CombatUniform",
	"SWOP_GreClothes_BlBl_F_CombatUniform","SWOP_GreClothes_reb_F_CombatUniform","SWOP_GreClothes_ReBl_F_CombatUniform","SWOP_GreClothes_smug_F_CombatUniform","SWOP_GreClothes_FR_CombatUniform","SWOP_GreClothes_BlBr_FR_CombatUniform",
	"SWOP_GreClothes_BlBl_FR_CombatUniform","SWOP_GreClothes_reb_FR_CombatUniform","SWOP_GreClothes_ReBl_FR_CombatUniform","SWOP_GreClothes_smug_FR_CombatUniform","SWOP_Reb_f_cape_kaleesh_CombatUniform",
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
	"SWOP_RebWdark_weequay_rebelI_CombatUniform","SWOP_RebC_weequay_rebelI_CombatUniform","SWOP_21B_uniform","SWOP_4lom_uniform","SWOP_C3PO_uniform","SWOP_hk47_uniform","SWOP_HK51_uniform","SWOP_ig88_unifrom",
	"SWOP_dengar_CombatUniform","SWOP_dengar_CombatUniform","SWOP_dengar_CombatUniform","SWOP_Trando_boloto_CombatUniform","SWOP_Trando_green_CombatUniform","SWOP_Trando_GB_CombatUniform","SWOP_Trando_grey_CombatUniform","SWOP_Trando_red_CombatUniform",
	"SWOP_Trando_wbr_CombatUniform","SWOP_Trando_wdr_CombatUniform","SWOP_RebB_FKI_CombatUniform","SWOP_RebF_FKI_CombatUniform","SWOP_RebU_FKI_CombatUniform","SWOP_rebels_FKI_CombatUniform","SWOP_RebD_FKI_CombatUniform","SWOP_RebDsvet_FKI_CombatUniform",
	"SWOP_rebelsbr_FKI_CombatUniform","SWOP_rebelsdark_FKI_CombatUniform","SWOP_RebC_FKI_CombatUniform","SWOP_RebGB_FDurosI_CombatUniform","SWOP_RebDB_FDurosI_CombatUniform","SWOP_RebB_FDurosI_CombatUniform","SWOP_RebF_FDurosI_CombatUniform","SWOP_RebU_FDurosI_CombatUniform",
	"SWOP_rebels_FDurosI_CombatUniform","SWOP_RebD_FDurosI_CombatUniform","SWOP_RebDsvet_FDurosI_CombatUniform","SWOP_rebelsbr_FDurosI_CombatUniform","SWOP_rebelsdark_FDurosI_CombatUniform","SWOP_RebC_FDurosI_CombatUniform","SWOP_Reb_f_WW_Chewbacca1_CombatUniform",
	"SWOP_Reb_f_WW_Chewbacca3_CombatUniform","SWOP_Reb_f_WW_Chewbacca5_CombatUniform","SWOP_Reb_f_WW_FII_CombatUniform","SWOP_Reb_f_WB_FII_CombatUniform","SWOP_RebGB_FII_CombatUniform","SWOP_RebDB_FII_CombatUniform","SWOP_RebB_FII_CombatUniform","SWOP_RebF_FII_CombatUniform",
	"SWOP_RebU_FII_CombatUniform","SWOP_rebels_FII_CombatUniform","SWOP_RebD_FII_CombatUniform","SWOP_RebDsvet_FII_CombatUniform","SWOP_rebelsbr_FII_CombatUniform","SWOP_rebelsdark_FII_CombatUniform","SWOP_RebC_FII_CombatUniform","SWOP_RebDB_FRI_CombatUniform",
	"SWOP_RebB_FRI_CombatUniform","SWOP_RebF_FRI_CombatUniform","SWOP_RebU_FRI_CombatUniform","SWOP_rebels_FRI_CombatUniform","SWOP_RebD_FRI_CombatUniform","SWOP_RebDsvet_FRI_CombatUniform","SWOP_rebelsbr_FRI_CombatUniform","SWOP_rebelsdark_FRI_CombatUniform",
	"SWOP_RebC_FRI_CombatUniform","SWOP_RebGreyB_FSI_CombatUniform","SWOP_RebGB_FSI_CombatUniform","SWOP_RebDB_FSI_CombatUniform","SWOP_RebB_FSI_CombatUniform","SWOP_RebF_FSI_CombatUniform","SWOP_RebU_FSI_CombatUniform","SWOP_rebels_FSI_CombatUniform","SWOP_RebD_FSI_CombatUniform",
	"SWOP_RebDsvet_FSI_CombatUniform","SWOP_rebelsbr_FSI_CombatUniform","SWOP_rebelsdark_FSI_CombatUniform","SWOP_RebDB_FRI_CombatUniform","SWOP_RebB_FRI_CombatUniform","SWOP_RebF_FRI_CombatUniform","SWOP_RebU_FRI_CombatUniform","SWOP_rebels_FRI_CombatUniform",
	"SWOP_RebD_FRI_CombatUniform","SWOP_RebDsvet_FRI_CombatUniform","SWOP_rebelsbr_FRI_CombatUniform","SWOP_rebelsdark_FRI_CombatUniform","SWOP_RebC_FRI_CombatUniform","SWOP_RebGreyB_FSI_CombatUniform","SWOP_RebGB_FSI_CombatUniform","SWOP_RebDB_FSI_CombatUniform","SWOP_RebB_FSI_CombatUniform","SWOP_RebF_FSI_CombatUniform",
	"SWOP_RebU_FSI_CombatUniform","SWOP_rebels_FSI_CombatUniform","SWOP_RebD_FSI_CombatUniform","SWOP_RebDsvet_FSI_CombatUniform","SWOP_rebelsbr_FSI_CombatUniform","SWOP_rebelsdark_FSI_CombatUniform",
	//make more chance of spawning
	"SWOP_21B_uniform","SWOP_4lom_uniform","SWOP_hk47_uniform","SWOP_HK51_uniform","SWOP_ig88_unifrom",
	"SWOP_21B_uniform","SWOP_4lom_uniform","SWOP_21B_uniform","SWOP_4lom_uniform","SWOP_21B_uniform","SWOP_4lom_uniform","SWOP_21B_uniform","SWOP_4lom_uniform"
	
	];
//selects random uniform
	_swciv forceAddUniform (selectRandom _SWUniforms);

	
};//end S					 Random Uniform Selector
				
["C_Soldier_VR_F", "init",rexirandomswciv, true, [], false] call CBA_fnc_addClassEventHandler; 
