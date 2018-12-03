This Readme file was created by CC Klein 
In this document describes the automated build process for the 501st
funoperation mission templates as far as creating the pbo's and inserting
any scripts into the missions with minimal human error introduced

-------------------------------------------------------------------
Directory Structure

Missions
	Properly formated mission name
		mission.sqm
		
Scripts
	scripts
		script subfolders
			script files
	pictures
		picturefile.png/jpg/paa
	init.sqm

Util
        Tools
		Mikero's Pbo tools and dlls
	Python-Installers
		Python install binaries used to make script
	Mission Merger
		Main Python Script(s) for mission merging automation

Reference
        Currently contains ACE settings for import into missions

Zeus Scripts
        Currently contains single use scripts to exec in game
--------------------------------------------------------------------

Initial release requires that you use the console to call the python script
Example: python "C:\501st-Missions\Util\Mission Merger\mission_merger.py"

It will automatically collect the mission folders placed in the missions directory
and combine them with the contents of the Scripts directory and create a pbo file
for each of those missions

--------------------------------------------------------------------

The ACE setttings are under the Reference Folder
