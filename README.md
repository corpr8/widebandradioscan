# widebandradioscan
Simple script using rtl_power and rtl-sdr-misc (https://github.com/keenerd/rtl-sdr-misc) to create wideband radio scans

Script will automatically run scans between 50Mhz and 350Mhz at 50Mhz intervals and knit them together with a minimal HTML page - essentially generating an image which is 55296px across.

Note: Only tested on Raspberry PI2 (I ported the script across from a Beaglebone and it needed lots of work).
Note: Current script assumes an output directory of ../netStorage 
