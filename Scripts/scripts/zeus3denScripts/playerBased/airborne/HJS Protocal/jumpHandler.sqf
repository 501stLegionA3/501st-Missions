//Params["personToApply"];
personToApply=_this select 0;
	personToApply addEventHandler ["HandleDamage",
	{
		_returnDmg=_this select 2;
		_namUnit=_this select 0;
	
		_namThisJumpData=_namUnit getVariable["jumpArray",[]];
		
		comment "is Jumping-0
		last jump time-1
		jump counter-2
		cooldown-3
		max consecutive jumps-4
		C || (!A and B)";
		
		_namIsJumping=_namThisJumpData select 0;
		_namLastJumpTime=_namThisJumpData select 1;
		_namJumpCounter=_namThisJumpData select 2;
		_namJumpCooldownTime=_namThisJumpData select 3;
		_namMaxJump=_namThisJumpData select 4;

		
		if(((count _namThisJumpData)!=0) && {_namIsJumping}) then 
		{
			_returnDmg=0;

			if(isTouchingGround _namUnit) then
			{
			

				_null = _this spawn
				{


					_namUnitSpawn=(_this select 0);


					_namThisJumpDataSpawn= _namUnitSpawn getVariable["jumpArray",[]];



					for [{_i=0}, {_i<10}, {_i=_i+1}] do
					{
						sleep 0.01;

						if((abs speed _namUnitSpawn)<1) then
						{
							_namIsJumpingSpawn=false;
							
						
							_namUnitSpawn setVariable ["jumpArray", [_namIsJumpingSpawn,(_namThisJumpDataSpawn select 1),(_namThisJumpDataSpawn select 2),(_namThisJumpDataSpawn select 3),(_namThisJumpDataSpawn select 4)],true];

							
							_i=11;
						};
					};

					


				};


			};
			_returnDmg

		};


	_returnDmg

		
	}];
