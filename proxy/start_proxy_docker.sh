#! /bin/bash

docker service create \
	--name proxy_docker \
	--hostname proxy_docker \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 7001:7001 \
	newnius/docker-proxy
