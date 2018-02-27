
 _this setvariable ["Unit","swop_LAAT",false];
 _this setvariable ["height",1,flase];
 
 _this setvariable ["launchPad",pad_middle,true];
 
 
 
 _this  addAction ["<t color='#FF0000'>DO NOT USE IF YOU ARE NOT A PILOT</t>",
{

}
];


_this  addAction ["<t color='#00FF00'>Laat MK1</t>",
{
 (_this select 0) setvariable ["Unit","swop_LAAT",false];

}
];


_this  addAction ["<t color='#00FF00'>Laat MK2</t>",
{
(_this select 0) setvariable["Unit","swop_LAATmk2",false];
 
}
];


_this  addAction ["<t color='#F4A460 '>Laat MK2 74th</t>",
{
(_this select 0) setvariable["Unit","swop_LAATmk2_74",false];
  
}
];


_this  addAction ["<t color='#0000FF'>Laat MK2 104th</t>",
{
(_this select 0) setvariable["Unit","swop_LAATmk2_104",false];

}
];


_this  addAction ["<t color='#FF0000'>Laat MK2 Spec Op</t>",
{
(_this select 0) setvariable["Unit","swop_LAATmk2_spec",false];
 
}
];


_this  addAction ["<t color='#00f9ff'>Laat MK2 ARC</t>",
{
(_this select 0) setvariable["Unit","swop_LAATmk2_ARC",false];
  
}
];

_this  addAction ["<t color='#0000FF'>Laat Cargo</t>",
{
(_this select 0) setvariable["Unit","swop_LAAT_cargo",false];

}
];

_this  addAction ["<t color='#FF0000'>ARC-170</t>",
{
(_this select 0) setvariable["Unit","swop_arc_t",false];
 
}
];


_this  addAction ["<t color='#FFFF00'>Y-Wing</t>",
{
(_this select 0) setvariable["Unit","swop_ywclones",false];
  
}
];





_this  addAction ["Spawn Vehicle",
{

 _item=(_this select 0) getVariable  "Unit";
 _Z=  (_this select 0) getVariable "height";
 pad=(_this select 0) getVariable "launchPad";
 _unit=createVehicle [_item, [(getPos pad select 0), (getPos pad select 1), (getPos pad select 2)+_Z], [], 0,"CAN_COLLIDE"];
 _unit setDir (getDir pad);
 
 hint format["pad %1              unit %2",(pad),(_unit)];
 
}
];



