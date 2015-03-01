#!/bin/bash

#get working directory
DIR=$(pwd)

# parameterised batch scans

echo "Running Survey with the following settings:"
echo "Lower Freq: $1"; #in Mhz
echo "Upper Freq: $2"; #in Mhz
echo "Bucket size: $3"; #in hz
echo "Gain (-g): $4"; #0 - 100?
echo "Interval (-i): $5"; #in Sec
echo "Exit timer (-e): $6"; #e.g. 30m or 30
echo "Survey name: $7"; #e.g. Maybe will autogen this

echo "Surveying $1Mhz - $2Mhz"

#rtl_power -f 28M:29.7M:.5k -g 50 -i 1 -e 30m survey10Meter.csv
/usr/bin/rtl_power -f $1M:$2M:$3 -g $4 -i $5 -e $6 $7.csv

echo "converting scan data"
python $DIR/rtl-sdr-misc/heatmap/heatmap.py $7.csv $7.jpg

echo "cleaning up scan data"
rm $DIR/$7.csv
#mv -f $7.jpg /home/radiosurvey/netstorage/
