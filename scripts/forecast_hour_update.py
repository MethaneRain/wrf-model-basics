# Script to add appropriate leading zeros for forecast hour part of input data filename. 
# Currently defaulted to GFS filenames which have 3 digits for forecast hours
import sys
f_hour = sys.argv[1].zfill(3)
sys.stdout.write(f_hour)
sys.exit(0)
