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
crewman_classname = "SWOP_Clonetrooper_pilot";									// This defines the crew for vehicles. 																									Default is "B_crew_F".
pilot_classname = "SWOP_Clonetrooper_pilot";									// This defines the pilot for helicopters. 																								Default is "B_Helipilot_F".
IA_liberation_little_bird_classname = "swop_LAAT";							// These are the little birds which spawn on the Freedom or at Chimera base.															Default is "B_Heli_Light_01_F".
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
	["SWOP_101_a",10,0,0],
	["SWOP_101",10,0,0],
	["SWOP_101_shield",10,0,0],
	["SWOP_101_mg",10,0,0],
	["SWOP_104_a",10,0,0],
	["SWOP_104",10,0,0],
	["SWOP_104_mg",10,0,0],
	["SWOP_212_a",10,0,0],
	["SWOP_212",10,0,0],
	["SWOP_212_shadow",10,0,0],
	["SWOP_212_shield",10,0,0],
	["SWOP_212_mg",10,0,0],
	["SWOP_212_geon_r",10,0,0],
	["SWOP_212_geon_r_a",10,0,0],
	["SWOP_212_geon_r_SL",10,0,0],
	["SWOP_212_geon",10,0,0],
	["SWOP_212_geon_a",10,0,0],
	["SWOP_212_geon_mg",10,0,0],
	["SWOP_212_geon_SL",10,0,0],
	["SWOP_327_a",10,0,0],
	["SWOP_327",10,0,0],
	["SWOP_327_sniper",10,0,0],
	["SWOP_442_a",10,0,0],
	["SWOP_442",10,0,0],
	["SWOP_442_shield",10,0,0],
	["SWOP_442_mg",10,0,0],
	["SWOP_501_airborne",10,0,0],
	["SWOP_501_ARF",10,0,0],
	["SWOP_501_BARC",10,0,0],
	["SWOP_501_a",10,0,0],
	["SWOP_501",10,0,0],
	["SWOP_501_mg",10,0,0],
	["SWOP_501_AA",10,0,0],
	["SWOP_501_pilot",10,0,0],
	["SWOP_501_sniper",10,0,0],
	["SWOP_74_airborne",10,0,0],
	["SWOP_74_BARC",10,0,0],
	["SWOP_74_a",10,0,0],
	["SWOP_74",10,0,0],
	["SWOP_74_mg",10,0,0],
	["SWOP_74_AA",10,0,0],
	["SWOP_74_pilot",10,0,0],
	["SWOP_74_sniper",10,0,0],
	["SWOP_Clonetrooper_ARF",10,0,0],
	["SWOP_Clonetrooper_BARC",10,0,0],
	["SWOP_Clonetrooper_a",10,0,0],
	["SWOP_Clonetrooper_pilot",10,0,0],
	["SWOP_Clonetrooper_KS_SL",10,0,0],
	["SWOP_Clonetrooper_KS_a",10,0,0],
	["SWOP_Clonetrooper_KS",10,0,0]
];

light_vehicles = [
	["O_SWOP_HoverT_2",350,0,250],								//M109A6
	["O_SWOP_HoverTa_2",400,300,250],								//M109A6
	["O_SWOP_HoverTf_2",400,400,250],								//M109A6
	["O_SWOP_HoverTr_2",400,550,250],								//M109A6
	["O_JM_landspeeder_1",100,100,75],								//M109A6
	["SW_BARC",100,150,100]								//M109A6
];

heavy_vehicles = [
	["O_JM_TX130r_1",600,500,300],								//M109A6
	["O_JM_TX130m1r_1",600,500,300],								//M109A6
	["O_JM_TX130m2r_1",700,700,350]								//M109A6
];

air_vehicles = [
	["swclonerecondroid",75,0,25],									//R1 Recon Drone
	["swop_aw",350,300,375],										//Awing
	["swop_awchl",350,300,375],										//Awing
	["swop_awch",350,300,375],										//Awing
	["swop_awbl",350,300,375],										//Awing
	["swop_awb",350,300,375],										//Awing
	["swop_awgl",350,300,375],										//Awing
	["swop_awg",350,300,375],										//Awing
	["swop_awrl",350,300,375],										//Awing
	["swop_MF",350,300,375],										//Millennium Falcon
	["swop_xw",500,550,475],										//Xwing
	["swop_xwb",500,550,475],										//Xwing
	["swop_xwg",500,550,475],										//Xwing
	["swop_xwf",500,550,475],										//Xwing
	["swop_yw",500,550,475],										//Ywing - Rebels
	["swop_ywRed",500,550,475],										//Ywing - Rebels
	["swop_ywGreen",500,550,475],									//Ywing - Rebels
	["Swop_Uwing",500,550,475],										//Uwing
	["swop_arc_t",550,650,650],										//ARC-170
	["swop_eta2_c1",500,550,475],									//JediStarFighter
	["swop_eta2_c2",500,550,475],									//JediStarFighter
	["swop_eta2_c3",500,550,475],									//JediStarFighter
	["swop_Vwing",500,550,475],										//Vwing
	["swop_ywclones",500,550,475],									//Ywing - Clones
	["swop_LAAT_cargo",500,550,475]									//LAAT Cargo
	
];

