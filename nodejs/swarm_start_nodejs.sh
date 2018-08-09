#!/bin/bash

docker service create \
	--name nodejs \
	--hostname nodejs \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 80:80 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/data/nodejs,target=/data \
	node:10-alpine sleep 100000000
