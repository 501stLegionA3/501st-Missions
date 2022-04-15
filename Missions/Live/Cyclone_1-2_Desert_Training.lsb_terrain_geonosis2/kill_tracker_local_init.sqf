params ["_player", "_didJIP"];

private _killFeedStatus = profileNamespace getVariable ["SVLN_Kill_Feed_Active", false];
if(_killFeedStatus) then {
	private _feed = profileNamespace getVariable ["SVLN_Kill_Feed", ""];
	_feed = [_feed, ["[MISSION CONNECTION] Mission", missionName, "on", worldName, "at", date] joinString " "] joinString (endl + endl + endl);
	profileNamespace setVariable ["SVLN_Kill_Feed", _feed];
};

_insertChildren = {
	params ["_target", "_player", "_params"];

	_children = [
		[["Display Kill Feed", "Display Kill Feed", "", {
			[] call SVLN_fnc_displayKillFeed;
		}, {
			true
		}] call ace_interact_menu_fnc_createAction, [], _target],

		[["Clear Kill Feed", "Clear Kill Feed", "", {
			profileNamespace setVariable ["SVLN_Kill_Feed", ""];
		}, {
			true
		}] call ace_interact_menu_fnc_createAction, [], _target],

		[["Stop Kill Feed", "Stop Kill Feed", "", {
			[_player] call SVLN_fnc_disableKillFeed
		}, {
			profileNamespace getVariable ["SVLN_Kill_Feed_Active", false];
		}] call ace_interact_menu_fnc_createAction, [], _target],

		[["Start Kill Feed", "Start Kill Feed", "", {
			[_player] call SVLN_fnc_enableKillFeed
		}, {
			not (profileNamespace getVariable ["SVLN_Kill_Feed_Active", false]);
		}] call ace_interact_menu_fnc_createAction, [], _target]
	];

	_children;
};

_action = ["Kill Feed", "Kill Feed", "", {}, {true}, _insertChildren] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;