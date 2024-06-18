import ray
import random, logging
from io import StringIO
from collections import Counter
from time import sleep
from itertools import combinations
import requests, pandas 
import os

context = ray.init()

@ray.remote
def square(x):
    return x*x
futures = [square.remote(i) for i in range(4)]


os.system(f"echo Outputting Disk Space Usage")
os.system(f"./newshelltest.sh")
os.system(f"echo Outputting CPU processes and usage")
os.system(f"./secondshelltest.sh")
os.system(f"echo Outputting memory usage processes")
os.system(f"./memoryshell.sh")
#subprocess.run(["./", "newshelltest.sh"])
 
os.system("echo Total CPU Usage is:")
#os.system("mpstat")
#os.system("""top -bn2 | grep "Cpu(s)" | \
#           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
#           awk '{print 100 - $1"%"}'
#""")
os.system("""top -bn2 | grep "Cpu(s)" | awk '{print $2+$4}' | cat | awk 'NR>1 {print $1}'""")
os.system("echo Total RAM usage is:")

os.system("free -h | awk '{print $3}' | tr -d 'fre, ' | sed 's/ //g' | awk 'NR<3 {print $1}'")
os.system("echo Total Disk Space Usage is:")
os.system("df -m | awk '{sum+=$5;} END{print sum;}'")