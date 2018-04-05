//Params["personToApply"];
personToApply=_this select 0;
	personToApply  addAction ["<t color='#0000FF'>Vertical Jump--------U15</t>",
	{
		_namUnit=_this select 0;
		
		
		

		
		
		
		
		
		
		
		_jumpResult = compile preprocessFile "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpDecider.sqf";
		_jumpDecision = [_namUnit] call _jumpResult;
		
		
		if(_jumpDecision) then
		{
			comment "data from jump array";
		
			comment "is Jumping-0
			last jump time-1
			jump counter-2
			cooldown-3
			max consecutive jumps-4
			!C or (!A and B)";
			
			
			_namThisJumpData=_namUnit getVariable["jumpArray",[false,0,0,5,2]];
			
			
			_namJumpPhysicsArray=_namUnit getVariable["jumpPhysicsArray",[[5,5],[20,40],[1,40]]];
		
			_namSpeed=(_namJumpPhysicsArray select 2) select 0;
			_namSpeedUp=(_namJumpPhysicsArray select 2) select 1;
			
			comment "initiate jump";
			(_namUnit) setVelocity 
			[
			((vectordir (_namUnit)) select 0)*_namSpeed,
			((vectordir (_namUnit)) select 1)*_namSpeed,
			(velocity (_namUnit) select 2)+_namSpeedUp
			];
			
			comment "update variables";
			
			
			
			//variables are (isJumping),(last jump time),(jump counter),(cooldown),(max consecutive jumps)
			_namUnit setVariable ["jumpArray", [true,time,(_namThisJumpData select 2)+1,_namThisJumpData select 3,_namThisJumpData select 4],true];
		
		};



	}
	,[1],0,false,true,"User15"," driver  _target == _this"];





