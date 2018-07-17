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
Respawn_truck_typename = "B_Truck_01_medical_F";							// This is the mobile respawn (and medical) truck. 																						Default is "B_Truck_01_medical_F".
huron_typename = "swop_LAAT_cargo";									// This is Spartan 01, a multipurpose mobile respawn as a helicopter. 																	Default is "B_Heli_Transport_03_unarmed_F".
opfor_ammobox_transport = "O_Truck_03_transport_F";							// Make sure this thing can transport ammo boxes (see box_transport_config in IA_liberation_config.sqf) otherwise things will break!	Default is "O_Truck_03_transport_F".
crewman_classname = "SWOP_CIS_droid_guard";									// This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "SWOP_CIS_droid_pilot";									// This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
IA_liberation_little_bird_classname = "swop_HMP_droidgunship_transport";							// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
IA_liberation_boat_classname = "B_Boat_Transport_01_F"; 					// These are the boats which spawn at the stern of the Freedom.																			Default is "B_Boat_Transport_01_F".
IA_liberation_small_storage_building = "ContainmentArea_02_sand_F";			// A small storage area for resources.																									Default is "ContainmentArea_02_sand_F".
IA_liberation_large_storage_building = "ContainmentArea_01_sand_F";			// A large storage area for resources.																									Default is "ContainmentArea_01_sand_F".
IA_liberation_recycle_building = "land_SW_K2SO";							// The building defined to unlock FOB recycling functionality.																			Default is "Land_CarService_F".
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
	["SWOP_CIS_droid_AT",10,0,0],
	["SWOP_CIS_droid_sergeant",10,0,0],
	["SWOP_CIS_droid_sniper",10,0,0],
	["SWOP_CIS_droid_mg",10,0,0],
	["SWOP_CIS_superdroid_B2",10,0,0],
	["SWOP_CIS_magnaguard",10,0,0],
	["SWOP_CIS_droid_com",10,0,0],
	["SWOP_CIS_droid_guard",10,0,0],
	["SWOP_CIS_droid_crew",10,0,0],
	["SWOP_CIS_droid_pilot",10,0,0],
	["SWOP_CIS_droid_tactic_black",10,0,0],
	["SWOP_CIS_droid_tactic_blue",10,0,0],
	["SWOP_CIS_droid_tactic_green",10,0,0],
	["SWOP_CIS_droid_tactic_red",10,0,0]
];

light_vehicles = [
	["SW_SpeederBike",100,150,100]								//M109A6
];

heavy_vehicles = [
	["O_SWOP_AAT_1",400,500,400],	
	["O_SWOP_Hailfire_1",400,500,400],	
	["O_SWOP_MTT_1",300,400,350]
];

air_vehicles = [
	["swcishoverdroid",75,0,75],
	["swop_hbomber",450,450,450],
	["swop_geofighter",350,200,200],
	["swop_tridroid",150,150,150],
	["swop_vulture",300,300,250],
	["swop_HMP_droidgunship",400,350,375],
	["swop_HMP_droidgunship_transport",250,0,250]
];

