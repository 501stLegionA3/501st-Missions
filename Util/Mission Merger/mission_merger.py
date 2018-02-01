#This was written for the 501st Starsim unit in Arma3
#For faster mission integration with mission scripts
#Written by CC Klein copyright 2018 

import os
import subprocess
from distutils.dir_util import *

#Creating String values for Directory Structure
dir = os.path.dirname(__file__)
filename = os.path.join(dir, '../../Missions/')
tmp_file = filename+"Temp/"
script_files = os.path.join(dir, '../../Scripts/')
mission_files = os.listdir(filename)
pbo_tool_files = os.path.join(dir, '../../Util/Tools/')
pbo_tool = pbo_tool_files+"MakePbo.exe"

#If temp dir exists delete then continue
if os.path.isdir(tmp_file) == True:
    remove_tree(tmp_file)

#For each mission folder in mission_files copy them to
#tmp dir then copy scripts into mission tmp dir	
for name in mission_files:
    if name.endswith('.txt') == False and name != 'Temp' and name.endswith('.pbo') == False:
        print(name)
        src_dir = filename+name
        tmp_dir = tmp_file+name
        mkpath(tmp_dir)
        copy_tree(src_dir, tmp_dir)
        copy_tree(script_files, tmp_dir)
        subprocess.call([pbo_tool, "-P",tmp_dir])
		
