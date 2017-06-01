#! /bin/bash

####### Configuration ##########

################################

docker service create \
--name storm_ui \
--network swarm-net \
--publish 8080:8080 \
--endpoint-mode vip \
--mount type=bind,src=/mnt/data/storm/config,dst=/conf \
storm:1.1 storm ui
