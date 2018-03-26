try 
{
	params["_vic","_namMinSpeed","_namDeAccel"];




	_vic setvariable ["OPTRE_Thruster_EngagedStatus",false,true];
	hint format["DISENGAGING FORWARD THRUSTERS\n\nACTIVATING AIR BRAKES"];
	while {(!(_vic getvariable ["OPTRE_Thruster_EngagedStatus",false]) AND (speed _vic > _namMinSpeed))} do
	{
		_vel = velocity _vic;
		_dir = direction _vic;
		_speed = abs(_namDeAccel);//-10
		
		/*optre boost logic
		_vic setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2)
		];
		*/ 
		
		//f-18 blakc mega hornet boost logic in reverse
		(_vic) setVelocity 
		 [
		 (velocity (_vic) select 0)+((vectordir (_vic)) select 0)*-1*_speed,
		 (velocity (_vic) select 1)+((vectordir (_vic)) select 1)*-1*_speed,
		 (velocity (_vic) select 2)+((vectordir (_vic)) select 2)*-1*_speed
		 ];
		
		
		sleep 0.5;
	};
	_vic setvariable ["OPTRE_Thruster_EngagedStatus",false,true];
	hint format["THRUSTERS\n\nDOWN"];
}
catch 
{
	hint "wrong parameters passed";

};