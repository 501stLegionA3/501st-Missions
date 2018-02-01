import os
from distutils.dir_util import *
dir = os.path.dirname(__file__)
filename = os.path.join(dir, '../../Missions/')

print(filename)
tmp_file = filename+"Temp/"

files = os.listdir(filename)
for name in files:
    if name.endswith('.txt') == False:
        print(name)
        src_dir = filename+name
        tmp_dir = tmp_file+name
        copy_tree(src_dir, tmp_dir)