static_vehicles = [
	["Republic_ATTE",500,500,0],
	["SW_AV7",500,500,0],
	["SW_FIELDGUN",500,500,0],
	["SW_DropTurretObject",200,150,0],
	["EWEBSWBF_REP",200,150,0],
	["PORTABLEGUN_REP",200,150,0]

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
	["B_Truck_01_transport_F",100,0,200]								//HEMTT Transport
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [
	["swclonerecondroid",75,0,25]									//R1 Recon Drone
];

// Pre-made squads for the commander build menu. These shouldn't exceed 10 members.
// Light infantry squad.
blufor_squad_inf_light = [
	"SWOP_101_a",
	"SWOP_101_a",
	"SWOP_101_a",
	"SWOP_101_a",
	"SWOP_101_a",
	"SWOP_101",
	"SWOP_101",
	"SWOP_101_mg",
	"SWOP_101"
];

// Heavy infantry squad.
blufor_squad_inf = [
	"SWOP_501_mg",
	"SWOP_501_mg",
	"SWOP_501_a",
	"SWOP_501_a",
	"SWOP_501",
	"SWOP_501",
	"SWOP_501_sniper",
	"SWOP_501_AA",
	"SWOP_501_a"
];

// AT specialists squad.
blufor_squad_at = [
	"SWOP_212_AA",
	"SWOP_212_AA",
	"SWOP_212_AA",
	"SWOP_212_a"
];

// AA specialists squad.
blufor_squad_aa = [
	"SWOP_212_AA",
	"SWOP_212_AA",
	"SWOP_212_AA",
	"SWOP_212_a"
];

// Force recon squad.
blufor_squad_recon = [
	"SWOP_101_a",
	"SWOP_101_a",
	"SWOP_101_a",
	"SWOP_101",
	"SWOP_101_mg",
	"SWOP_101"
];

// Paratroopers squad.
blufor_squad_para = [
	"SWOP_74_airborne",
	"SWOP_74_AA",
	"SWOP_74_mg",
	"SWOP_74_a",
	"SWOP_74_a",
	"SWOP_74_a",
	"SWOP_74_airborne",
	"SWOP_74_airborne",
	"SWOP_74_airborne",
	"SWOP_74_airborne"

];

//
//
//
//
//
//
/* - Badguy classnames.
All enemy infantry are defined here.	*/
opfor_officer = "SWOP_CIS_droid_tactic_black";						//Officer
opfor_team_leader = "SWOP_CIS_camo_droid_com";						//Team Leader
opfor_squad_leader = "SWOP_CIS_camo_droid_sergeant";				//Squad Leader
opfor_sentry = "SWOP_CIS_camo_droid";								//Rifleman (Lite)
opfor_rifleman = "SWOP_CIS_camo_droid";								//Rifleman
opfor_rpg = "SWOP_CIS_camo_droid_AT";								//Rifleman (LAT)
opfor_grenadier = "SWOP_CIS_camo_droid_AT";							//Grenadier
opfor_machinegunner = "SWOP_CIS_droid_mg";							//Autorifleman
opfor_heavygunner = "SWOP_CIS_droid_mg";							//Heavy Gunner
opfor_marksman = "SWOP_CIS_magnaguard";								//Marksman
opfor_sharpshooter = "SWOP_CIS_camo_droid_sniper";					//Sharpshooter
opfor_sniper = "SWOP_CIS_camo_droid_sniper";						//Sniper
opfor_at = "SWOP_CIS_camo_droid_AT";								//AT Specialist
opfor_aa = "SWOP_CIS_camo_droid_AT";								//AA Specialist
opfor_medic = "SWOP_CIS_droid_guard";								//Combat Life Saver
opfor_engineer = "SWOP_CIS_droid_pilot";							//Engineer
opfor_paratrooper = "SWOP_CIS_droid_guard";							//Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "O_SWOP_AAT_1";										//GAZ-233011
opfor_mrap_armed = "O_SWOP_AAT_1";									//GAZ-233014 (Armed)
opfor_transport_helo = "swop_HMP_droidgunship_transport";			//Mi-8MT (Cargo)
opfor_transport_truck = "O_SWOP_MTT_1";								//Ural-4320 Transport (Covered)
opfor_fuel_truck = "O_Truck_02_fuel_F";								//Ural-4320 Fuel
opfor_ammo_truck = "O_Truck_02_Ammo_F";								//GAZ-66 Ammo
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";			//Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";			//Taru Ammo Pod
opfor_flag = "FlagCarrierTFKnight_EP1";								//Russian Flag

/*	Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often.
Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.	*/
militia_squad = [
	"SWOP_CIS_droid_guard",
	"SWOP_CIS_droid",
	"SWOP_CIS_droid_sniper",
	"CAA_CIS_b2droid_laser",
	"CAA_CIS_Battledroid_AT",
	"SWOP_CIS_droid_pilot"
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders.
militia_vehicles = [
	"O_SWOP_AAT_1"													//GAZ-233014 (Armed)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels)
opfor_vehicles = [
	"O_SWOP_AAT_1",
	"O_SWOP_Hailfire_1",
	"O_SWOP_MTT_1"
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
	"O_SWOP_AAT_1"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
	"O_SWOP_AAT_1",
	"O_SWOP_Hailfire_1",
	"O_SWOP_MTT_1"
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
	"O_SWOP_AAT_1"
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.	*/
opfor_troup_transports = [
	"O_SWOP_MTT_1"
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
	"swop_HMP_droidgunship",
	"swop_HMP_droidgunship_transport"
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
	"swop_hbomber",
	"swop_geofighter",
	"swop_tridroid",
	"swop_vulture"
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
