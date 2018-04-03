
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





