params["_vic","_namMinSpeed","_namDeAccel"];





hint format["DISENGAGING FORWARD THRUSTERS\n\nACTIVATING AIR BRAKES"];
while {(!(_vic getvariable ["OPTRE_Thruster_EngagedStatus",false]) AND (speed _vic > _namMinSpeed))} do
{
	_vel = velocity _vic;
	_dir = direction _vic;
	_speed = _namDeAccel;//-10
	_vic setVelocity [
	(_vel select 0) + (sin _dir * _speed), 
	(_vel select 1) + (cos _dir * _speed), 
	(_vel select 2)
	];
	sleep 0.5;
};
 