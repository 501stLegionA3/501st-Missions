/*
 * kleinToHCs.sqf
 *
 * In the mission editor, name the Headless Clients "HC1", "HC2", "HC3" without the quotes
 *
 * In the mission init.sqf, call kleinToHCs.sqf with:
 * execVM "kleinToHCs.sqf";
 *
 * It seems that the dedicated server and headless client processes never use more than 20-22% CPU each.
 * With a dedicated server and 3 headless clients, that's about 88% CPU with 10-12% left over.  Far more efficient use of your processing power.
 *
 */
    
if (!isServer) exitWith {};

diag_log "kleinToHCs: Started";

//waitUntil {!isNil "HC1_1"};
//waitUntil {!isNull HC1_1};

//_HC_ID = -1; // Will become the Client ID of HC
//_HC2_ID = -1; // Will become the Client ID of HC2
//_HC3_ID = -1; // Will become the Client ID of HC3


diag_log format["kleinToHCs: First pass will begin in %1 seconds", rebalanceTimer];
[] spawn {

    rebalanceTimer = 120;  // Rebalance sleep timer in seconds
    cleanUpThreshold = 50; // Threshold of number of dead bodies + destroyed vehicles before forcing a clean up

	while {true} do {
	  // Rebalance every rebalanceTimer seconds to avoid hammering the server
	  sleep rebalanceTimer;

	  // Force clean up dead bodies and destroyed vehicles
	  if (count allDead > cleanUpThreshold) then {
		_numDeleted = 0;
		{
		  deleteVehicle _x;

		  _numDeleted = _numDeleted + 1;
		} forEach allDead;

		diag_log format ["kleinToHCs: Cleaned up %1 dead bodies/destroyed vehicles", _numDeleted];
	  };
	};
};