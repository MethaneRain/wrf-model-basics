
path=/Users/chowdahead/WRF/
dataPath=Build_WRF/DATA/
cd ${path}${dataPath}

############################################################
# The positional arguments are as follows:
# 1) date
# 2) model
# 3) prod
# 4) initHour
############################################################
# grab date from arguments
date="$1"
shift

# grab model name from arguments
model="$1"
modelLow=$(echo "$model" | tr '[:upper:]' '[:lower:]')
#echo $modelLow
shift

# grab model product from arguments
prod="$1"
shift

# grab model initialization hour from arguments
initHour="$1"
shift

echo "--------------------------------------------------------------------"
echo "Attempting to grab ${model} data for: ${date}"
echo "--------------------------------------------------------------------"

if [ $modelLow == "gfs" ]; then

   while [ $# -gt 0 ]
    do
      fHour=$(python ${path}forecasthour.py ${1})
      echo "Grabbing ${date} ${modelLow} ${prod} ${initHour} ${fHour}"
      echo "- - - - - - - - - - - - - - - - - - - - - - - - - - -"
      outputString=$(python ${path}model_data_grab.py ${date} ${modelLow} ${prod} ${initHour} ${1} | tail -n 1)


      echo "filename:" $outputString

      curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o ${model}_${date}_${initHour}_f${fHour} ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/${modelLow}/prod/${modelLow}.${date}/${initHour}/${outputString}

      if [ $# -eq 1 ]; then
        echo
        echo "****** All done!! ******"
        echo ""

      else
        echo "Next time step..."
        echo ""

      fi
      shift
  done
fi

echo "-----------------------------------------------------------------------"
echo "Sweet, files are downloaded (hopefully). Checking ~/WRF/Build_WRF/DATA/"
echo "-----------------------------------------------------------------------"
cd ${path}${dataPath} && ls ${model}_${date}_${initHour}*
