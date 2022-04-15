private _feed = profileNamespace getVariable ["SVLN_Kill_Feed", ""];

uiNamespace setVariable ["display3DENCopy_data", ["Kill Feed", _feed]];

createDialog "display3denCopy";