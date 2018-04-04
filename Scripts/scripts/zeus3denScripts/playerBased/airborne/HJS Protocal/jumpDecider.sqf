//Params["personToApply"];
	

	_namUnit=_this select 0;
	_namThisJumpData=_namUnit getVariable["jumpArray",[false,0,0,5,2]];
	_namResult=false;
	

	
	
	
	comment "data from jump array";
	
	comment "is Jumping-0
	last jump time-1
	jump counter-2
	cooldown-3
	max consecutive jumps-4
	!C or (!A and B)";
	
	_namIsJumping=_namThisJumpData select 0;
	_namLastJumpTime=_namThisJumpData select 1;
	_namJumpCounter=_namThisJumpData select 2;
	_namJumpCooldownTime=_namThisJumpData select 3;
	_namMaxJump=_namThisJumpData select 4;
	comment "A-is jumping B-is cooled C-is over counter /// karnugh map variables";
	
	_namTimeSinceLastJump=time-_namLastJumpTime;
	
	_A=_namIsJumping;
	comment "true if cooled";
	_B=(_namTimeSinceLastJump)>_namJumpCooldownTime;
	comment "true if u just 'double jumped'";
	_C=_namJumpCounter>=_namMaxJump;
	
	[west, "HQ"] sideChat format["jumpdata %1 %2",_namThisJumpData,time];
	
	if((count _namThisJumpData) !=0) then
	{
		
		_namIsOverCounter=_C;
		_namIsCool=(time-_namLastJumpTime)>=_namJumpCooldownTime;
		
		comment "if ur cooled then reset counter";
		if(_B)then
		{
			_namJumpCounter=0;
			_namUnit setVariable ["jumpArray", [_namIsJumping,_namLastJumpTime,_namJumpCounter,_namJumpCooldownTime,_namMaxJump],true];
		};

		

		if(!_C || {!_A && {_B}}) then 
		{
			
	
			_namResult=true;

		}
		else
		{

			hint parseText  format["Can not boost. <t color='#40e0d0'>Cooldown done in</t> <t color='#FF0000'>%1</t>",(_namJumpCooldownTime-(time-_namLastJumpTime))];
			
			if(_B || {(_namJumpCooldownTime-(time-_namLastJumpTime))<0}) then 
			{	
				_namJumpCounter=0;
				_namUnit setVariable ["jumpArray", [_namIsJumping,_namLastJumpTime,_namJumpCounter,_namJumpCooldownTime,_namMaxJump],true];
			};
		};



	_namResult


	};








