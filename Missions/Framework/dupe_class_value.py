from glob import glob

files = glob("**/mission.sqm")

print(files)

print() 
print()

for name in files:
    with open(name, "r+") as file:
        file.seek(0)
        line = ""

        while not "class Entities" in line:
            line = file.readline()

        pos = file.tell()
        while not "items=" in line:
            pos = file.tell()
            line = file.readline()

        try:
            count = int(line[line.index('=')+1:line.index(';')])
        except:
            continue

        rest_of_file = ['\n']
        while line != '':
            line = file.readline()
            rest_of_file.append(line)

        file.seek(pos)

        file.write("        items={};".format(count + 1))

        file.flush()

        file.writelines(rest_of_file)

    with open(name, "r+") as file:
        file.seek(0)
        line = ""

        while not "class Entities" in line:
            line = file.readline()

        while not "position[]={" in line:
            line = file.readline()

        start = line.index("{") + 1
        end = line.index("}")
        nums = line[start:end]

        nums = nums.split(',')

        if len(nums) != 3: continue

        try:
            one = float(nums[0])
            two = float(nums[1])
            three = float(nums[2])
        except:
            continue

        pos = file.tell()
        while not "};" == line.strip():
            line = file.readline()
            pos = file.tell()

        rest_of_file = ["\n"]
        while line != '':
            line = file.readline()
            rest_of_file.append(line)

        file.seek(pos)

        file.write('''
        class Item{}
        {}
            dataType="Marker";
            position[]={};
            name="Venator%20V1%2e3%2e1-beta%20(NO%20MCC)";
            type="Empty";
            id=0;
            atlOffset=717.84521;
        {};'''.format(count, "{", "{%0f,%0f,%0f}" % (one, two, three), "}"))

        file.flush()

        file.writelines(rest_of_file)

        print(one, two, three)

        continue

