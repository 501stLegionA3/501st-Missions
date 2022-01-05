params ["_player", "_didJIP"];

private _killFeedStatus = profileNamespace getVariable ["SVLN_Kill_Feed_Active", false];
if(_killFeedStatus) then {
	private _feed = profileNamespace getVariable ["SVLN_Kill_Feed", ""];
	_feed = [_feed, ["[MISSION CONNECTION] Mission", missionName, "on", worldName, "at", date] joinString " "] joinString (endl + endl + endl);
	profileNamespace setVariable ["SVLN_Kill_Feed", _feed];
};