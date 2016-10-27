#! /bin/bash

docker service create \
--replicas 1 \
--name neo4j \
--network my-network \
--publish 7474:7474 \
--mount type=bind,source=/mnt/Data/neo4j,target=/data \
neo4j
