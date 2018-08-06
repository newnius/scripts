#! /bin/bash

####### Configuration ##########

################################

docker service create \
	--name storm_ui \
	--hostname storm_ui \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 8080:8080 \
	--endpoint-mode vip \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/data/storm/config/storm.yaml,dst=/conf/storm.yaml \
	storm:1.1 storm ui
