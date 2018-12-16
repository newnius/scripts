#! /bin/bash

docker service create \
	--name Real \
	--network swarm-net \
	--detach=true \
	--replicas 1 \
	-e url=http://example.com \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/example.com/,target=/var/lib/ghost/content \
	ghost:2.7-alpine
