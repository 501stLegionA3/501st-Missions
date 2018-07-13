// If you want more modifications to be supported by this file, let's discuss it on the forums.

// No required mods.
// RHS USAF, BWMod, F-15C, F/A-18 are optional (just load the mods on server & client).
// Apex & Jets DLC are also included but not required (required only to drive/pilot anything from each DLC inc/ the Tanoa map).

/* - Support classnames.
Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not, just don't try!	*/
FOB_typename = "land_ContMining_open";										// This is the main FOB HQ building. 																									Default is "Land_Cargo_HQ_V1_F".
FOB_box_typename = "B_Slingload_01_Cargo_F";								// This is the FOB as a container. 																										Default is "B_Slingload_01_Cargo_F".
FOB_truck_typename = "B_Truck_01_box_F";									// This is the FOB as a vehicle.																										Default is "B_Truck_01_box_F".
Arsenal_typename = "B_supplyCrate_F";										// This is the virtual arsenal as portable supply crates.  																				Default is "B_supplyCrate_F".
Respawn_truck_typename = "B_Truck_01_medical_F";			// This is the mobile respawn (and medical) truck. 																						Default is "B_Truck_01_medical_F".
huron_typename = "swop_LAAT_cargo";								// This is Spartan 01, a multipurpose mobile respawn as a helicopter. 																	Default is "B_Heli_Transport_03_unarmed_F".
opfor_ammobox_transport = "O_Truck_03_transport_F";							// Make sure this thing can transport ammo boxes (see box_transport_config in IA_liberation_config.sqf) otherwise things will break!	Default is "O_Truck_03_transport_F".
crewman_classname = "SWOP_Storm_crewman";								// This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "SWOP_Navy_Pilot";							// This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
IA_liberation_little_bird_classname = "swop_LAAT";	// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
IA_liberation_boat_classname = "B_Boat_Transport_01_F"; 					// These are the boats which spawn at the stern of the Freedom.																			Default is "B_Boat_Transport_01_F".
IA_liberation_small_storage_building = "ContainmentArea_02_sand_F";			// A small storage area for resources.																									Default is "ContainmentArea_02_sand_F".
IA_liberation_large_storage_building = "ContainmentArea_01_sand_F";			// A large storage area for resources.																									Default is "ContainmentArea_01_sand_F".
IA_liberation_recycle_building = "land_SW_K2SO";						// The building defined to unlock FOB recycling functionality.																			Default is "Land_CarService_F".
IA_liberation_air_vehicle_building = "Land_Mining_drill";					// The building defined to unlock FOB air vehicle functionality.																		Default is "Land_Radar_Small_F".
IA_liberation_heli_slot_building = "Land_HelipadSquare_F";					// The helipad used to increase the GLOBAL rotary-wing cap.																				Default is "Land_HelipadSquare_F".
IA_liberation_plane_slot_building = "Land_TentHangar_V1_F";					// The hangar used to increase the GLOBAL fixed-wing cap.																				Default is "Land_TentHangar_V1_F".
IA_liberation_supply_crate = "CargoNet_01_box_F";							// This defines the supply crates, as in resources.																						Default is "CargoNet_01_box_F".
IA_liberation_ammo_crate = "B_CargoNet_01_ammo_F";							// This defines the ammunition crates.																									Default is "B_CargoNet_01_ammo_F".
IA_liberation_fuel_crate = "CargoNet_01_barrels_F";							// This defines the fuel crates.

/* - Friendly classnames.
Each array below represents one of the 7 pages within the build menu.
Format: ["vehicle_classname",supplies,ammunition,fuel],	Example: ["B_APC_Tracked_01_AA_F",300,150,150],
The above example is the NATO IFV-6a Cheetah, it costs 300 supplies, 150 ammunition and 150 fuel to build.	*/
infantry_units = [
	["SWOP_Storm_Cap",10,0,0],
	["SWOP_Storm_crewman",10,0,0],
	["SWOP_Storm_Lt",10,0,0],
	["SWOP_Storm_magmatrooper",10,0,0],
	["SWOP_Storm_magmatrooper_dlt",10,0,0],
	["SWOP_Storm_magmatrooper_t",10,0,0],
	["SWOP_Storm_magmatrooper_AA",10,0,0],
	["SWOP_Storm_magmatrooper_TL",10,0,0],
	["SWOP_Storm_shoretrooper",10,0,0],
	["SWOP_Storm_shoretrooper_dlt",10,0,0],
	["SWOP_Storm_shoretrooper_t",10,0,0],
	["SWOP_Storm_shoretrooper_AA",10,0,0],
	["SWOP_Storm_shoretrooper_SL",10,0,0],
	["SWOP_Storm_shoretrooper_sergeant",10,0,0],
	["SWOP_Storm_skytrooper",10,0,0],
	["SWOP_Storm_stormtrooper",10,0,0],
	["SWOP_Storm_stormtrooper_dlt",10,0,0],
	["SWOP_Storm_stormtrooper_t",10,0,0],
	["SWOP_Storm_stormtrooper_AA",10,0,0],
	["SWOP_Storm_stormtrooper_Corp",10,0,0],
	["SWOP_Storm_jumper",10,0,0],
	["SWOP_Storm_stormtrooper_SL",10,0,0],
	["SWOP_Storm_stormtrooper_TL",10,0,0]
];

