

cd /Users/chowdahead/WRF/WPS/
echo "- - - - - - - - - - - - - - - - - -"
echo "Running the geogrid.exe...."
echo "- - - - - - - - - - - - - - - - - -"
echo ""
./geogrid.exe >& log.geogrid
./link_grib.csh /Users/chowdahead/WRF/Build_WRF/DATA/
ln -sf ungrib/Variable_Tables/Vtable.GFS Vtable
echo "- - - - - - - - - - - - - - - - - -"
echo "Running the ungrib.exe..."
echo "- - - - - - - - - - - - - - - - - -"
echo ""
./ungrib.exe
echo "- - - - - - - - - - - - - - - - - -"
echo "Running the metgrid.exe...."
echo "- - - - - - - - - - - - - - - - - -"
echo ""
./metgrid.exe >& log.metgrid
echo ""
echo "------------------------------------------------------------------------------------------"
echo "Alright, hopefully the .exe files have all been made successfully. Switching to WRF/run..."
echo "------------------------------------------------------------------------------------------"
echo ""

cd ../WRF/run
ln -sf ../../WPS/met_em* .
./real.exe
echo ""
echo "---------------------"
echo "Let's run this beast!"
echo "---------------------"
./wrf.exe
echo ""
echo "-------------------------------------------------------------------"
echo "All done!! Checking the current directory for wrfout_d01_* files..."
echo "-------------------------------------------------------------------"
ls wrfout_d*
