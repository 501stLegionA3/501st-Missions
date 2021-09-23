// START 501st INIT

_EndSplashScreen = {
    for "_x" from 1 to 4 do {
        endLoadingScreen;
        sleep 3;
    };
};
[] spawn _EndSplashScreen;

// END 501st INIT

// START CUSTOM INIT

// Load keys
// red_key, blue_key, green_key

key_store = createHashMap;
publicVariable "key_store";

client = clientOwner;
publicVariable "client";

// END CUSTOM INIT