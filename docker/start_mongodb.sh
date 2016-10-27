#! /bin/bash

docker service create \
--replicas 1 \
--name mongodb \
--network my-network \
--endpoint-mode dnsrr \
--user 1000:1000 \
--constraint "node.hostname == ubuntu-11" \
--mount type=bind,source=/home/test/mongodb,target=/data/db \
mongo
