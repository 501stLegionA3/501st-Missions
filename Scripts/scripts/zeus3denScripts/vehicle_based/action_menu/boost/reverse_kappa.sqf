params ["_vic"];

comment "Variable Decs";

_vic  setvariable ["Speed",200,true];
_vic  setvariable ["turnon",true,true];


comment "Increment Speed";
_vic  addAction ["<t color='#A668C2'>Increment Cap by 10</t>",
{
(_this select 0)  setvariable ["Speed",(((_this select 0) getVariable "Speed")+10),true];
hint parseText format["<t color='#A668C2'> Cap set to:%1 Kmph</t>",((_this select 0) getVariable "Speed")];
},[1],0,false,true,"User16"," driver  _target == _this"];



comment "Decrement Speed";
_vic  addAction ["<t color='#FF69B4'>Decrement Cap by 10</t>",
{
(_this select 0)  setvariable ["Speed",(((_this select 0) getVariable "Speed")-10),true];
hint parseText format["<t color='#FF69B4'>Cap set to:%1 Kmph</t>",((_this select 0) getVariable "Speed")];
},[1],0,false,true,"User17"," driver  _target == _this"];




comment "Engage";
_vic  addAction ["<t color='#00FF00'>Engage Matter Stopper</t>",
{

(_this select 0) setvariable ["turnon",true,true];
hint parseText "<t color='#00FF00'>ENGAGING C.R.U.I.S.I.E Control System</t>";
while { (alive (_this select 0)) AND (((_this select 0) getvariable "turnon"))} do
{

_Multiplier = 0.4;
_Acceleration = 0.6;
_sleep_time_acceleration_loop = 0.1;
_Max_Multiplier = .1;
_Coef_mul=(-1)*((_Acceleration*_Multiplier/2)*(15*_sleep_time_acceleration_loop));


if ((speed (_this select 0)) > ((_this select 0) getVariable "Speed")) then { 

((_this select 0)) setVelocity 
[
(velocity ((_this select 0)) select 0)+((vectordir ((_this select 0))) select 0)*_Coef_mul,
(velocity ((_this select 0)) select 1)+((vectordir ((_this select 0))) select 1)*_Coef_mul,
(velocity ((_this select 0)) select 2)+((vectordir ((_this select 0))) select 2)*_Coef_mul
]

};


if (_Multiplier < _Max_Multiplier) then {_Multiplier = _Multiplier + 0.1*(15*_sleep_time_acceleration_loop)};
    
};
turnon=false;
},[1],0,false,true,"User18"," driver  _target == _this"];



comment "Disenage";
_vic  addAction ["<t color='#FFA500'>Disengage Matter Stopper</t>",
{
(_this select 0) setvariable ["turnon",false,true];
hint parseText "<t color='#FFA500'>DISENGAGING</t>";

hint parseText "<t color='#FFA500'>DRIVE DOWN</t>";
},[1],0,false,true,"User19"," driver  _target == _this"];













