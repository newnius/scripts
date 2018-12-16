#!/bin/bash

docker service create \
	--name gitea \
	--hostname gitea \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,src=/data/git/,target=/data \
	gitea/gitea
	#--publish 2222:2222 \
