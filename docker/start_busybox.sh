#! /bin/bash

docker service create \
--name busybox \
--network my-network \
busybox \
sleep 300000
