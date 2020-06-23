The first thing that needs to be done to run the WRF is to grab some inout data for the initial conditions. 

For the most basic run of the WRF, GFS data is injested. The initial tutorial from MMM provided a quick ```curl``` call to gather half degree files. My first project was to automate this as it would become very tedious to try and write out curl commands for every file, especially if oen was looking for multiple forecast hours over say many days/months or even years.

The file ```grab_data.sh``` is a bash script that needs both ```model_data_grab.py``` and some necessary command line arguments. 
The command line arguments needed are as followed (in specific order):
<ol>
<li>date - ie 20200618</li>
<li>model - ie gfs</li>
<li>model product - ie halfdeg (this comes from a dictinoary key in model_data_grab.py) https://github.com/MethaneRain/wrf-model-basics/blob/master/model_data_grab.py</li>
<li>initialization hour - ie 00</li>
<li>forecast time delta - ie 48 (in hours)</li>
</ol>