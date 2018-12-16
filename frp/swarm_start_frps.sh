#!/bin/bash

docker service create \
	--name frps \
	--hostname frps \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 18388:18388 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/frp/frps.ini,target=/frp/frps.ini \
	--mount type=bind,source=/data/frp/logs,target=/logs \
	newnius/frp:v0.21.0