light_vehicles = [
	["O_SWOP_HoverT_1",350,0,250],						//M109A6
	["O_SWOP_HoverTa_1",400,300,250],					//M109A6
	["O_SWOP_HoverTf_1",400,400,250],					//M109A6
	["O_SWOP_HoverTr_1",400,550,250],					//M109A6
	["SW_SpeederBike",100,100,75]						//M109A6
];

heavy_vehicles = [
	["O_JM_TX130_1",400,100,300],								//M109A6
	["O_JM_TX130m1_1",500,300,300],								//M109A6
	["O_JM_TX130m2_1",600,500,350],								//M109A6
	["O_CAA_TX225_1",200,100,150]								//M109A6
];

air_vehicles = [
	["swop_tiedef",450,450,300],										//CH-47 Chinook (Armed)
	["swop_tie_int",200,150,250],										//CH-47 Chinook (Armed)
	["swop_tie",250,250,200],										//CH-47 Chinook (Armed)
	["swop_tietorpe",250,350,200],
	["swop_tieb",500,450,350],
	["swop_TIE_Stryker",500,200,200],
	["swop_tiex1",350,400,250],
	["swop_Scimitar",500,500,400],
	["swop_lambda",200,0,200],
	["SWOP_Dio_Droid",75,0,50],
	["SWOP_interrogationdroid",75,0,50],
	["SWOP_ProbeViper_Droid",75,0,50]
];

static_vehicles = [
	["ATACT_Torreta",250,500,0],											//Mk30A HMG .50
	["ATSTst",125,200,0],										//Mk30 HMG .50 (Raised)
	["EWEBSWBF",25,60,0],											//Mk32A GMG 20mm										//Mk6 Mortar
	["NavyGunIm",250,200,0],
	["Imperial_TurboLaser",350,300,0],
	["Imperial_TurboLaser2",400,350,0]
];

