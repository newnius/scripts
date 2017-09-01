#! /bin/bash

docker service create \
--replicas 1 \
--name redis \
--network swarm-net \
--endpoint-mode dnsrr \
--user 1000:1000 \
--detach=true \
--mount type=bind,source=/mnt/data/redis,target=/data \
redis redis-server --appendonly yes
