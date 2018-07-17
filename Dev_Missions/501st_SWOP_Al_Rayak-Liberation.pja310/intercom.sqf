infiniteCounter =0;
counter = 0;

_sounds = ["Sounds\allengineers.ogg","Sounds\fireonflightdeck.ogg","Sounds\scrambleren.ogg","Sounds\takeoff.ogg","Sounds\underattack.ogg"];

sleep 60;
while {infiniteCounter ==0} do
{
	_play = _sounds select counter;
	playSound3D [MISSION_ROOT + _play, radioSource, false, getPosASL radioSource, 50, 1, 100];//works by itsself
	sleep 60;//Wait 60seconds.
	counter = counter+1;//Used to increment counter.

	if (counter == 5) then//If statement to loop through the _sounds array.
	{
		counter =0;
	};
};
