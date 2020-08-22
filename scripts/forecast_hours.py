# This script will take the input time delta and split it into forecast steps for specified model
# As of right now, the GFS is the only model currently used, so the forecast runs are every 3 hours

import sys
delta = sys.argv[1]

time_delta = [i for i in range(0,int(delta)+1,3)]

returnStr = ''
for item in time_delta:
    returnStr += str(item)+' '

sys.stdout.write(returnStr)
sys.exit(0)
