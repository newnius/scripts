#!/bin/bash

docker service create \
	--name hadoop-proxy \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 7001:7001 \
	newnius/docker-proxy
