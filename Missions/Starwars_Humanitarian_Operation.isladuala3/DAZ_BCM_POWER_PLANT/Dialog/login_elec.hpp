//createDialog "DAZ_Login";
//missionConfigFIle >> "DAZ_Login"

class DAZ_Login_elec
{
	idd = 1984;
	movingEnable = true;											
	controlsBackground[] = {IGUIBack_2200, IGUIBack_2201};
	objects[] = {};
	controls[] = 
	{
		RscText_1000,
		RscButton_1600,
		RscEdit_1400,
		RscButton_1601
	};


class IGUIBack_2200: DAZ_BCM_IGUIBack
{
	idc = 2200;
	moving = 1;

	x = 7.27 * GUI_GRID_W + GUI_GRID_X;
	y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
	w = 25.4566 * GUI_GRID_W;
	h = 1.27224 * GUI_GRID_H;
};
class IGUIBack_2201: DAZ_BCM_IGUIBack2
{
	idc = 2201;
	moving = 1;

	x = 7.27 * GUI_GRID_W + GUI_GRID_X;
	y = 9.32 * GUI_GRID_H + GUI_GRID_Y;
	w = 25.4566 * GUI_GRID_W;
	h = 6.3612 * GUI_GRID_H;
};
class RscText_1000: DAZ_BCM_RscText
{
	idc = 1000;

	text = "                                 PASSWORD"; //--- ToDo: Localize;
	x = 7.27 * GUI_GRID_W + GUI_GRID_X;
	y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
	w = 22.911 * GUI_GRID_W;
	h = 1.27224 * GUI_GRID_H;
};
class RscButton_1600: DAZ_BCM_RscButton2
{
	idc = 1600;

	text = "X"; //--- ToDo: Localize;
	x = 30.82 * GUI_GRID_W + GUI_GRID_X;
	y = 8.05 * GUI_GRID_H + GUI_GRID_Y;
	w = 1.90925 * GUI_GRID_W;
	h = 1.27224 * GUI_GRID_H;
	
	action = "closeDialog 0";
};
class RscEdit_1400: DAZ_BCM_RscEdit
{
	idc = 1400;

	x = 11.05 * GUI_GRID_W + GUI_GRID_X;
	y = 10.5 * GUI_GRID_H + GUI_GRID_Y;
	w = 17 * GUI_GRID_W;
	h = 1.5 * GUI_GRID_H;
};
class RscButton_1601: DAZ_BCM_RscButton
{
	idc = 1601;

	text = "Login"; //--- ToDo: Localize;
	x = 16.18 * GUI_GRID_W + GUI_GRID_X;
	y = 13.14 * GUI_GRID_H + GUI_GRID_Y;
	w = 7.63699 * GUI_GRID_W;
	h = 1.27224 * GUI_GRID_H;
	
	action = " _this spawn DAZ_BCM_fnc_mdp_elec;"
};
};