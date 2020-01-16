#!/bin/bash
cd /home/container

# Output Current Java Version
java -version

rm -rf Hollow1/ Hollow2/ Hollow3/ Hollow4/ Hollow5/ Lighthouse1/ Lighthouse2/ Lighthouse3/ Lighthouse4/ Lighthouse5/ Pernicious1/ Pernicious2/ Pernicious3/ Pernicious4/ Pernicious5/ Rooftop1/ Rooftop2/ Rooftop3/ Rooftop4/ Rooftop5/ Waterfall1/ Waterfall2/ Waterfall3/ Waterfall4/ Waterfall5/
tar -xf bw.tar.gz

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
