try
{
pads=[
[MynockPad_1,1],
[MynockPad_2,1],
[MynockPad_3,1],
[MynockPad_4,1]
];


vics=[
["RD501_bantha_501st_MkI","<t color='#00FF00'>Bantha IFV</t>"],
["RD501_Longbow_Republic","<t color='#00FF00'>Longbow AA</t>"],
["RD501_Glaive_Mynock","<t color='#00FF00'>Glaive TD</t>"],
["RD501_warden_tank_mobile","<t color='#00FF00'>Overseer ASV</t>"],
["RD501_warden_tank_field","<t color='#00FF00'>Overseer ASV Turbo</t>"],
["RD501_rocket_ordinance_tank_republic","<t color='#00FF00'>Catapult ROT</t>"],
["RD501_heavy_ordinance_tank_republic","<t color='#00FF00'>Trebuchet HOT</t>"],
["RD501_Claymore_Republic","<t color='#00FF00'>Claymore MBT</t>"],
["RD501_T1000_Republic","<t color='#00FF00'>T1000 MBT</t>"],
["RD501_Warhammer_Republic","<t color='#00FF00'>Warhammer MBT</t>"]
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