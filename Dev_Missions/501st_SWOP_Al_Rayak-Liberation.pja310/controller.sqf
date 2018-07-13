
infCounter=0;
activated =0;

while {infCounter == 0} do
	{
		if(activated ==0)then{
		alarmController addAction [ "Start Alarm", {alarmController removeAction 0; activated=1; _handle = execVM "alarm.sqf";}];
		waitUntil {activated==1};
		removeAllActions alarmController;
	};
	sleep 5;
	if(activated ==1)then{
		alarmController addAction [ "Stop Alarm", {alarmController removeAction 1; activated=0; missionNamespace getVariable "alarm";
		missionNamespace setVariable ["alarm", 1];} ];
		waitUntil {activated==0};
		removeAllActions alarmController;
	};
};
