/*
	LAATCMonitor.SQF
	
	Custom script for SWOP's LAAT/c cargo bird for loading and unloading objects (vehicles, turrets, crates etc) with
	options to customize attaching and detaching positions for specific object types
	JIP and MP Compatible and works alongside slingloading
	
	Written for Arma 3's Star Wars Opposition Mod by ^bdc	January 2018
*/

	// Global Configuration Vars
co18_BDC_LAATCMonitor_AirCargoTypes = ["swop_LAAT_cargo"]; // default: "swop_LAAT_cargo" contingent on classname change
co18_BDC_LAATCMonitor_ExcludedObjects = ["B_HMG_01_A_F","O_SWOP_HoverTa_2","O_SWOP_HoverTr_2"]; // List of any classnames of objects we do NOT want to be able to pick up
co18_BDC_LAATCMonitor_ReverseObjects = ["SW_AV7"]; // Object to load in 180* direction
co18_BDC_LAATCMonitor_IncludeAircraft = true; // If true, parent class 'Air' will be included in scan search and loading functionality (default: false)
co18_BDC_LAATCMonitor_IncludeAircraftObjects = [ // List of aircraft classes (by object classname) that will be able to be loaded (if other air are not in this list, they will be automatically excluded)
	"swop_LAAT","swop_LAATmk2","swop_LAATmk2_104","swop_LAATmk2_74","swop_LAATmk2_ARC","swop_LAATmk2_spec" // LAAT gunships
	];
co18_BDC_LAATCMonitor_ForceEmptyCrewOnly = false; // If true, LAAT cargo bird will only load vehicle objects that are empty of any player or AI crew
co18_BDC_LAATCMonitor_ParachuteDropAlt = 40; // Terrain altitude, in meters, that cargo bird will automatically add a parachute to object being dropped (set to 0 to disable) (default: 40)
co18_BDC_LAATCMonitor_SearchPoint = [0,-2,-6]; // back behind and lower a bit (default: [0,-2,-6]
co18_BDC_LAATCMonitor_ScanRange = 7.5; // Scan range, in meters radius from the configured SearchPoint behind and under the cargo bird, that we'll look for a compatible object we can attach (default: 7.5)
co18_BDC_LAATCMonitor_AttachPoint = [0,-2,-1.5]; // default: [0,-2,-1.5]
co18_BDC_LAATCMonitor_SpecificAttachPoints = [ // List of specific object classes or config classes (as a list in array form) that have specific attachment points to the underside of the bird
	// Array structure: [["classname or type","classname","classname"],[x,y,z]],
	[["Republic_ATTE"],[0,-1.65,-7.75]], // Republic AT-TE turret tank monstrosity
	[["SW_FIELDGUN"],[0,-2.5,-6.75]], // Republic large turret - move it back a bit so the main turret isn't sticking thru the cockpit
	[["SW_AV7"],[0,-4,-9]], // AV7
	[["B_UGV_01_rcws_F"],[0,-3.65,-6.75]], // ATTE Composition
	[["O_JM_TX130r_1","O_JM_TX130m1r_1","O_JM_TX130m2r_1","O_JM_TX130_1","O_JM_TX130m1_1","O_JM_TX130m2_1"],[0,0,-4.0]], // Sabre tanks raised up due to short body
	[["Slingload_base_F","Slingload_01_Base_F"],[0,-3,-1.5]], // Cargo containers - move back and up
	[["swop_LAAT","swop_LAATmk2","swop_LAATmk2_104","swop_LAATmk2_74","swop_LAATmk2_ARC","swop_LAATmk2_spec"],[0,0,-4.35]] // LAAT gunships
];
co18_BDC_LAATCMonitor_DetachPoint = [0,0,-3.0]; // Detach point relative to the attached point of the cargo object - Do we want to move it left/right, forward/back, or up/down any when we detach?
co18_BDC_LAATCMonitor_SpecificDetachPoints = [ // List of specific objects that require a specific detachment point (such as vehicles with length turrets) relative to the attached point of that object
	[["Republic_ATTE"],[0,-2,-2]],  // Republic AT-TE move it back some to prevent turret from sticking to LAAT cockpit body
	[["SW_AV7"],[0,0,-1.25]], // AV7 turret
	[["Slingload_base_F","Slingload_01_Base_F"],[0,0,-1.5]], // Cargo containers - lower a bit
	[["swop_LAAT","swop_LAATmk2","swop_LAATmk2_104","swop_LAATmk2_74","swop_LAATmk2_ARC","swop_LAATmk2_spec"],[0,0,-5.25]] // LAAT gunships
];
co18_BDC_LAATCMonitor_SpecificParachuteAttachPoints = [ // Specific attach points of unloaded object to parachute per classname
	[["Republic_ATTE"],1.25], // Array structure: [["Classname1","Classname2",etc],-2] // Where classnames1 and 2 will attach themselves to the parachute at 2 meters above 0,0,0 relative to the chute itself
	[["swop_LAAT","swop_LAATmk2","swop_LAATmk2_104","swop_LAATmk2_74","swop_LAATmk2_ARC","swop_LAATmk2_spec"],3.75] // LAAT gunships
];
co18_BDC_LAATCMonitor_MinimumLoadAlt = 4; // default: 4
co18_BDC_LAATCMonitor_MinimumDropAlt = 5.5; // default: 5.5 to 6 - Set to 5m as absolute minimum lowest due to larger objects such as the AT-TE to prevent collisions

