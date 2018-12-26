try
{
pads=[
[Landingpad_1,1],
[Landingpad_2,1],
[Landingpad_3,1],
[Landingpad_4,1]
];


vics=[
["laat_mk3","<t color='#00FF00'>LAAT MK3</t>"],
["RD501_LAAT_MK3_Doors","<t color='#00FF00'>LAAT MK3 Doors</t>"],
["RD501_LAAT_MK3_Doors_ARC","<t color='#00FF00'>LAAT MK3 Doors ARC</t>"],
["RD501_LAAT_MK3_Doors_SpecOps","<t color='#00FF00'>LAAT MK3 Doors SpecOps</t>"],
["laat_mk3_redMedic","<t color='#00FF00'>LAAT MK3 Rescue</t>"],
["laat_mk3_blackblueKrayt","<t color='#00FF00'>LAAT MK3 Stealth Blue Krayt</t>"],
["laat_mk3_blackredKrayt","<t color='#00FF00'>LAAT MK3 Stealth Red Krayt</t>"],
["laat_mk3_blackwhiteKrayt","<t color='#00FF00'>LAAT MK3 Stealth White Krayt</t>"],
["laat_mk3_redKrayt","<t color='#00FF00'>LAAT MK3 Red Krayt</t>"],
["laat_mk3_blueKrayt","<t color='#00FF00'>LAAT MK3 Blue Krayt</t>"],
["laat_mk3_rangerEnforcer","<t color='#00FF00'>LAAT MK3 Ranger Enforcer</t>"],
["laat_mk3_Laathawkdown","<t color='#00FF00'>LAATHAWKDOWN</t>"],
["arc180","<t color='#00FF00'>ARC-170</t>"],
["swop_delta7a_RD501","<t color='#00FF00'>Interceptor Heavy</t>"],
["vwing_heavy","<t color='#00FF00'>V-Wing</t>"],
["super_ywing","<t color='#00FF00'>Y-Wing</t>"]
];

_this setVariable ["vicToSpawn",((vics select 0) select 0), false];
_this setVariable ["padToSpawnOn",((pads select 0) select 0), false];
_this setVariable ["heightOfPad",((pads select 0) select 1), false];


for [{_i=0}, {_i<(count vics)}, {_i=_i+1}] do
{

        titleOfAction=format["%1%2",_i, (vics select _i) select 1];
        _this  addAction [titleOfAction,
                {

                itemNum=(_this select 2);
                (_this select 0) setVariable ["vicToSpawn",((vics select itemNum) select 0), false];
            
            
                itemNum="";
                }];
        
};

_this  addAction ["<t color='#FF0000'>--------------------------------</t>",
{
	hint "";
}];
                
                

for [{_i=0}, {_i<(count pads)}, {_i=_i+1}] do
{

        titleOfAction=format["%1 %2",_i, (pads select _i) select 0];
                _this  addAction [titleOfAction,
                {

                itemNum=(_this select 2)-(count vics)-1;
                
                (_this select 0) setVariable ["padToSpawnOn",((pads select itemNum) select 0), false];
                (_this select 0) setVariable ["heightOfPad",((pads select itemNum) select 1), false];
                
                
                itemNum="";
                }];
        
};



        _this  addAction ["<t color='#00FF00'>Spawn Vehicle</t>",
        {
        
        unitVic=(_this select 0) getVariable "vicToSpawn";
        unitPad=(_this select 0) getVariable "padToSpawnOn";
        unitPadHeight=(_this select 0) getVariable "heightOfPad";
        
        _unit=createVehicle [unitVic, [(getPosATL unitPad select 0), (getPosATL unitPad select 1), (getPosATL unitPad select 2)+unitPadHeight], [], 0,"CAN_COLLIDE"];
        _unit setDir (getDir unitPad);

        
        _unit="";
        unitVic="";
        unitPad="";
        unitPadHeight="";
        }];
}
catch
{
	hint ("Vicspawner is broken!");
}

//fixed for V6 by Peterson