counter = 0;
alarm = 0;
str_alarm = "1";
publicVariable "alarm";

sleep 5;
while {alarm == 0} do
{
	//hint "DEBUG | HELLO FROM THE WHILE LOOP";
	playSound3D [MISSION_ROOT + "Sounds\alarm.ogg", radioSource, false, getPosASL radioSource, 30, 1, 100];//works by itsself
	sleep 1.5;//Wait 60seconds.
};

if (alarm == 1) then
{
	//hint"DEBUG | HELLO FROM THE IF STATEMENT";
};