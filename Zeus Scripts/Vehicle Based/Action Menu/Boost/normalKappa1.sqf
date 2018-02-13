comment "Variable Decs";
_this allowDamage false;
_this  setvariable ["Speed",200,true];
_this  setvariable ["turnon",true,true];


comment "Increment Speed";
_this  addAction ["<t color='#A668C2'>Increment Speed by 10 -------- U16</t>",
{
(_this select 0)  setvariable ["Speed",(((_this select 0) getVariable "Speed")+10),true];
hint parseText format["<t color='#A668C2'> Speed set to:%1 Kmph</t>",((_this select 0) getVariable "Speed")];
},[1],0,false,true,"User16"," driver  _target == _this"];



comment "Decrement Speed";
_this  addAction ["<t color='#FF69B4'>Decrement Speed by 10 -------- U17</t>",
{
(_this select 0)  setvariable ["Speed",(((_this select 0) getVariable "Speed")-10),true];
hint parseText format["<t color='#FF69B4'>Speed set to:%1 Kmph</t>",((_this select 0) getVariable "Speed")];
},[1],0,false,true,"User17"," driver  _target == _this"];




comment "Engage";
_this  addAction ["<t color='#00FF00'>Engage C.R.U.I.S.I.E Control System -------- U18</t>",
{
(_this select 0) setobjecttextureglobal [1,"optre_vehicles\pelican\data\PelicanExterior_Black_CO.paa"];
(_this select 0) setvariable ["turnon",true,true];
hint parseText "<t color='#00FF00'>ENGAGING C.R.U.I.S.I.E Control System</t>";
while { (alive (_this select 0)) AND (((_this select 0) getvariable "turnon"))} do
{

_Multiplier = 0.4;
_Acceleration = 0.6;
_sleep_time_acceleration_loop = 0.1;
_Max_Multiplier = .1;
_Coef_mul=((_Acceleration*_Multiplier/2)*(15*_sleep_time_acceleration_loop));


if ((speed (_this select 0)) < ((_this select 0) getVariable "Speed")) then {
 ((_this select 0)) setVelocity 
 [
 (velocity ((_this select 0)) select 0)+((vectordir ((_this select 0))) select 0)*_Coef_mul,
 (velocity ((_this select 0)) select 1)+((vectordir ((_this select 0))) select 1)*_Coef_mul,
 (velocity ((_this select 0)) select 2)+((vectordir ((_this select 0))) select 2)*_Coef_mul
 ]
 };

if ((speed (_this select 0)) > ((_this select 0) getVariable "Speed")) then { 
_Coef_mul=-1*_Coef_mul;
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
_this  addAction ["<t color='#FFA500'>Disengage C.R.U.I.S.I.E Control System -------- U19</t>",
{
(_this select 0) setvariable ["turnon",false,true];
hint parseText "<t color='#FFA500'>DISENGAGING C.R.U.I.S.I.E Control System</t>";

hint parseText "<t color='#FFA500'>DRIVE DOWN</t>";
},[1],0,false,true,"User19"," driver  _target == _this"];



comment "Halt";
_this  addAction ["<t color='#FF0000'>Stop Driver -------- U20</t>",
{
(_this select 0) setvariable ["turnon",false,true];
hint parseText "<t color='#FF0000'>HALTING</t>";
while {(speed (_this select 0) > 10)} do
{
	hint "DRIVING DOWN NOW";
	_vel = velocity (_this select 0) ;
	_dir = direction (_this select 0) ;
	_speed = -3;
	(_this select 0) setVelocity [
	(_vel select 0) + (sin _dir * _speed),
	(_vel select 1) + (cos _dir * _speed),
	(_vel select 2)
	];
   
};
hint parseText "<t color='#FF0000'>HALTING</t>";
},[1],0,false,true,"User20"," driver  _target == _this"];







