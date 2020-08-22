
path=$HOME/WRF/
dataPath=Build_WRF/DATA/
cd ${path}

############################################################
# The positional arguments are as follows:
# 1) date
# 2) model
# 3) model product
# 4) initialization hour
# 5) forecast time delta
############################################################
# grab date from arguments
date="$1"
shift

# grab model name from arguments
model="$1"
modelLow=$(echo "$model" | tr '[:upper:]' '[:lower:]')
shift

# grab model product from arguments
prod="$1"
shift

# grab model initialization hour from arguments
initHour="$1"
shift

delta="$1"
shift

echo "--------------------------------------------------------------------"
echo "Attempting to grab ${model} data for: ${date}"
echo "--------------------------------------------------------------------"

OUTPUT=$(python ${path}forecast_hours.py $delta)
for i in $OUTPUT;
  do
    fHour=$(python ${path}forecast_hour_update.py ${i}) # this will put leading zeros needed for file name
    echo "Grabbing ${date} ${modelLow} ${prod} ${initHour} ${fHour}"
    echo "- - - - - - - - - - - - - - - - - - - - - - - - - - -"

    # This Python script will grab the file name based off dictionary keys
    outputString=$(python ${path}model_data_grab.py ${date} ${modelLow} ${prod} ${initHour} ${i})

    echo "filename:" $outputString
    echo ""
    curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o ${path}${dataPath}${model}_${date}_${initHour}_f${fHour} ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/${modelLow}/prod/${modelLow}.${date}/${initHour}/${outputString}

  done

echo "-----------------------------------------------------------------------"
echo "Sweet, files are downloaded (hopefully). Checking ~/WRF/Build_WRF/DATA/"
echo "-----------------------------------------------------------------------"
cd ${path}${dataPath} && ls ${model}_${date}_${initHour}*
