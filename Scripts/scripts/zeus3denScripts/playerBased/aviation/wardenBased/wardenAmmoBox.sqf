
for [{_i=0}, {_i<7}, {_i=_i+1}] do
{
	_color="#(argb,8,8,3)color(1,0,0,1)";
_this setObjectTextureGlobal [_i,_color];
_this setObjectMaterialGlobal [_i, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
};


_this addAction ["<t color='#00FF00'>Add Warden Ammo</t>", {

params["_this","_user"];

_user  addAction ["<t color='#0000FF'>Resupply Ammo</t>",
{
(vehicle (_this select 0)) setVehicleAmmo 1;
}
];

_user groupChat format["%1 add warden ammo at time %2",(name _user),time];


comment "have after code";
for [{_i=0}, {_i<7}, {_i=_i+1}] do
{
	_color="#(argb,8,8,3)color(0,1,0,1)";
_this setObjectTextureGlobal [_i,_color];
_this setObjectMaterialGlobal [_i, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
};

sleep 1;




comment "reset";
for [{_i=0}, {_i<7}, {_i=_i+1}] do
{
	_color="#(argb,8,8,3)color(1,0,0,1)";
_this setObjectTextureGlobal [_i,_color];
_this setObjectMaterialGlobal [_i, "a3\characters_f_bootcamp\common\data\vrarmoremmisive.rvmat"];
};


}];



