#! /bin/bash

docker service create \
	--name hive \
	--hostname hive \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hive/config,target=/config/hive \
	newnius/hive:2.1.1
