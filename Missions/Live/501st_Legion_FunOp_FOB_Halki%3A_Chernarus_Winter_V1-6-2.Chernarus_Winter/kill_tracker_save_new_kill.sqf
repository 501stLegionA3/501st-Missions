params ["_unit", "_killer", "_instigator", "_useEffects", "_vic_dead"];

// Data format = CSV
// Name of Killed Entity, Class of killed entity, group, role, killed at position raw (x, y, z), killed at position grid (x, y), name of killer, class of killer, killed at time (y,m,d,h,m) relative to ingame time.

private _killFeedStatus = profileNamespace getVariable ["SVLN_Kill_Feed_Active", true];

diag_log (["[SVLN]", "[Kill Feed]", "TRACE:", "Save new kill dump:", _this]);

if(_killFeedStatus) then {
	if((not isNil "_unit") and (not isNil "_instigator")) then {
		private _feed = profileNamespace getVariable ["SVLN_Kill_Feed", ""];
		private _pos = getPos _unit;
		private _screenPos = mapGridPosition _pos;
		private _now = date;
		if(_vic_dead) then {

			diag_log (["[SVLN]", "[Kill Feed]", "TRACE:", "runnig vic dead"]);

			private _part = [
					getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName"),
					typeOf _unit,
					"n/a", "n/a",
					_pos select 0, _pos select 1, _pos select 2,
					_screenPos,
					name _instigator,
					typeOf _instigator,
					_now joinString ","]
				joinString ",";

			diag_log (["[SVLN]", "[Kill Feed]", "TRACE:", "Adding vic dead part:", _part]);

			_feed = [_feed, _part] joinString endl;
		} else {
			if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
			if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill

			private _grp = _unit getVariable ["SLVN_Kill_Tracker_Group", "NA"];
			private _role = _unit getVariable ["SLVN_Kill_Tracker_Desc", ""];

			diag_log (["[SVLN]", "[Kill Feed]", "TRACE:", "runnig inf dead"]);

			private _part = [
					name _unit, 
					typeOf _unit,
					_grp, _role,
					_pos select 0, _pos select 1, _pos select 2,
					_screenPos,
					name _instigator,
					typeOf _instigator,
					_now joinString ","]
				joinString ",";

			diag_log (["[SVLN]", "[Kill Feed]", "TRACE:", "Adding inf dead part:", _part]);

			_feed = [_feed, _part] joinString endl;
		};

		profileNamespace setVariable ["SVLN_Kill_Feed", _feed];

		diag_log (["[SVLN]", "[Kill Feed]", "TRACE:", "Saved to feed."]);
	};
};