buildings = [
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["Land_Cargo_Tower_V1_F",0,0,0],
	["Flag_NATO_F",0,0,0],
	["Flag_UK_F",0,0,0],
	["Flag_US_F",0,0,0],
	["Flag_White_F",0,0,0],
	["Land_Medevac_house_V1_F",0,0,0],
	["Land_Medevac_HQ_V1_F",0,0,0],
	["Flag_RedCrystal_F",0,0,0],
	["CamoNet_BLUFOR_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["Land_PortableLight_double_F",0,0,0],
	["Land_HelipadCircle_F",0,0,0],										//Strictly aesthetic - as in it does not increase helicopter cap!
	["PortableHelipadLight_01_blue_F",0,0,0],
	["PortableHelipadLight_01_green_F",0,0,0],
	["PortableHelipadLight_01_red_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["MapBoard_stratis_F",0,0,0],
	["MapBoard_seismic_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_empty_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_PaperBox_closed_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_GasTank_01_blue_F",0,0,0],
	["Land_GasTank_01_khaki_F",0,0,0],
	["Land_GasTank_01_yellow_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_BarrelWater_F",0,0,0],
	["Land_BarrelWater_grey_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_BagFence_Short_F",0,0,0],
	["Land_BagFence_Long_F",0,0,0],
	["Land_BagFence_Corner_F",0,0,0],
	["Land_BagFence_End_F",0,0,0],
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_HBarrier_1_F",0,0,0],
	["Land_HBarrier_3_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierBig_F",0,0,0],
	["Land_HBarrierWall4_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierWall_corridor_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_CncBarrierMedium_F",0,0,0],
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_Concrete_SmallWall_4m_F",0,0,0],
	["Land_Concrete_SmallWall_8m_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_CncWall1_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_Sign_WarningMilitaryArea_F",0,0,0],
	["Land_Sign_WarningMilAreaSmall_F",0,0,0],
	["Land_Sign_WarningMilitaryVehicles_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0],
	["Land_barricada",0,0,0],
	["Land_wall_laser",0,0,0],
	["Land_corner_laser",0,0,0]


];

support_vehicles = [
	[Arsenal_typename,100,200,0],
	[Respawn_truck_typename,200,0,75],
	[FOB_box_typename,300,500,0],
	[FOB_truck_typename,300,500,75],
	[IA_liberation_small_storage_building,0,0,0],
	[IA_liberation_large_storage_building,0,0,0],
	[IA_liberation_recycle_building,250,0,0],
	[IA_liberation_air_vehicle_building,1000,0,0],
	[IA_liberation_heli_slot_building,250,0,0],
	[IA_liberation_plane_slot_building,500,0,0],
	["ACE_medicalSupplyCrate_advanced",50,0,0],
	["ACE_Box_82mm_Mo_HE",50,40,0],
	["ACE_Box_82mm_Mo_Smoke",50,10,0],
	["ACE_Box_82mm_Mo_Illum",50,10,0],
	["B_APC_Tracked_01_CRV_F",500,250,350],								//CRV-6e Bobcat
	["B_Truck_01_Repair_F",325,0,75],									//HEMTT Repair
	["B_Truck_01_fuel_F",125,0,275],									//HEMTT Fuel
	["B_Truck_01_ammo_F",125,200,75],									//HEMTT Ammo
	["B_Slingload_01_Repair_F",275,0,0],								//Huron Repair
	["B_Slingload_01_Fuel_F",75,0,200],									//Huron Fuel
	["B_Slingload_01_Ammo_F",75,200,0],									//Huron Ammo
	["B_Truck_01_transport_F",100,0,200]									//HEMTT Transport
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	"SWOP_Dio_Droid",
	"SWOP_interrogationdroid",
	"SWOP_ProbeViper_Droid"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad.
blufor_squad_inf_light = [
	"SWOP_Storm_stromtrooper",
	"SWOP_Storm_stromtrooper_dlt",
	"SWOP_Storm_stromtrooper_t",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_Corp",
	"SWOP_Storm_jumper",
	"SWOP_Storm_stromtrooper_SL",
	"SWOP_Storm_stromtrooper_TL"	
];

// Heavy infantry squad.
blufor_squad_inf = [
	"SWOP_Storm_stromtrooper",
	"SWOP_Storm_stromtrooper",
	"SWOP_Storm_stromtrooper",
	"SWOP_Storm_stromtrooper_dlt",
	"SWOP_Storm_stromtrooper_dlt",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_t"
];

// AT specialists squad.
blufor_squad_at = [
	"SWOP_Storm_stromtrooper",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_SL"
];

// AA specialists squad.
blufor_squad_aa = [
	"SWOP_Storm_stromtrooper",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_AA",
	"SWOP_Storm_stromtrooper_SL"
];

// Force recon squad.
blufor_squad_recon = [
	"SWOP_Scout_scout",
	"SWOP_Scout_jumper",
	"SWOP_Scout_sniper",
	"SWOP_Scout_trooper"	
];

// Paratroopers squad.
blufor_squad_para = [
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper",
	"SWOP_Storm_jumper"
];
//
//
//
//
//
//
/* - Badguy classnames.
All enemy infantry are defined here.	*/
opfor_officer = "SWOP_Rebel_wood_com";								//Officer
opfor_team_leader = "SWOP_Rebel_wood_e11";									//Team Leader
opfor_squad_leader = "SWOP_Rebel_wood_serg";								//Squad Leader
opfor_sentry = "SWOP_Rebel_wood_demolisher";									//Rifleman (Lite)
opfor_rifleman = "SWOP_Rebel_wood_a280";									//Rifleman
opfor_rpg = "SWOP_Rebel_wood_aa";												//Rifleman (LAT)
opfor_grenadier = "SWOP_Rebel_wood_jumper";								//Grenadier
opfor_machinegunner = "SWOP_Rebel_wood_mg";								//Autorifleman
opfor_heavygunner = "SWOP_Rebel_wood_assault";							//Heavy Gunner
opfor_marksman = "SWOP_Rebel_wood_sniper";									//Marksman
opfor_sharpshooter = "SWOP_Rebel_wood_sniper";							//Sharpshooter
opfor_sniper = "SWOP_Rebel_wood_sniper";								//Sniper
opfor_at = "SWOP_Rebel_wood_aa";												//AT Specialist
opfor_aa = "SWOP_Rebel_wood_aa";												//AA Specialist
opfor_medic = "SWOP_Rebel_wood_med";											//Combat Life Saver
opfor_engineer = "SWOP_Rebel_cloud_a280";									//Engineer
opfor_paratrooper = "SWOP_Rebel_cloud_jumper";									//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "O_SWOP_HoverT_2";											//GAZ-233011
opfor_mrap_armed = "O_SWOP_HoverTa_2";									//GAZ-233014 (Armed)
opfor_transport_helo = "Scar_Uwing";							//Mi-8MT (Cargo)
opfor_transport_truck = "O_SWOP_HoverT_2";								//Ural-4320 Transport (Covered)
opfor_fuel_truck = "O_Truck_02_fuel_F";								//Ural-4320 Fuel
opfor_ammo_truck = "O_Truck_02_Ammo_F";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "FlagCarrierTFKnight_EP1";										//Russian Flag

/*	Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often.
Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.	*/
militia_squad = [
	"SWOP_Rebel_wood_com",
	"SWOP_Rebel_wood_e11",
	"SWOP_Rebel_wood_mg",
	"SWOP_Rebel_wood_sniper",
	"SWOP_Rebel_wood_aa",
	"SWOP_Rebel_wood_assault"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"O_SWOP_HoverT_2",
	"O_SWOP_HoverTa_2",
	"O_SWOP_HoverTf_2",
	"O_SWOP_HoverTr_2",
	"O_JM_landspeeder_1",
	"SW_SpeederBikeR"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
opfor_vehicles = [
	"O_SWOP_HoverT_2",
	"O_SWOP_HoverTa_2",
	"O_SWOP_HoverTf_2",
	"O_SWOP_HoverTr_2",
	"O_JM_landspeeder_1",
	"SW_SpeederBikeR"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"O_SWOP_HoverTf_1",													//GAZ-233014 (Armed)
	"O_SWOP_HoverTa_1"													//GAZ-233014 (Armed)

];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"O_SWOP_HoverT_2",
	"O_SWOP_HoverTa_2",
	"O_SWOP_HoverTf_2",
	"O_SWOP_HoverTr_2",
	"O_SWOP_landspeeder_1",
	"SW_SpeederBikeR",
	"O_JM_TX130m1r_1",													//BMP-2K
	"O_JM_TX130m2r_1",													//BRM-1K
	"O_JM_TX130r_1"														//ZSU-23-4V
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"O_SWOP_HoverTf_2",													//GAZ-233014 (Armed)
	"O_SWOP_HoverTa_2",													//GAZ-233014 (Armed)
	"O_SWOP_HoverTr_2",													//GAZ-233014 (Armed)															//BMP-2D
	"O_JM_TX130m1r_1",													//BMP-2K
	"O_JM_TX130r_1"															//ZSU-23-4V
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"O_SWOP_HoverT_1",													//Ural-4320 Transport
	"O_SWOP_HoverTa_1"													//Ural-4320 Transport (Covered)

];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"swop_MF",														//Su-25
	"swop_xw",														//Su-25 (KH29)
	"swop_aw",
	"swop_ywGreen"
];

/*	- Other various mission classnames.
Civilian classnames.	*/
civilians = [
	"C_man_p_beggar_F",
	"C_man_polo_1_F",
	"C_man_polo_2_F",
	"C_man_polo_3_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_6_F",
	"C_man_1_1_F",
	"C_man_hunter_1_F",
	"C_journalist_F",
	"C_man_w_worker_F"

];

// Civilian vehicle classnames.
civilian_vehicles = [
	"C_Quadbike_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_Offroad_01_repair_F",
	"C_SUV_01_F",
	"C_Van_01_fuel_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Truck_02_fuel_F",
	"C_Truck_02_transport_F",
	"C_Truck_02_covered_F",
	"C_Truck_02_box_F"

];

// Elite vehicles that should be unlocked through military base capture.
elite_vehicles = [
];

if (IA_liberation_debug) then {private _text = format ["[IA LIBERATION] [DEBUG] Unit preset %1 intitialized for: %2", IA_liberation_preset, (name player)];_text remoteExec ["diag_log",2];};
