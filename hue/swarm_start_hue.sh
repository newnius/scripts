#!/bin/bash

docker service create \
	--name hue \
	--hostname hue \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 8888:8888 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	gethue/hue:latest sleep 10000000


#make apps && ./build/env/bin/desktop runserver 0.0.0.0:8888
