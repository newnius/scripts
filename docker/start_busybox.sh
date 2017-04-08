#! /bin/bash

docker service create \
--name busybox \
--network swarm-net \
busybox \
sleep 300000
