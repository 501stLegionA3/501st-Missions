
try
{
wardenpads=[
[Main_Wardenpad,1],
[Armory_Wardenpad,1],
[Medical_Wardenpad,1]
];

wardenvics=[
["OPTRE_cart","<t color='#00FF00'>Wardenmobile</t>"],
["B_Truck_01_fuel_F","<t color='#00FF00'>Fuel Truck</t>"],
["B_Truck_01_ammo_F","<t color='#00FF00'>Ammo Truck</t>"],
["plp_ct_highsecContRed","<t color='#00FF00'>Large Medical</t>"],
["SWOP_BoxMedium3R","<t color='#00FF00'>Small Medical</t>"],
["plp_ct_highsecContWhite","<t color='#00FF00'>Large Ammo</t>"],
["SWOP_BoxMedium3W","<t color='#00FF00'>Small Ammo</t>"],
["swop_LAAT_cargo","<t color='#00FF00'>LAAT C</t>"],
["Republic_ATTE_RD501","<t color='#00FF00'>AT-TE</t>"],
["Republic_ATTE_RD501_M","<t color='#00FF00'>UAV AT-TE</t>"],
["FAT_MRAP","<t color='#00FF00'>MRAP Infantry</t>"],
["MFIT_MRAP","<t color='#00FF00'>MRAP Medical</t>"]
];


_this setVariable ["vicToSpawn",((wardenvics select 0) select 0), false];
_this setVariable ["padToSpawnOn",((wardenpads select 0) select 0), false];
_this setVariable ["heightOfPad",((wardenpads select 0) select 1), false];


for [{_i=0}, {_i<(count wardenvics)}, {_i=_i+1}] do
{

        titleOfAction=format["%1%2",_i, (wardenvics select _i) select 1];
        _this  addAction [titleOfAction,
                {

                itemNum=(_this select 2);
                (_this select 0) setVariable ["vicToSpawn",((wardenvics select itemNum) select 0), false];
            
            
                itemNum="";
                }];
        
};

_this  addAction ["<t color='#FF0000'>--------------------------------</t>",
{
	hint "no-CC Bondo ^.^";
}];
                
                

for [{_i=0}, {_i<(count wardenpads)}, {_i=_i+1}] do
{

        titleOfAction=format["%1 %2",_i, (wardenpads select _i) select 0];
                _this  addAction [titleOfAction,
                {

                itemNum=(_this select 2)-(count wardenvics)-1;
                
                (_this select 0) setVariable ["padToSpawnOn",((wardenpads select itemNum) select 0), false];
                (_this select 0) setVariable ["heightOfPad",((wardenpads select itemNum) select 1), false];
                
                
                itemNum="";
                }];
        
};



        _this  addAction ["<t color='#00FF00'>Spawn Vehicle</t>",
        {
        
        unitWardenVic=(_this select 0) getVariable "vicToSpawn";
        unitWardenPad=(_this select 0) getVariable "padToSpawnOn";
        unitWardenPadHeight=(_this select 0) getVariable "heightOfPad";
        
        _unit=createVehicle [unitWardenVic, [(getPosATL unitWardenPad select 0), (getPosATL unitWardenPad select 1), (getPosATL unitWardenPad select 2)+unitWardenPadHeight], [], 0,"CAN_COLLIDE"];
        _unit setDir (getDir unitWardenPad);

        
        _unit="";
        unitWardenVic="";
        unitWardenPad="";
        unitWardenPadHeight="";
        }];
}
catch
{
	hint ("Vicspawner is broken!");
}

//Fixed for V6 by CS Peterson