// Attach cargo chute function
co18_BDC_LAATCMonitor_AttachCargoParachuteFunc = {
	_Object = _this select 0;
	diag_log format["(LAAT/C Monitor) AttachCargoParachuteFunc spawned. Created chute for %1 %2",_Object,typeOf _Object];
	sleep 3.5;
	_Chute = createVehicle ["B_Parachute_02_F", (getPos _Object), [], 0, "FLY"];
	_Chute setPos (getPos _Object);
	_Chute setDir (getDir _Object);
	_Chute allowDamage false;
	_ZPos = -0.65;
	_isCrate = (_Object isKindOf "Slingload_base_F" || _Object isKindOf "ReammoBox_F" || _Object isKindOf "ReammoBox");
	if (!_isCrate) then {
		_ZPos = 1.65; // Attach object to chute higher than chute's 0,0,0 to help prevent collision with ground when landing - default attach point for larger objects
	};
	_Type = typeOf _Object; 
	_FoundSpecific = false;
	{
		_Array = _x;
		_VTypes = _Array select 0;
		_AttachZ = _Array select 1;
		if (_Type in _VTypes && !_FoundSpecific) then {
			_ZPos = _AttachZ;
			_FoundSpecific = true;
			diag_log format["(LAAT/C Monitor) Found custom attach point for parachute: %1",_ZPos];
		};
	} forEach co18_BDC_LAATCMonitor_SpecificParachuteAttachPoints;
	_Object attachTo [_Chute,[0,0,_ZPos]];
};

// Server-side EH to manage parachuting
if (isServer || isDedicated) then {
	"CO18_BDC_LAATCMonitor_AttachCargoParachute" addPublicVariableEventhandler {
		_Object = _this select 1;
		diag_log format["(LAAT/C Monitor) AttachCargoParachute EH called for Object %1 %2.",_Object,typeOf _Object];
		[_Object] spawn co18_BDC_LAATCMonitor_AttachCargoParachuteFunc;
	};
};

if (!hasInterface) exitWith {}; // Only players from here on out

// Reset loading and unloading scroll actions and global vars
co18_BDC_r_player_LoadViVCargo = -1;
co18_BDC_r_player_UnloadViVCargo = -1;
co18_BDC_r_player_CheckViVCargo = -1;
co18_BDC_r_player_DisableParachute = -1;
co18_BDC_r_player_EnableParachute = -1;
co18_BDC_r_player_nearestViVObject = objNull;

