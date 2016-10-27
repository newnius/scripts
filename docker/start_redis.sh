#! /bin/bash

docker service create \
--replicas 1 \
--name redis \
--network my-network \
--endpoint-mode dnsrr \
--user 1000:1000 \
--mount type=bind,source=/mnt/Data/redis,target=/data \
redis redis-server --appendonly yes
