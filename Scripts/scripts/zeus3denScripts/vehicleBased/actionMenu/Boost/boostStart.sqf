params["_vic","_namMaxSpeed","_namMinSpeed","_namAccel"];



hint "ENGAGING FORWARD THRUSTERS";
if(speed _vic >= _namMinSpeed) then 
{
	while {((_pelican getvariable ["OPTRE_Thruster_EngagedStatus",false]) AND (alive _vic))} do
	{
		if (speed _vic <= 600) then {
			_vel = velocity _vic;
			_dir = direction _vic;
			_speed = _namAccel;//10
			_vic setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
			];
		};
		sleep 0.5;
	};
};