try
{
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
				
				/* optre boost logic
				_vic setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				(_vel select 2)
				];
				*/
				
				//f-18 black super mega horent boost logic
				 (_vic) setVelocity 
				 [
				 (velocity (_vic) select 0)+((vectordir (_vic)) select 0)*_speed,
				 (velocity (_vic) select 1)+((vectordir (_vic)) select 1)*_speed,
				 (velocity (_vic) select 2)+((vectordir (_vic)) select 2)*_speed
				 ];
				
				
			};
			sleep 0.5;
		};
	};
}
catch
{
	hint "wrong parameters passed";
};