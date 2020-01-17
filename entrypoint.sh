#!/bin/bash
cd /home/container

# Output Current Java Version
java -version

rm -rf Ashore1/ Ashore2/ Ashore3/ Ashore4/ Boletum1/ Boletum2/ Boletum3/ Boletum4/ Chained1/ Chained2/ Chained3/ Chained4/ Eastwood1/ Eastwood2/ Eastwood3/ Eastwood4/ Lectus1/ Lectus2/ Lectus3/ Lectus4/ Treenan1/ Treenan2/ Treenan3/ Treenan4/
tar -xf bw.tar.gz

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
