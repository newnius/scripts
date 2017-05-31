#! /bin/bash

####### Configuration ##########
NIMBUS_NUM=3
################################

for i in $( seq 1 $NIMBUS_NUM ) ; do
docker service create \
--name storm_nimbus${i} \
--network swarm-net \
--hostname storm_nimbus${i} \
--endpoint-mode dnsrr \
--mount type=bind,src=/mnt/data/storm/logs,dst=/logs \
--mount type=bind,src=/mnt/data/storm/data/nimbus${i},dst=/data \
--mount type=bind,src=/mnt/data/storm/config,dst=/conf \
--mount type=bind,src=/mnt/share,dst=/mnt \
--user 1000:1000 \
storm:1.1 storm nimbus
# echo "./renter storm_nimbus_${i}.1 storm list"
done
