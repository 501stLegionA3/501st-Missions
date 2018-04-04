
//params["personToApply"];
personToApply=_this select 0;
personToApply removeAllEventHandlers "HandleDamage";


comment "is Jumping-0
		last jump time-1
		jump counter-2
		cooldown-3
		max consecutive jumps-4";
jumpData=[false,0,0,5,2];

personToApply setVariable ["jumpArray", jumpData,true];

_namShortJumpDistY=2;//in meters
_namShortJumpDistX=10;//in meters

_namShortJumpVeloY=1;//meters/second
_namShortJumpVeloX=1;//meters/second


_namLongJumpDistY=20;//in meters
_namLongJumpDistX=45;//in meters

_namLongJumpVeloY=1;//meters/second
_namLongJumpVeloX=1;//meters/second

_namVertJumpDistY=20;//in meters
_namVertJumpDistX=5;//in meters

_namVertJumpVeloY=1;//meters/second
_namVertJumpVeloX=1;//meters/second




//Short calculations
_namShortJumpVeloY=sqrt(-2*-9.8*_namShortJumpDistY);
_tShort=(-_namShortJumpDistY)/(-9.8);
_namShortJumpVeloX=_namShortJumpDistX/(2*_tShort);

//Long calculations
_namLongJumpVeloY=sqrt(-2*-9.8*_namLongJumpDistY);
_tLong=(-_namLongJumpDistY)/(-9.8);
_namLongJumpVeloX=_namLongJumpDistX/(2*_tLong);

//Vert calculations
_namVertJumpVeloY=sqrt(-2*-9.8*_namVertJumpDistY);
_tVert=(-_namVertJumpDistY)/(-9.8);
_namVertJumpVeloX=_namVertJumpDistX/(2*_tVert);


jumpPhysicsData=[[_namShortJumpVeloX,_namShortJumpVeloY],[_namLongJumpVeloX,_namLongJumpVeloY],[_namVertJumpVeloX,_namVertJumpVeloY]];

personToApply setVariable ["jumpPhysicsArray", jumpPhysicsData,true];