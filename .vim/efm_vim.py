import sys


filename=""

for line in sys.stdin:
    if ".tex" in line and filename == "":
        filename = line.replace("/"," ").replace("\n","").split()[-1]

    flags= ["WARNING", "ERROR", "MISSING", "UNDEFINED", filename.upper()]
    if any(match in line.upper() for match in flags):
        if filename in line:
            print(line.replace("./",""))
        else:
            print(filename+":"+line)
