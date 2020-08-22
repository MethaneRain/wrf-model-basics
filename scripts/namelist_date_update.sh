# This script will update a template namelist file for the WPS preproccessing
# and create/update the namelist.wps file

# Command line arguments:

#Command line arguments:
#  * $1: date in YYYYMMDD format
#  * $2: forecast time difference in data files
#  * $3: time interval for WRF
#  * $4: start hour
#


date="$1"
echo $date
delta="$2"
timeInterval="$3"
startYear=${date:0:4}
startMonth=${date:4:2}
startDay=${date:6:2}
startHour="$4"
#startHour=${date:8:2}
#end="$3"
#runHours="$4"
#timeInterval="$5"

path=$HOME/WRF/

dateFinal=$(python ${path}time_delta.py ${date} ${delta})
echo $dateFinal
endYear=${dateFinal:0:4}
endMonth=${dateFinal:4:2}
endDay=${dateFinal:6:2}
endHour=${dateFinal:9:2}
#sed -e 's/"startDate"/2020-06-18_00:00:00/g' -e 's/"endDate"/2020-06-18_06:00:00/g' \
#-e 's/"totalSecs"/21600/g' namelist_edited.wps > namelist.wps
cd $HOME/WRF/WPS/
sed -e 's/"startDate"/'${startYear}'-'${startMonth}'-'${startDay}'_'${startHour}':00:00/g' \
-e 's/"endDate"/'${endYear}'-'${endMonth}'-'${endDay}'_'${endHour}':00:00/g' \
-e 's/"totalSecs"/'${timeInterval}'/g' namelist_edited.wps > namelist.wps

cd $HOME/WRF/WRF/run/

sed -e 's/"runHours"/'${delta}'/g' \
-e 's/"startYear"/'${startYear}'/g' \
-e 's/"startMonth"/'${startMonth}'/g' \
-e 's/"startDay"/'${startDay}'/g' \
-e 's/"startHour"/'${startHour}'/g' \
-e 's/"endYear"/'${endYear}'/g' \
-e 's/"endMonth"/'${endMonth}'/g' \
-e 's/"endDay"/'${endDay}'/g' \
-e 's/"endHour"/'${endHour}'/g' \
-e 's/"totalSecs"/'${timeInterval}'/g' namelist_edited.input > namelist.input

#sed -e 's/"runHours"/6/g' \
#-e 's/"startYear"/2020/g' \
#-e 's/"startMonth"/06/g' \
#-e 's/"startDay"/18/g' \
#-e 's/"startHour"/00/g' \
#-e 's/"endYear"/2020/g' \
#-e 's/"endMonth"/06/g' \
#-e 's/"endDay"/18/g' \
#-e 's/"endHour"/06/g' \
#-e 's/"totalSecs"/21600/g' namelist_edited.input > namelist.input
