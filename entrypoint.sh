#!/bin/bash
cd /home/container

# Output Current Java Version
java -version

rm -rf Aquarium Aquarium2 Aquarium3 Aquarium4 Carapace Carapace2 Carapace3 Carapace4 Dreamgrove Dreamgrove2 Dreamgrove3 Dreamgrove4 SandCastle SandCastle2 SandCastle3 SandCastle4 Stonekeep Stonekeep2 Stonekeep3 Stonekeep4 Temple Temple2 Temple3 Temple4
tar -xf bw.tar.gz

# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
