#! /bin/bash

docker service create \
	--name portainer \
	--hostname portainer \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 9000:9000 \
	--mount type=bind,source=/data/portainer/data,target=/data \
	portainer/portainer
