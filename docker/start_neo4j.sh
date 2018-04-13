#! /bin/bash

docker service create \
--replicas 1 \
--name neo4j \
--network swarm-net \
--publish 7474:7474 \
--mount type=bind,source=/mnt/data/neo4j,target=/data \
neo4j
