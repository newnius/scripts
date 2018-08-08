#! /bin/bash

REDIS_NUM=6

for i in $( seq 1 $REDIS_NUM )
do
  docker service create \
  --name "redis-$i" \
  --network swarm-net \
  --mount type=bind,src=/mnt/data/redis-cluster/config,target=/usr/local/etc/redis/ \
  redis redis-server /usr/local/etc/redis/redis.conf
done
