Welcome to my basic WRF model guide!

In this repo, I have several shell and python scripts that will automate running my WRF build based on GFS data input, which I will add other input data sources in the future.

---

My scripts and build are set up are for a very specific GFS model data input set and is based closely on NCAR's MMM <a href="https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php#STEP7">data grab</a> in their tutorial. There are still some intricacies of the input times for the ```namelist``` files that I want to understand more. 

The basic automation of scripts for running my configuration are divied into three steps:

1) execute ```grab_data.sh``` script with appropriate arguments

2) execute ```namelist_date_update.sh``` script with appropriate arguments

3) execute ```compile_and_run_wrf.sh``` script 

---

Example:

```$ ./grab_data.sh 20200810 gfs halfdeg 00 6```

This will make create file names to grab in the ```curl``` command into ~/WRF/Build_WRF/DATA/ and display all the data files in that directory.

```$ ./namelist_date_update.sh 20200810 6 21600 00``` 

This will update all the date and time info needed in the ```namelist.wps``` and ```namelist.input``` files

```$ compile_and_run_wrf.sh```

This will create all the necessary ```.exe``` files by running the ```geogrid.exe```, ```ungrib.exe```, and ```metgrid.exe``` files. Then it executes the ```real.exe``` (which can be changed for ideal in the future) and finally executes the ```wrf.exe```
