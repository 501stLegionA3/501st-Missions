////////////////////////////////////////////////
//                  BCM                       //
////////////////////////////////////// by DÄZ //

//createDialog "DAZ_Power_Plan";
//missionConfigFIle >> "DAZ_Power_Plan"

class DAZ_Power_Plan
{ 
	idd = -1;
	movingEnable = false;
	
	class controls
	{
	
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by DAZ, v1.063, #Zifudu)
////////////////////////////////////////////////////////

class RscImage_1: RscPicture
{
	idc = 1200;

	text = "DAZ_BCM_POWER_PLANT\Dialog\images\power_plant.paa";
	x = -14.5 * GUI_GRID_W + GUI_GRID_X;
	y = -17 * GUI_GRID_H + GUI_GRID_Y;
	w = 70 * GUI_GRID_W;
	h = 58.5 * GUI_GRID_H;
};
class RscImage_2: RscPicture
{
	idc = 1201;

	text = "";
	x = -14.5 * GUI_GRID_W + GUI_GRID_X;
	y = -17 * GUI_GRID_H + GUI_GRID_Y;
	w = 70 * GUI_GRID_W;
	h = 58.5 * GUI_GRID_H;
};
class RscImage_3: RscPicture
{
	idc = 1202;

	text = "";
	x = -14.5 * GUI_GRID_W + GUI_GRID_X;
	y = -17 * GUI_GRID_H + GUI_GRID_Y;
	w = 70 * GUI_GRID_W;
	h = 58.5 * GUI_GRID_H;
};
class RscImage_4: RscPicture
{
	idc = 1203;

	text = "";
	x = -14.5 * GUI_GRID_W + GUI_GRID_X;
	y = -17 * GUI_GRID_H + GUI_GRID_Y;
	w = 70 * GUI_GRID_W;
	h = 58.5 * GUI_GRID_H;
};
class RscImage_5: RscPicture
{
	idc = 1204;

	text = "";
	x = -14.5 * GUI_GRID_W + GUI_GRID_X;
	y = -17 * GUI_GRID_H + GUI_GRID_Y;
	w = 70 * GUI_GRID_W;
	h = 58.5 * GUI_GRID_H;
};
class RscImage_6: RscPicture
{
	idc = 1205;

	text = "";
	x = -14.5 * GUI_GRID_W + GUI_GRID_X;
	y = -17 * GUI_GRID_H + GUI_GRID_Y;
	w = 70 * GUI_GRID_W;
	h = 58.5 * GUI_GRID_H;
};
class RscButton_1: RscButton
{
	idc = 1600;
	action = "[""off1"", 0] spawn DAZ_BCM_fnc_power_plant";

	x = -4 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_2: RscButton
{
	idc = 1601;
	action = "[""off2"", 0] spawn DAZ_BCM_fnc_power_plant";

	x = 5.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_3: RscButton
{
	idc = 1602;
	action = "[""off3"", 0] spawn DAZ_BCM_fnc_power_plant";

	x = 15 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_4: RscButton
{
	idc = 1603;
	action = "[""off4"", 0] spawn DAZ_BCM_fnc_power_plant";

	x = 24.5 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
class RscButton_5: RscButton
{
	idc = 1604;
	action = "[""off5"", 0] spawn DAZ_BCM_fnc_power_plant";

	x = 34 * GUI_GRID_W + GUI_GRID_X;
	y = 22 * GUI_GRID_H + GUI_GRID_Y;
	w = 5 * GUI_GRID_W;
	h = 4 * GUI_GRID_H;
};
};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
