/* decommissioned due to difficulty of public variables
namZeusPanelHermes={
	params["_objToPlacePanelsOn"];
	
	//makes him handcuffed
	([_objToPlacePanelsOn,true] call ace_captives_fnc_setHandcuffed);
	
	 removeGoggles _objToPlacePanelsOn;
	_objToPlacePanelsOn AddUniform "SWOP_CloneOf_red_F_CombatUniform";
	_objToPlacePanelsOn Addheadgear "SWOP_Cloneofficer_capR";
	
	_toggleColor="<t color='#0000FF'>";
	_colorEnd="</t>";

	
	//Hermes Control Panel
	_objToPlacePanelsOn addAction ["<t color='#A020F0'> Hermes Control Panel</t>", 
	{
		hint "REeeE-CC Euler    Euler stop ReeEeEing--CC Angel Angle 2k18"
	}];
	
	

	//toggle if the aat should be configed or not
	_title=format["%1%2%3",_toggleColor,"Toggle AAT Changes",_colorEnd];
	_objToPlacePanelsOn addAction [_title, 
	{
	namEnableConfigAAT=!namEnableConfigAAT;

	hintSilent format["AAT changes are now %1",namEnableConfigAAT];
	}];

};



["B_Protagonist_VR_F", "init",namZeusPanelHermes, true, [], true] call CBA_fnc_addClassEventHandler; 
*/



