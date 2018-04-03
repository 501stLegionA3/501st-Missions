last update 3/29/2018 4:40 PM  est by Rexi

Here is the file path of various scripts,if its not listed here then its probably 1)scripts being prepped or 2) we forgot :P

/////////////////NOTE THESE FILE PATHS ARE/HAVE TO BE RELAVTIVE TO THE MAIN INIT.SQF FILE////////////////////////////////



///////////////            KEY              ////////////////////
/*
---H means head,usually a script that is automatically ran via EH or CBA XEH.
---X means tied to a ---H, no need to really apply it.
---F free script,meaning you can either use in 3den or zeus if you need it.

---S means this variable has setters
---G means this variable has getters

---P This function must have a parameter

---EXP has exception handling

*/
///////////////         END KEY              ////////////////////

//To run namenaiInit do/add the following to the main init.sqf
//Or if you want to not have all the bells and whistles  just put // infront of the below line if its in init.sqf, or remove it
[] execVM "scripts\zeus3denScripts\namenaisInit.sqf";


//---------------------DECOMMISSIONED--------------------------
/*
//Global Variables
	//This is the global variable file ---G---S
		[] execVM "scripts\zeus3denScripts\globalVars\globalVar.sqf";
		
//Global Functions
	//namEnableConfigAAT 
		//getter ---EXP
			[] execVM "scripts\zeus3denScripts\globalFnc\namEnableConfigAAT\getnamEnableConfigAAT.sqf";
		//setter ---P ---EXP
			[] execVM "scripts\zeus3denScripts\globalFnc\namEnableConfigAAT\setnamEnableConfigAAT.sqf";
*/
//---------------------END DECOMMISSIONED--------------------------
			
//Hermes and Hades 	
			//To allow zeus ease of changing textures weapons etc Hermes - Use Nato>Soliders (virtual reality)>VR Soldier to access. ---F
			[] execVM "scripts\zeus3denScripts\globalFncAndVarPanel\zeusVariableAndFunctionPanel.sqf";
			
			//To allow zeus ease of changing textures weapons etc Hermes - Use CSAT>Soliders (virtual reality)> VR Soldier to access. ---F
			[] execVM "scripts\zeus3denScripts\globalFncAndVarPanel\zeusVariableAndFunctionPanelHades.sqf";
			

