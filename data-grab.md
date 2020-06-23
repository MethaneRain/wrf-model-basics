The first thing that needs to be done to run the WRF is to grab some inout data for the initial conditions. 

For the most basic run of the WRF, GFS data is injested. The initial tutorial from MMM provided a quick ```curl``` call to gather half degree files. My first project was to automate this as it would become very tedious to try and write out curl commands for every file, especially if oen was looking for multiple forecast hours over say many days/months or even years.

