_this setvariable ["gateToOpen1",Main_Gate_Front_1,true];
_this setvariable ["gateToOpen2",Main_Gate_Front_2,true];
_this setvariable ["gateToOpen3",Main_Gate_Front_1,true];
_this setvariable ["gateToOpen4",Main_Gate_Front_2,true];

_this  addAction ["<t color='#00FF00'>Open Gate</t>",
{

(_this select 0) getvariable "gateToOpen1" animateSource ["gate_door_1",1,3];
(_this select 0) getvariable "gateToOpen2" animateSource ["gate_door_1",1,3];
(_this select 0) getvariable "gateToOpen3" animateSource ["gate_door_2",1,3];
(_this select 0) getvariable "gateToOpen4" animateSource ["gate_door_2",1,3];

}
];

_this  addAction ["<t color='#00FF00'>Close Gate</t>",
{
(_this select 0) getvariable "gateToOpen1" animateSource ["gate_door_1",0,3];
(_this select 0) getvariable "gateToOpen2" animateSource ["gate_door_1",0,3];
(_this select 0) getvariable "gateToOpen3" animateSource ["gate_door_2",0,3];
(_this select 0) getvariable "gateToOpen4" animateSource ["gate_door_2",0,3];

}
];
