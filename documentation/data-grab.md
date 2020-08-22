The first thing that needs to be done to run the WRF is to grab some input data for the initial conditions. 

For the most basic run of the WRF, GFS data is ingested. The initial tutorial from MMM provided a quick ```curl``` call to gather half degree files. My first project was to automate this as it would become very tedious to try and write out curl commands for every file, especially if one was looking for multiple forecast hours over say many days/months or even years.

The file ```grab_data.sh``` is a bash script that needs ```model_data_grab.py```, ```forecast_hours.py```, ```forecast_hour_update.py```, and some necessary command line arguments. 
The command line arguments needed are as followed (in specific order):
<ol>
<li>date - ie 20200618</li>
<li>model - ie gfs</li>
<li>model product - ie halfdeg (this comes from a dictionary key in <a href="https://github.com/MethaneRain/wrf-model-basics/blob/master/scripts/model_data_grab.py">model_data_grab.py</a>)</li>
<li>initialization hour (UTC) - ie 00</li>
<li>forecast time delta - ie 48 (in hours)</li>
</ol>

---

The Python scripts needed to run the ```grab_data.sh``` script are as follow with details below:

<h4><strong><em>model_data_grab.py</em></strong></h4>

This script does the heavy lifting as far as retrieving the input data. 

---

The data that MMM's tutorial comes from: 
<a href="ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/">ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/</a>

And the GFS data is at:
<a href="ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/">ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/</a>

<a href="ftp://someftpserver.com/">Browse the FTP server</a>