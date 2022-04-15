params ["_player", "_didJIP"];

diag_log text (["[SVLN]", "[ZEUS LOGIN]", "TRACE:", "Registered new zeus interactions for:", _this] joinString " ");

_insertChildren = {
	params ["_target", "_player", "_params"];

	private _curZeus = missionnamespace getVariable ["SVLN_ZLGN_activeZeusUserObject", objNull];

	private _curZeusName = "";
	if(isNull _curZeus) then {
		_curZeusName = "n/a";
	} else {
		_curZeusName = name _curZeus;
	};

	_children = [
		[["Login to Zeus", "Login to Zeus", "", {
			params ["_target", "_player", "_params"];
			[_target, _player, _params] call SVLN_fnc_zeusLoginAttemptLogin;
		}, {
			not (missionnamespace getVariable ["SVLN_ZLGN_activeZeusUser", false]);
		}] call ace_interact_menu_fnc_createAction, [], _target],

		[["Zeus Name", _curZeusName, "", {
			// Do nothing.
		}, {
			missionnamespace getVariable ["SVLN_ZLGN_activeZeusUser", false];
		}] call ace_interact_menu_fnc_createAction, [], _target],

		[["Logout of Zeus", "Logout of Zeus", "", {
			params ["_target", "_player", "_params"];
			[_target, _player, _params] call SVLN_fnc_zeusLoginAttemptLogout;
		}, {
			params ["_target", "_player", "_params"];

			private _curZeus = missionnamespace getVariable ["SVLN_ZLGN_activeZeusUserObject", objNull];
			
			_res = _curZeus isEqualTo _player;
			if (isDedicated) then {
			 	_res = _res or (admin _player) != 0;
			};

			_res;
		}] call ace_interact_menu_fnc_createAction, [], _target]
	];

	_children;
};

_action = ["Zeus", "Zeus", "", {}, {true}, _insertChildren] call ace_interact_menu_fnc_createAction;

[(typeOf player), 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToClass;
