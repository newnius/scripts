#! /bin/bash

docker service create \
--replicas 1 \
--name mongodb \
--network swarm-net \
--endpoint-mode dnsrr \
--user 1000:1000 \
--mount type=bind,src=/mnt/data/mongodb,dst=/data/db \
mongo
