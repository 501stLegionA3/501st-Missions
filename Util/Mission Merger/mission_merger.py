import os
dir = os.path.dirname(__file__)
filename = os.path.join(dir, '../../Missions/')

print(filename)

files = os.listdir(filename)
for name in files:
    if name.endswith('.txt') == False:
        print(name)