//Vehicle Based---Any Changes to the vehicle it self,not crew 
	//vehicleVariants
		//airBased
			//laat weapon,no need to worry as it will auto apply ---H
				[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\LAAT\laatClaymore.sqf";
				
			//arc-170 weapon,no need to worry as it will auto apply ---H
				[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\arcXiphos.sqf";
				
			//arc-170 prevent ejection,note this is tied into the arc-170 weapon script ---X
				[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\ARC\removeEject.sqf";
				
			//y-wing weapons,no need to worry as it will auto apply ---H
				[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\YWING\ywingScylla.sqf";
			
			//VULTURE,weapons
				[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\airBased\VULTURE\vultureBase.sqf";
			
			//supporting vehicle scripts,under vehicleBased/actionMenu based
				//arc-170 wing tip smoke,tied to arc weapon ---X
					[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipPrB.sqf";
					[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipRB.sqf";
					[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\ARC\arcSmokeTipWB.sqf";

				//laat wing tip smoke ,tied to laat weapon ---X
					[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\LAAT\laatSmokeTip.sqf";

				//Y-wing thruster tip smoke ,tied to y-wing weapon ---X
					[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Smoke\YWING\ywingSmokeTip.sqf";

				
		//seaBased
			//speedBoats
				//Blufor
					//Blufor Speedboat,adds republic eweb for rear and u-wing gunner gun for main cannon ---H
					[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\seaBased\speedBoats\Blufor\bluforSpeedBoat.sqf";
				//Opfor
					//Opfor Speedboat,adds imperial eweb for rear and u-wing gunner gun for main cannon ---H
					[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\seaBased\speedBoats\Opfor\opforSpeedBoat.sqf";
					
		//landBased
			//AT-TE 
				//AT-TE Base,applies armor and repair additions (runs whenever a at-te is spawned) ---H
					[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteBase.sqf";
					
				//AT-TE Trident Class, tied to file below (ran after both top file and when bottom calls it,applies everything) ---X
					[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteTridentClass";
					
				//AT-TE Type Selector, Selector is the Nato VR Entity spawn him in to be able to run the Trident Class file above (runs whenever the at-te spawner object action menu is ran,thus running the at-te base and then trident class) ---H  	
					[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\ATTE\atteTypeSelector.sqf"
					
			//AAT
				//This gives an eweb to the AAT's ---H
					[] execVM "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landBased\AAT\aatMohawkClassBase.sqf"
		
			//Mortars
				//Adds flares to simulate plasma Mortars NATO(Blue) and CSAT(Red) ---H
				[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\landbased\Mortar\mortars.sqf";
				
					//Sabre	
				//Sabre adds weapons, fixes health and adds smokes and damage reports ---H
				[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\Landbased\sabres\Sabres.sqf";

    			
			//Barc
				//Barc allows Barcs to be loaded into vehicles with a cargo space 4 or greater i.e LAATS ---H
				[] execVM  "scripts\zeus3denScripts\vehicleBased\vehicleVariants\Landbased\barc\barc.sqf";	
				
				
							
	//Vehicle Action Menu Based
		//kappa-cruisie boost ---F
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
			[] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";
			
			//3den use,note dont use both,working on fixing so that both can be used
			[this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
			[this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";
			
			//zeus use,note dont use both,working on fixing so that both can be used
			[_this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\forwardKappa.sqf";
			[_this] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\reverseKappa.sqf";
			
		//Optre-f18 hybrid boost
			["_vic","_namMaxSpeed","_namMinSpeed","_namAccel"] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\boostStart.sqf";
			["_vic","_namMinSpeed","_namDeAccel"] execVM "scripts\zeus3denScripts\vehicleBased\actionMenu\Boost\boostStop.sqf";
					
		//Repair 
			//Repair script ---X
			[] execVM "Scripts\scripts\zeus3denScripts\vehicleBased\actionMenu\Repair\repair.sqf";	
			//Add the below to a vehicle to add repair option this should be used for things like turrets that can't be repaired via standard arma/ace. Consumes Toolkits for each repair. (Repairs to a max of 65%) ---F
			_this addAction ["<t color='#00FF00'>Hull Damage Report</t>",{	hint parseText format["<t color='#0099FF'> Hull Integrity is :%1%2</t>",((1-(damage (_this  select 0)))*100),"%"];},[1],0,false,true,""," commander  _target == _this "];

			
//Played Based---Any Changes onto players
	//Aviation Based
		//pilot kill detector ---F
			[] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";
			[this] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";//for when you want this on a object in 3den
			[_this] execVM "scripts\zeus3denScripts\playerBased\aviation\pilotBased\pilotProtectorBoxEH.sqf";//for when you want to apply it during zeus
			
		//warden resupply ammo ---F
			[] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";
			[this] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";//for when you want this on a object in 3den
			[_this] execVM "scripts\zeus3denScripts\playerBased\aviation\wardenBased\wardenAmmoBox.sqf";//for when you want to apply it during zeus

		//Airborne Based
		//HJS Protcal(AKA Custom JumpPack Script) (HJS means Horseborne Jump Script) parameter namUnit is the unit that is gona get it
			//Ran in initPlayerLocal.sqf which is ran client side whenever someone joins. Only adds the script to them once and when they open inventory and if they have the right jetpack ---H
				[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpAssinger.sqf";
			//Called by assinger adds the forward jump and decides if that person can ---X ^
				[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpDecider.sqf";
			//Called by assinger adds the vertica jump and decides if that person can ---X ^^	
				[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpDeciderUp.sqf";
			//Called by assinger adds the logic to prevent dmg on landing ---X ^^^	
				[namUnit] execVM "scripts\zeus3denScripts\playerBased\airborne\HJS Protocal\jumpHandler.sqf";
				
	
//AI Based---Changes to NPC or things that will mostly not be players
	//FactionBased
		//OPFOR Based
			//CIS
				//b2 reconfig,forces b2's to walk--H
					[] execVM "scripts\zeus3denScripts\aiBased\factionBased\opfor\cis\b2\b2Reconfig.sqf";
		//BLUFOR Based
		
		//INDEPENDENT Based
            //Adds random star wars uniforms to the Syndikat bandits ---H
				[] execVM "scripts\zeus3denScripts\aiBased\factionBased\independent\AAF\RandomSWCIV.sqf"; 	
		//CIVILLIAN Based
		
		
		
		
		
		
		