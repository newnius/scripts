#! /bin/bash

docker service create \
	--name spark-client \
	--hostname spark-client \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	newnius/spark:2.3.1-yarn
