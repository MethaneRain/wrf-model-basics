Welcome to my basic WRF model guide!

In this repo, I have several shell and python scripts that will automate running my WRF build based on GFS data input, which I will add other input data sources in the future.

---

My scripts and build are set up are for a very specific GFS model data input set and is based closely on NCAR's MMM <a href="https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php#STEP7">data grab</a> in their tutorial. There are still some intricacies of the input times for the ```namelist``` files that I want to understand more. 

The basic automation of scripts for running my configuration are divied into three steps:
* execute ```grab_data.sh``` script with appropriate arguments
* execute ```namelist_date_update.sh``` script with appropriate arguments
* execute ```compile_and_run_wrf.sh``` script 

---



