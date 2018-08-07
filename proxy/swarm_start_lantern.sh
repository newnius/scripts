#!/bin/bash

docker service create \
	--name proxy_lantern \
	--hostname proxy_lantern \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 3128:3128 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/lantern
