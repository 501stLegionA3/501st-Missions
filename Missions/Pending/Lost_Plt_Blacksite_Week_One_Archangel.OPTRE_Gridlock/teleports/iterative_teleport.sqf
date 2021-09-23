params ["_to_move", "_endpoint_holder"];

private _endpoints = _endpoint_holder getVariable ["SVLN_itr_endpoints", []];
private _size = count _endpoints;

if (_size > 0) then {
	if (exit_counter >= _size) then {
		exit_counter = 0
	};

	_to_move setPos (getPos (_endpoints select exit_counter));

	exit_counter = exit_counter + 1;
};