//Exported via Arma Dialog Creator (https://github.com/kayler-renslow/arma-dialog-creator)

#include "CustomControlClasses.hh"
class SVLN_CTPL_LaunchController
{
	idd = -1;
	movingEnable = true;
	
	class ControlsBackground
	{
		class SVLN_CTPL_Background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.10111112;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.69666667;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onMouseEnter = "lbClear 1515; if (!isNil 'SVLN_CTPL_global_catapults') then { { lbAdd [1515, (_x select 1)]; } forEach (SVLN_CTPL_global_catapults getOrDefault ['catapults', []]); };";
			
		};
		class SVLN_CTPL_DangerBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.66444445;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.23222223;
			style = 0;
			text = "";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	class Controls
	{
		class SVLN_CTPL_HeaderText
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.10222223;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			style = 2+192+32;
			text = "Catapult Controler";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_Cancel
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.56555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.06111112;
			style = 2+192;
			text = "Cancel";
			borderSize = 0;
			colorBackground[] = {0.4,0.6,0.4,1};
			colorBackgroundActive[] = {0.4,0.6,0.4,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "closeDialog 1;";
			
		};
		class SVLN_CTRL_Launch
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.56666667;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.06111112;
			style = 2+192;
			text = "Launch";
			borderSize = 0;
			colorBackground[] = {0.6,0,0,1};
			colorBackgroundActive[] = {0.6,0,0,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "if (!isNil 'SVLN_CTPL_global_catapults') then {     _index = lbSelection (displayCtrl 1515);    {        _cat = (SVLN_CTPL_global_catapults getOrDefault ['catapults', []]) select _x;        [_cat select 0, parseNumber ctrlText 1512, parseNumber ctrlText 1501, parseNumber ctrlText 1502, parseNumber ctrlText 1503, parseNumber ctrlText 1511, parseNumber ctrlText 1504, parseNumber ctrlText 1513, parseNumber ctrlText 1514] remoteExec ['SVLN_fnc_launchCatapult', 0];    } forEach _index;    closeDialog 1;};";
			
		};
		class SVLN_CTPL_LaunchSpeed
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.15111112;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Launch Acceleration";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_MaxSpeed
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.24888889;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Max Speed";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_Pitch
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Pitch";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_MaxDistance
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.44444445;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Max Distance";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_LaunchSpeedEditor
		{
			type = 2;
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.2;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "50";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.249,0.2612,0.9959,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_MaxSpeedEditor
		{
			type = 2;
			idc = 1502;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "750";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_PitchEditor
		{
			type = 2;
			idc = 1503;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.39555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "-25";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_MaxDistanceEditor
		{
			type = 2;
			idc = 1504;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.49333334;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "500";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_CatapultSelectorLabel
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.15111112;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Catapult Selector";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_CatapultSelector
		{
			type = 5;
			idc = 1515;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.25555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.29444445;
			style = 16+32;
			colorBackground[] = {0.8,0.8,0.8,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {0.1731,0.8197,0.1512,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class SVLN_CTRL_ResetButton
		{
			type = 1;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.20777778;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03333334;
			style = 2+192;
			text = "Reset";
			borderSize = 0;
			colorBackground[] = {1,0.902,0.6,1};
			colorBackgroundActive[] = {1,0.902,0.6,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[] call SVLN_fnc_loadCatapultMenuDefaults;";
			onMouseButtonClick = "";
			
		};
		class SVLN_CTPL_DangerSettingsLabel
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.03666667;
			style = 2+192+32;
			text = "Danger Settings";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_RotationEditor
		{
			type = 2;
			idc = 1512;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.73777778;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "180";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_Rotation
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.68888889;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Rotation";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_HeightEditor
		{
			type = 2;
			idc = 1511;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.73777778;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "5";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_HoverHeight
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.68888889;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Hover Height";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_PauseTimeEditor
		{
			type = 2;
			idc = 1514;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.83555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "0.1";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_SleepTimerLabel
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.51875;
			y = safeZoneY + safeZoneH * 0.78666667;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Sleep Timer (s)";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTPL_HoverCyclesLabel
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.78666667;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 2+192;
			text = "Hover Cycles";
			colorBackground[] = {0.6,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class SVLN_CTRL_HoverCyclesEditor
		{
			type = 2;
			idc = 1513;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.83555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "20";
			autocomplete = "";
			colorBackground[] = {1,1,1,1};
			colorDisabled[] = {0,0,0,1};
			colorSelection[] = {0.2471,0.2627,0.9961,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
