#! /bin/bash

docker service create \
--name busybox \
--detach=true \
--network swarm-net \
busybox \
sleep 300000
