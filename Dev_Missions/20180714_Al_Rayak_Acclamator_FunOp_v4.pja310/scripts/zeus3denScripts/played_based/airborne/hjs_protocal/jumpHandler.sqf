
personToApply=_this select 0;
	personToApply addEventHandler ["HandleDamage",
	{
		_namUnit=_this select 0;
		_namJumpData=_namUnit getVariable["jumpArray",[false,0,0,5,2]];
		_namIsJumping=(_namJumpData)select 0;
		_namResult=0;
		_namIsToggling=_namUnit getVariable["isTogglingJumpEH",true];
		
		if(_namIsJumping && {isTouchingGround _namUnit} ) then
		{		
			[west, "HQ"] sideChat format["isJumping-- %1 and istouchingGround -->%2 --time %3",_namIsJumping,(isTouchingGround _namUnit),time];
			_namResult=0;
			_null = _this spawn
			{
				_namUnitSpawn=_this select 0;
				_namJumpDataSpawn=_namUnitSpawn getVariable["jumpArray",[false,0,0,5,2]];
				
				
				sleep 0.25;
				if((_namJumpDataSpawn select 0) && !(isTouchingGround _namUnitSpawn )) then//added measures to ensure u dont die/knock out
				{
						_namUnitSpawn setVariable ["jumpArray", [true,(_namJumpDataSpawn select 1),(_namJumpDataSpawn select 2),(_namJumpDataSpawn select 3),(_namJumpDataSpawn select 4)],true];
						
				}		
				else
				{
				
					_namUnitSpawn setVariable ["jumpArray", [false,(_namJumpDataSpawn select 1),(_namJumpDataSpawn select 2),(_namJumpDataSpawn select 3),(_namJumpDataSpawn select 4)],true];
				};
				
				
			};
			_namResult=0;
		
		}
		else
		{
			if(!(isTouchingGround _namUnit)) then//if ur not touching ground then ur still flying
			{
				//_namUnitSpawn setVariable ["jumpArray", [true,(_namJumpDataSpawn select 1),(_namJumpDataSpawn select 2),(_namJumpDataSpawn select 3),(_namJumpDataSpawn select 4)],true];
				_namResult=0;
			}
			else
			{
				_namResult=_this call ACE_medical_fnc_handleDamage;
				_namUnit setVariable ["jumpArray", [false,(_namJumpData select 1),(_namJumpData select 2),(_namJumpData select 3),(_namJumpData select 4)],true];
			};
		
		};
		
		
		_namResult
		
	}];
