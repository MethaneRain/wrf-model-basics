import sys
delta = sys.argv[1]

ass = [i for i in range(0,int(delta)+1,3)]

returnStr = ''
for item in ass:
    returnStr += str(item)+' '

sys.stdout.write(returnStr)
sys.exit(0)