_MonitorPlayerAircraft = {
	diag_log format["(LAAT/C Monitor) Starting monitor loop."];
	while {true} do {
			// Vehicles work-around
		if (alive player && (vehicle player != player)) then {
			_Vehicle = vehicle player;
			_VehType = typeOf _Vehicle;
			_isDriver = false;
			if (driver _Vehicle == player) then { _isDriver = true; };
			if (!alive _Vehicle) then { _isDriver = false; };
				// LAAT Cargo bird ViV loading of objects
			if (_isDriver && (_VehType in co18_BDC_LAATCMonitor_AirCargoTypes)) then {
					// Gather altitude and speed
				_vAlt = round ((getposATL _Vehicle) select 2);
				_vSpeed = round(speed _Vehicle);
					// See if there's any actual ViV cargo loaded in (from Zeus or editor presumably)
				_ViVCargoArray = getVehicleCargo _Vehicle;
				if (count _ViVCargoArray > 0) then {
					_ViVObj = _ViVCargoArray select 0;
					_Vehicle setVariable ["VehViVCargo",_ViVObj,true]; // Convert to our system so we can unload it our way
				};
					// Flag to DISABLE ViV cargo loading
				_isEnabled = false;
				_isEnabled = _Vehicle getVariable ["ViVCargoEnabled",false];
				if (_isEnabled) then { // Only runs once per live vehicle once first pilot enters
					//_Vehicle enableVehicleCargo true;
					_Vehicle setVariable ["ViVCargoEnabled",false,true];
					diag_log format["Cargo bird %1 %2 ViV cargo loading disabled.",_Vehicle,typeOf _Vehicle];
				}; 
					// Check and Unload cargo
				//_VehViVCargo = getVehicleCargo _Vehicle;
				_VehViVCargo = _Vehicle getVariable ["VehViVCargo",objNull];
				_ParachuteDropDisabled = _Vehicle getVariable ["CargoParachuteDisabled",false];
					// Disable/enable automatic cargo parachute
				if (co18_BDC_LAATCMonitor_ParachuteDropAlt > 0) then {
					if (_ParachuteDropDisabled) then {
						if (co18_BDC_r_player_EnableParachute < 0) then {
							co18_BDC_r_player_EnableParachute = player addAction ["Enable Parachute for Cargo Drop", {
								(vehicle player) setVariable ["CargoParachuteDisabled",false,true];
								hint format["Automatic parachute for cargo drop enabled. Cargo will automatically drop with attached parachute when dropped from altitudes of %1 meters and above.",co18_BDC_LAATCMonitor_ParachuteDropAlt];
								player removeAction co18_BDC_r_player_EnableParachute;
								co18_BDC_r_player_EnableParachute = -1;
							}];
						};
					} else {
						if (co18_BDC_r_player_DisableParachute < 0) then {
							co18_BDC_r_player_DisableParachute = player addAction ["Disable Parachute for Cargo Drop", {
								(vehicle player) setVariable ["CargoParachuteDisabled",true,true];
								hint "Automatic parachute for cargo drop disabled.";
								player removeAction co18_BDC_r_player_DisableParachute;
								co18_BDC_r_player_DisableParachute = -1;
							}];
						};
					};
				};
				if !(isNull _VehViVCargo) then {
						// Check ViV loaded cargo
					if (co18_BDC_r_player_CheckViVCargo < 0) then {
						_ObjTxt = getText (configFile >> "CfgVehicles" >> typeOf _VehViVCargo >> "displayName");
						_FStr = format["Analyze Attached Cargo %1",_ObjTxt];
						co18_BDC_r_player_CheckViVCargo = player addAction [_FStr, {
							_Vehicle = vehicle player;
							_VehViVCargo = _Vehicle getVariable ["VehViVCargo",objNull];
							s_player_HintCtr = 40;
							_ObjTxt = getText (configFile >> "CfgVehicles" >> typeOf _VehViVCargo >> "displayName");
							_Fuel = round(fuel _VehViVCargo);
							_FuelTxt = round(_Fuel * 100);
							_Damage = getDammage _VehViVCargo;
							_DamageTxt = round (_Damage / 100);
							_CrewNum = count (crew _VehViVCargo);
							hint format["Attached Cargo:\n%1\n\nFuel: %2 percent\nDamage: %3 percent\nCrew Number: %4",_ObjTxt,_FuelTxt,_DamageTxt,_CrewNum];
							player removeAction co18_BDC_r_player_CheckViVCargo;
							co18_BDC_r_player_CheckViVCargo = -1;
						}];
					};
						// Unload
					if (_vAlt >= co18_BDC_LAATCMonitor_MinimumDropAlt) then {
						if (co18_BDC_r_player_UnloadViVCargo < 0) then {
							_ObjTxt = getText (configFile >> "CfgVehicles" >> typeOf _VehViVCargo >> "displayName");
							_FStr = format["Unload %1",_ObjTxt];
							/*
							if (_vAlt >= co18_BDC_LAATCMonitor_ParachuteDropAlt && (co18_BDC_LAATCMonitor_ParachuteDropAlt > 15)) then { // absolute minimum 15 meters
								_FStr = format["Unload %1 (Parachute)",_ObjTxt];
							}; */
							co18_BDC_r_player_UnloadViVCargo = player addAction [_FStr, {
								_Vehicle = vehicle player;
								_VehViVCargo = _Vehicle getVariable ["VehViVCargo",objNull];
								s_player_HintCtr = 30;
								_ObjTxt = getText (configFile >> "CfgVehicles" >> typeOf _VehViVCargo >> "displayName");
								private["_DetachPoint"];
								_DetachPoint = _VehViVCargo modelToWorld co18_BDC_LAATCMonitor_DetachPoint; // default
								_Vehicle allowDamage false;
									// Find our detachment point
								_FoundDetachPt = false;
								{
									_Selection = _x;
									_ClassArray = _Selection select 0;
									_PosArray = _Selection select 1;
									{
										_ClassStr = _x;
										if (typeOf _VehViVCargo == _ClassStr || _VehViVCargo isKindOf _ClassStr && !_FoundDetachPt) then {
											_DetachPoint = _VehViVCargo modelToWorld _PosArray;
											_FoundDetachPt = true;
										};
									} forEach _ClassArray;
								} forEach co18_BDC_LAATCMonitor_SpecificDetachPoints;
								detach _VehViVCargo;
								_VehViVCargo setPos _DetachPoint; // Move to detach point
								_VehViVCargo allowDamage false; // Temp invulnerability for our attached object
								_VehViVCargo enableRopeAttach true;
									// Attach parachute?
								_vAlt = round ((getposATL _Vehicle) select 2);
								_ParachuteDropDisabled = _Vehicle getVariable ["CargoParachuteDisabled",false];
								hint format["Unloading %1...",_ObjTxt];
								if ((_vAlt >= co18_BDC_LAATCMonitor_ParachuteDropAlt) && (co18_BDC_LAATCMonitor_ParachuteDropAlt > 15) && !_ParachuteDropDisabled) then { // Ping server to create and attach chute
									if (isServer) then {
										[_VehViVCargo] spawn co18_BDC_LAATCMonitor_AttachCargoParachuteFunc;
									} else {
										CO18_BDC_LAATCMonitor_AttachCargoParachute = _VehViVCargo;
										publicVariableServer "CO18_BDC_LAATCMonitor_AttachCargoParachute";
									};
									hint format["Unloading %1 with parachute...",_ObjTxt];
								};
									// Brief sleep before making cargo bird vulnerable
								sleep 0.5;
								_Vehicle allowDamage true;
								_Vehicle setVariable ["VehViVCargo",objNull,true]; // reset our cargo variable
										// Set specific position here?
								player removeAction co18_BDC_r_player_LoadViVCargo;
								co18_BDC_r_player_LoadViVCargo = -1;
								player removeAction co18_BDC_r_player_UnloadViVCargo;
								co18_BDC_r_player_UnloadViVCargo = -1;
								player removeAction co18_BDC_r_player_CheckViVCargo;
								co18_BDC_r_player_CheckViVCargo = -1;
								r_nearestViVObject = objNull;
								sleep 4; // Disallow further actions for 5 seconds after unloading
								_VehViVCargo allowDamage true;
							}];
						};
					} else {
						player removeAction co18_BDC_r_player_UnloadViVCargo;
						co18_BDC_r_player_UnloadViVCargo = -1;
					};
				};
					// Search for nearestObjects to load cargo
				_ScanPoint = _Vehicle modelToWorld co18_BDC_LAATCMonitor_SearchPoint;
				_nearestObjects = [];
				if (isNull _VehViVCargo) then {
					_nearestObjects = nearestObjects [_ScanPoint, ["LandVehicle","Slingload_base_F","ReammoBox_F","ReammoBox","StaticWeapon","StaticCannon","StaticMGWeapon","Air"], co18_BDC_LAATCMonitor_ScanRange];
						// Remove attached object if it's popping up in our nearestObjects scan - Also remove any that are in the excluded list - Remove dead objects as well
					if (count _nearestObjects > 0) then {
						{
							if ((_Vehicle == _x) || _VehViVCargo == _x || (typeOf _x in co18_BDC_LAATCMonitor_ExcludedObjects) || (!alive _x) || (_x == player)) then {
								_nearestObjects = _nearestObjects - [_x];
							};
								// Empty crew only?
							if (co18_BDC_LAATCMonitor_ForceEmptyCrewOnly && (count (crew _x) > 0)) then {
								_nearestObjects = _nearestObjects - [_x];
							};
								// Exclude any non-specified aircraft
							if ((_x isKindOf "Air" && !co18_BDC_LAATCMonitor_IncludeAircraft) || (_x isKindOf "Air" && !(typeOf _x in co18_BDC_LAATCMonitor_IncludeAircraftObjects))) then {
								_nearestObjects = _nearestObjects - [_x];
							};
						} forEach _nearestObjects;
					};
				};
				if (count _nearestObjects == 0) then {
					player removeAction co18_BDC_r_player_LoadViVCargo;
					co18_BDC_r_player_LoadViVCargo = -1;
				};
				if (count _nearestObjects > 0) then {
					co18_BDC_r_player_nearestViVObject = _nearestObjects select 0;
					_TypeNO = typeOf co18_BDC_r_player_nearestViVObject;
					if ((co18_BDC_r_player_nearestViVObject != _VehViVCargo) && (co18_BDC_r_player_nearestViVObject isKindOf "StaticCannon" || co18_BDC_r_player_nearestViVObject isKindOf "StaticMGWeapon" || co18_BDC_r_player_nearestViVObject isKindOf "Car" || co18_BDC_r_player_nearestViVObject isKindOf "Tank" || co18_BDC_r_player_nearestViVObject isKindOf "ReammoBox" || co18_BDC_r_player_nearestViVObject isKindOf "ReammoBox_F" || co18_BDC_r_player_nearestViVObject isKindOf "Slingload_base_F" || (co18_BDC_r_player_nearestViVObject isKindOf "Air" && co18_BDC_LAATCMonitor_IncludeAircraft)) && (_vSpeed <= 15) && (_vAlt >= co18_BDC_LAATCMonitor_MinimumLoadAlt)) then {
						_Txt = getText (configFile >> "CfgVehicles" >> _TypeNO >> "displayName");
						_FStr = format["Load %1",_Txt];
						if (co18_BDC_r_player_LoadViVCargo < 0) then {
							co18_BDC_r_player_LoadViVCargo = player addAction [_FStr, {
								_Vehicle = vehicle player;
								_Txt = getText (configFile >> "CfgVehicles" >> (typeOf co18_BDC_r_player_nearestViVObject) >> "displayName");
								s_player_HintCtr = 30;
								hint format["%1 has been loaded.",_Txt];
								_Vehicle setVariable ["VehViVCargo",co18_BDC_r_player_nearestViVObject,true];
								co18_BDC_r_player_nearestViVObject enableRopeAttach false;
									// Find attachment point
								private["_AttachPoint"];
								_AttachPoint = co18_BDC_LAATCMonitor_AttachPoint; // default
								_FoundSpecific = false;
								{
									_Selection = _x;
									_ClassArray = _Selection select 0;
									_PosArray = _Selection select 1;
									{
										_ClassStr = _x;
										if ((co18_BDC_r_player_nearestViVObject isKindOf _ClassStr || typeOf co18_BDC_r_player_nearestViVObject == _ClassStr) && !_FoundSpecific) then {
											_FoundSpecific = true;
											_AttachPoint = _PosArray;
										};
									} forEach _ClassArray;
								} forEach co18_BDC_LAATCMonitor_SpecificAttachPoints;
								co18_BDC_r_player_nearestViVObject attachTo [_Vehicle, _AttachPoint];
									// Reverse direction
								if (typeOf co18_BDC_r_player_nearestViVObject in co18_BDC_LAATCMonitor_ReverseObjects) then {
									_VDir = getDir _Vehicle;
									_ReverseDir = _VDir + 180;
									co18_BDC_r_player_nearestViVObject setDir _ReverseDir;
								};
								player removeAction co18_BDC_r_player_LoadViVCargo;
								co18_BDC_r_player_LoadViVCargo = -1;
								co18_BDC_r_player_nearestViVObject = objNull;
								player removeAction co18_BDC_r_player_UnloadViVCargo;
								co18_BDC_r_player_UnloadViVCargo = -1;
							}];
						};
					} else {
						player removeAction co18_BDC_r_player_LoadViVCargo;
						co18_BDC_r_player_LoadViVCargo = -1;
						co18_BDC_r_player_nearestViVObject = objNull;
					};
				};
			} else {
				player removeAction co18_BDC_r_player_LoadViVCargo;
				co18_BDC_r_player_LoadViVCargo = -1;
				player removeAction co18_BDC_r_player_UnloadViVCargo;
				co18_BDC_r_player_UnloadViVCargo = -1;
				player removeAction co18_BDC_r_player_CheckViVCargo;
				co18_BDC_r_player_CheckViVCargo = -1;
				co18_BDC_r_player_nearestViVObject = objNull;
			};
		} else {
			/*
				// If vehicle is dead and we have cargo attached, destroy it too
			_VehViVCargo = (vehicle player) getVariable ["VehViVCargo",objNull];
			if (!alive _Vehicle && !(isNull _VehViVCargo)) then {
				detach _VehViVCargo;
				_VehViVCargo setDamage 1;
			}; */
			player removeAction co18_BDC_r_player_LoadViVCargo;
			co18_BDC_r_player_LoadViVCargo = -1;
			player removeAction co18_BDC_r_player_UnloadViVCargo;
			co18_BDC_r_player_UnloadViVCargo = -1;
			player removeAction co18_BDC_r_player_CheckViVCargo;
			co18_BDC_r_player_CheckViVCargo = -1;
			co18_BDC_r_player_nearestViVObject = objNull;
			player removeAction co18_BDC_r_player_EnableParachute;
			co18_BDC_r_player_EnableParachute = -1;
			player removeAction co18_BDC_r_player_DisableParachute;
			co18_BDC_r_player_DisableParachute = -1;
		};
		sleep 1;
	};
};

[] spawn _MonitorPlayerAircraft;

diag_log format["(LAAT/C Monitor) Script running."];
