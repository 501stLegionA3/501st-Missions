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

waitUntil {!isNil "HC1_1"};
waitUntil {!isNull HC1_1};

_HC_ID = -1; // Will become the Client ID of HC
_HC2_ID = -1; // Will become the Client ID of HC2
_HC3_ID = -1; // Will become the Client ID of HC3
rebalanceTimer = 60;  // Rebalance sleep timer in seconds
cleanUpThreshold = 50; // Threshold of number of dead bodies + destroyed vehicles before forcing a clean up

diag_log format["kleinToHCs: First pass will begin in %1 seconds", rebalanceTimer];

while {true} do {
  // Rebalance every rebalanceTimer seconds to avoid hammering the server
  sleep rebalanceTimer;

  // Do not enable load balancing unless more than one HC is present
  // Leave this variable false, we'll enable it automatically under the right conditions  
  _loadBalance = false;

   // Get HC Client ID else set variables to null
   try {
    _HC_ID = owner HC1_1;

    if (_HC_ID > 2) then {
      diag_log format ["kleinToHCs: Found HC with Client ID %1", _HC_ID];
    } else { 
      diag_log "kleinToHCs: [WARN] HC disconnected";

      HC1_1 = objNull;
      _HC_ID = -1;
    };
  } catch { diag_log format ["kleinToHCs: [ERROR] [HC1_1] %1", _exception]; HC1_1 = objNull; _HC_ID = -1; };

  // Get HC2 Client ID else set variables to null
  if (!isNil "HC2_1") then {
    try {
      _HC2_ID = owner HC2_1;

      if (_HC2_ID > 2) then {
        diag_log format ["kleinToHCs: Found HC2 with Client ID %1", _HC2_ID];
      } else { 
        diag_log "kleinToHCs: [WARN] HC2 disconnected";
        
        HC2_1 = objNull;
        _HC2_ID = -1;
      };
    } catch { diag_log format ["kleinToHCs: [ERROR] [HC2_1] %1", _exception]; HC2_1 = objNull; _HC2_ID = -1; };
  };

  // Get HC3 Client ID else set variables to null
  if (!isNil "HC3_1") then {
    try {
      _HC3_ID = owner HC3_1;

      if (_HC3_ID > 2) then {
        diag_log format ["kleinToHCs: Found HC2 with Client ID %1", _HC3_ID];
      } else { 
        diag_log "kleinToHCs: [WARN] HC3 disconnected";
        
        HC3_1 = objNull;
        _HC3_ID = -1;
      };
    } catch { diag_log format ["kleinToHCs: [ERROR] [HC3_1] %1", _exception]; HC3_1 = objNull; _HC3_ID = -1; };
  };

  // If no HCs present, wait for HC to rejoin
  if ( (isNull HC1_1) && (isNull HC2_1) && (isNull HC3_1) ) then { waitUntil {!isNull HC1_1}; };  
  
  // Check to auto enable Round-Robin load balancing strategy
  if ( (!isNull HC1_1 && !isNull HC2_1) || (!isNull HC1_1 && !isNull HC3_1) || (!isNull HC2_1 && !isNull HC3_1) ) then { _loadBalance = true; };
  
  if ( _loadBalance ) then {
    diag_log "kleinToHCs: Starting load-balanced transfer of AI groups to HCs";
  } else {
    // No load balancing
    diag_log "kleinToHCs: Starting transfer of AI groups to HC";
  };

  // Determine first HC to start with
  _currentHC = 0;

  if (!isNull HC1_1) then { _currentHC = 1; } else { 
    if (!isNull HC2_1) then { _currentHC = 2; } else { _currentHC = 3; };
  };

  // Pass the AI
  _numTransfered = 0;
  {
    _swap = true;

    // If a player is in this group, don't swap to an HC
    { if (isPlayer _x) then { _swap = false; }; } forEach (units _x);

    // If load balance enabled, round robin between the HCs - else pass all to HC
    if ( _swap ) then {
      _rc = false;

      if ( _loadBalance ) then {
        switch (_currentHC) do {
          case 1: { _rc = _x setGroupOwner _HC_ID; if (!isNull HC2_1) then { _currentHC = 2; } else { _currentHC = 3; }; };
          case 2: { _rc = _x setGroupOwner _HC2_ID; if (!isNull HC3_1) then { _currentHC = 3; } else { _currentHC = 1; }; };
          case 3: { _rc = _x setGroupOwner _HC3_ID; if (!isNull HC1_1) then { _currentHC = 1; } else { _currentHC = 2; }; };
          default { diag_log format["kleinToHCs: [ERROR] No Valid HC to pass to.  _currentHC = %1", _currentHC]; };
        };
      } else {
        switch (_currentHC) do {
          case 1: { _rc = _x setGroupOwner _HC_ID; };
          case 2: { _rc = _x setGroupOwner _HC2_ID; };
          case 3: { _rc = _x setGroupOwner _HC3_ID; };
          default { diag_log format["kleinToHCs: [ERROR] No Valid HC to pass to.  _currentHC = %1", _currentHC]; };
        };
      };

      // If the transfer was successful, count it for accounting and diagnostic information
      if ( _rc ) then { _numTransfered = _numTransfered + 1; };
    };
  } forEach (allGroups);

  if (_numTransfered > 0) then {
    // More accounting and diagnostic information

    diag_log format ["kleinToHCs: Transfered %1 AI groups to HC(s)", _numTransfered];

    _numHC = 0;
    _numHC2 = 0;
    _numHC3 = 0;

    {
      switch (owner ((units _x) select 0)) do {
        case _HC_ID: { _numHC = _numHC + 1; };
        case _HC2_ID: { _numHC2 = _numHC2 + 1; };
        case _HC3_ID: { _numHC3 = _numHC3+ 1; };
      };
    } forEach (allGroups);

    if (_numHC > 0) then { diag_log format ["kleinToHCs: %1 AI groups currently on HC1_1", _numHC]; };
    if (_numHC2 > 0) then { diag_log format ["kleinToHCs: %1 AI groups currently on HC2_1", _numHC2]; };
    if (_numHC3 > 0) then { diag_log format ["kleinToHCs: %1 AI groups currently on HC3_1", _numHC3]; };
      
    diag_log format ["kleinToHCs: %1 AI groups total across all HC(s)", (_numHC + _numHC2 + _numHC3)];
  } else {
    diag_log "kleinToHCs: No rebalance or transfers required this round";
  };

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