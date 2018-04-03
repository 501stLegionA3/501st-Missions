//Params["personToApply"];
personToApply=_this select 0;
	personToApply  addAction ["<t color='#886600'>forward jump--------U13</t>",
	{	
		_namUnit=_this select 0;
		_resultIfJump=[_this select 0] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpDecider.sqf";
		
		if([_namUnit] call {_resultIfJump}) then
		{
			_namJumpPhysicsArray=_namUnit getVariable["jumpPhysicsArray",[[5,5],[20,40]]];
		
			_namSpeed=(_namJumpPhysicsArray select 0) select 0;
			_namSpeedUp=(_namJumpPhysicsArray select 0) select 1;
			
			comment "initiate jump";
			(_namUnit) setVelocity 
			[
			((vectordir (_namUnit)) select 0)*_namSpeed,
			((vectordir (_namUnit)) select 1)*_namSpeed,
			(velocity (_namUnit) select 2)+_namSpeedUp
			];
			
			comment "update variables";
			_namIsJumping=true;
			_namLastJumpTime=time;
			_namJumpCounter=_namJumpCounter+1;
			
			_namUnit setVariable ["jumpArray", [_namIsJumping,_namLastJumpTime,_namJumpCounter,_namJumpCooldownTime,_namMaxJump],true];
		};
		



	}
	,[1],0,false,true,"User13"," driver  _target == _this"];






