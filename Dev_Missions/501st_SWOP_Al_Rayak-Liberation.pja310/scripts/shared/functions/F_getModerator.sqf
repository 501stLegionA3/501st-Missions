private [ "_moderatorobj" ];

_moderatorobj = objNull;

{ if ( typeOf _x == moderator_classname ) exitWith { _moderatorobj = _x }; } foreach allPlayers;

_moderatorobj
