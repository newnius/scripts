#! /bin/bash

docker service create \
	--name rabbitmq \
	--hostname rabbitmq \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	rabbitmq
