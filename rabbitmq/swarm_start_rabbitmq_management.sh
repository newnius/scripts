#! /bin/bash

docker service create \
	--name rabbitmq-management \
	--name rabbitmq-management \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 15672:15672 \
	rabbitmq:3-management
