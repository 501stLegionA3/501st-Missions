#This was written for the 501st Starsim unit in Arma3
#For faster mission integration with mission scripts
#Written by CC Klein copyright 2018 
#Authors email: ethan.leas@gmail.com

import os
import subprocess
from distutils.dir_util import *
from distutils.file_util import *

def isDir(dir):
    return os.path.isdir(dir)

def pathName(dir, rPath):
    return os.path.join(dir, rPath)

def listDir(dir):
    return os.listdir(dir)	


#Creating String values for Directory Structure
dir = os.path.dirname(__file__)
root_dir = pathName(dir, '../../')
filename = pathName(dir, '../../Missions/')
tmp_file = filename+"Temp/"
script_files = pathName(dir, '../../Scripts/')
mission_files = listDir(filename)
pbo_tool_files = pathName(dir, '../../Util/Tools/')
pbo_tool = pbo_tool_files+"MakePbo.exe"

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

#Get list of tmp dir after being populated		
pbo_files = listDir(tmp_file)
pbo_dir = root_dir+"Pbo Files/"

#If pbo dir does not exist create it
#else delete it then create it
if isDir(pbo_dir) == False:
    mkpath(pbo_dir)
else:
    remove_tree(pbo_dir)
    mkpath(pbo_dir)
	
#For each listing in tmp dir filter out .pbo files for copy
for name in pbo_files:
    if name.endswith('.pbo') == True:
        src_file = tmp_file+name
        move_file(src_file, pbo_dir)
		
#Cleanup
#If temp dir exists delete
if isDir(tmp_file) == True:
    remove_tree(tmp_file)