static_vehicles = [
	["SWOP_Droideka",75,50,0],											//Mk32A GMG 20mm										//Mk6 Mortar
	["SWOP_DroidekaCamo",75,50,0],
	["SWOP_DroidekaSupport",75,50,0],
	["SpiderDSD",150,150,0],
	["SpiderOG",450,200,0]
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
	"swcishoverdroid"
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad.
blufor_squad_inf_light = [
	"SWOP_CIS_camo_droid_sergeant",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_droid_mg",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid_AT",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid_sniper",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid"
];

// Heavy infantry squad.
blufor_squad_inf = [
	"SWOP_CIS_camo_droid_sergeant",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_droid_mg",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid_AT",
	"SWOP_CIS_superdroid_B2",
	"SWOP_CIS_camo_droid_sniper",
	"SWOP_CIS_superdroid_B2",
	"SWOP_CIS_superdroid_B2"
];

// AT specialists squad.
blufor_squad_at = [
	"SWOP_CIS_droid_sergeant",
	"SWOP_CIS_droid_AT",
	"SWOP_CIS_droid_AT",
	"SWOP_CIS_droid",
	"SWOP_CIS_droid",
	"SWOP_CIS_droid"
];

// AA specialists squad.
blufor_squad_aa = [
	"SWOP_CIS_droid_sergeant",
	"SWOP_CIS_droid_AT",
	"SWOP_CIS_droid_AT",
	"SWOP_CIS_droid",
	"SWOP_CIS_droid",
	"SWOP_CIS_droid"
];

// Force recon squad.
blufor_squad_recon = [
	"SWOP_CIS_camo_droid_sergeant",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_camo_droid",
	"SWOP_CIS_droid_mg",
	"SWOP_CIS_camo_droid"
];

// Paratroopers squad.
blufor_squad_para = [
	"SWOP_CIS_magnaguard",
	"SWOP_CIS_magnaguard",
	"SWOP_CIS_magnaguard",
	"SWOP_CIS_magnaguard",
	"SWOP_CIS_magnaguard",
	"SWOP_CIS_magnaguard",
	"SWOP_CIS_magnaguard"
];

//
//
//
//
//
//
/* - Badguy classnames.
All enemy infantry are defined here.	*/
opfor_officer = "SWOP_Clonetrooper_officer";								//Officer
opfor_team_leader = "SWOP_Clonetrooper_sergeant";									//Team Leader
opfor_squad_leader = "SWOP_Clonetrooper_sergeant";								//Squad Leader
opfor_sentry = "SWOP_Clonetrooper_recon";									//Rifleman (Lite)
opfor_rifleman = "SWOP_Clonetrooper";									//Rifleman
opfor_rpg = "SWOP_Clonetrooper_AA";												//Rifleman (LAT)
opfor_grenadier = "SWOP_Clonetrooper_mg";								//Grenadier
opfor_machinegunner = "SWOP_Clonetrooper_mg";								//Autorifleman
opfor_heavygunner = "SWOP_Clonetrooper_mg";							//Heavy Gunner
opfor_marksman = "SWOP_501_sniper";									//Marksman
opfor_sharpshooter = "SWOP_501_sniper";							//Sharpshooter
opfor_sniper = "SWOP_Clonetrooper_sniper";								//Sniper
opfor_at = "SWOP_Clonetrooper_AA";												//AT Specialist
opfor_aa = "SWOP_Clonetrooper_AA";												//AA Specialist
opfor_medic = "SWOP_Clonetrooper_P1_medic";											//Combat Life Saver
opfor_engineer = "SWOP_Clonetrooper_heavy_recon";									//Engineer
opfor_paratrooper = "SWOP_Clonetrooper_jumper";									//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "O_JM_TX130m1r_1";											//GAZ-233011
opfor_mrap_armed = "O_JM_TX130m2r_1";									//GAZ-233014 (Armed)
opfor_transport_helo = "swop_LAAT";							//Mi-8MT (Cargo)
opfor_transport_truck = "O_SWOP_HoverT_1";								//Ural-4320 Transport (Covered)
opfor_fuel_truck = "O_Truck_02_fuel_F";								//Ural-4320 Fuel
opfor_ammo_truck = "O_Truck_02_Ammo_F";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";				//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";				//Taru Ammo Pod
opfor_flag = "FlagCarrierTFKnight_EP1";										//Russian Flag

/*	Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often.
Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.	*/
militia_squad = [
	"SWOP_Clonetrooper",
	"SWOP_Clonetrooper_sergeant",
	"SWOP_Clonetrooper_AA",
	"SWOP_Clonetrooper_mg"	
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"O_JM_TX130r_1",
	"O_JM_TX130m1r_1",
	"O_JM_TX130m2r_1"
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
opfor_vehicles = [
	"O_JM_TX130r_1",
	"O_JM_TX130m1r_1",
	"O_JM_TX130m2r_1"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"SW_BARC"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"O_JM_TX130r_1",
	"O_JM_TX130m1r_1",
	"O_JM_TX130m2r_1"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"SW_BARC"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"O_JM_TX130r_1",
	"O_JM_TX130m1r_1",
	"O_JM_TX130m2r_1"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"swop_LAAT_cargo",
	"swop_LAAT",
	"swop_LAATmk2",
	"swop_LAATmk2_104",
	"swop_LAATmk2_74",
	"swop_LAATmk2_ARC",
	"swop_LAATmk2_spec"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"swop_arc_t",
	"swop_eta2_c1",
	"swop_eta2_c2",
	"swop_eta2_c3",
	"swop_Vwing",
	"swop_ywclones"
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
