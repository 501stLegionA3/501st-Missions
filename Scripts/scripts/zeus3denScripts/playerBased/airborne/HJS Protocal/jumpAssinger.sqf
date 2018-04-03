
//params["personToApply"];
personToApply=_this select 0;
personToApply removeAllEventHandlers "HandleDamage";
removeAllActions personToApply;

comment "is Jumping-0
		last jump time-1
		jump counter-2
		cooldown-3
		max consecutive jumps-4";
jumpData=[false,0,0,5,2];

personToApply setVariable ["jumpArray", jumpData,true];

_namShortJumpDistY=5;//in meters
_namShortJumpDistX=10;//in meters

_namShortJumpVeloY;//meters/second
_namShortJumpVeloX;//meters/second


_namLongJumpDistY=20;//in meters
_namLongJumpDistX=40;//in meters

_namLongJumpVeloY;//meters/second
_namLongJumpVeloX;//meters/second




//Short calculations
_namShortJumpVeloY=sqrt(_2*-9.8*_namShortJumpDistY);
_tShort=(-_namShortJumpDistY)/(-9.8);
_namShortJumpVeloX=_namShortJumpDistX/(2*_tShort);

//Long calculations
_namLongJumpVeloY=sqrt(_2*-9.8*_namLongJumpDistY);
_tLong=(-_namLongJumpDistY)/(-9.8);
_namLongJumpVeloX=_namLongJumpDistX/(2*_tLong);


jumpPhysicsData=[[_namShortJumpVeloX,_namShortJumpVeloY],[_namLongJumpVeloX,_namLongJumpVeloY]];

personToApply setVariable ["jumpPhysicsArray", jumpPhysicsData,true];