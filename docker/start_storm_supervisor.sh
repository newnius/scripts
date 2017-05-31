#! /bin/bash

####### Configuration ##########
SUPERVISOR_NUM=5

################################

docker service create \
--name storm_supervisor \
--network swarm-net \
--replicas ${SUPERVISOR_NUM} \
--endpoint-mode dnsrr \
--mount type=bind,src=/mnt/data/storm/logs,dst=/apache-storm-1.1.0/logs \
--mount type=bind,src=/mnt/data/storm/config,dst=/conf \
--mount type=bind,src=/mnt/share,dst=/mnt \
--user 1000:1000 \
storm:1.1 storm supervisor

