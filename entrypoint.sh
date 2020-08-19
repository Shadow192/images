#!/bin/bash
cd /home/container

# Output Current Java Version
java -version

rm -rf Amazon/ Amazon2/ Amazon3/ Amazon4/ Ashfire/ Ashfire2/ Ashfire3/ Ashfire4/ Crogorm/ Crogorm2/ Crogorm3/ Crogorm4/ Dragonstar/ Dragonstar2/ Dragonstar3/ Dragonstar4/ Speedway/ Speedway2/ Speedway3/ Speedway4/ Zarzul/ Zarzul2/ Zarzul3/ Zarzul4/
tar -xf bw.tar.gz

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
