#! /bin/bash

docker service create \
	--name neo4j \
	--hostname neo4j \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 7474:7474 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/neo4j,target=/data \
	neo4j
