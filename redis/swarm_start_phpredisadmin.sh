#! /bin/bash

docker service create \
	--name phpredisadmin \
	--hostname phpredisadmin \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--env REDIS_1_HOST=redis \
	--publish 80:80 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	actency/docker-phpredisadmin
