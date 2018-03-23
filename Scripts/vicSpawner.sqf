pads=[
[pad_middle,1],
[pad_left,1],
[pad_right,1]
];


vics=[
["swop_LAAT","<t color='#00FF00'> Laat MK1</t>"],
["swop_LAATmk2","<t color='#00FF00'> Laat MK2</t>"],
["swop_LAATmk2_74","<t color='#F4A460 '> Laat MK2 74th</t>"],
["swop_LAATmk2_104","<t color='#0000FF'> Laat MK2 104th</t>"],
["swop_LAATmk2_spec","<t color='#FF0000'> Laat MK2 Spec Op</t>"],
["swop_LAATmk2_ARC","<t color='#00f9ff'> Laat MK2 ARC</t>"],
["swop_LAAT_cargo","<t color='#0000FF'> Laat Cargo</t>"],
["swop_arc_t","<t color='#FF0000'> ARC-170</t>"],
["swop_ywclones","<t color='#FFFF00'> Y-Wing</t>"]
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
                    hint "no-CC Bondo ^.^";
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
        
        _unit=createVehicle [unitVic, [(getPos unitPad select 0), (getPos unitPad select 1), (getPos unitPad select 2)+unitPadHeight], [], 0,"CAN_COLLIDE"];
        _unit setDir (getDir unitPad);
        
        
        _unit="";
        unitVic="";
        unitPad="";
        unitPadHeight="";
        }];
