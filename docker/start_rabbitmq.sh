#! /bin/bash

docker service create \
--replicas 1 \
--name ss-rabbitmq \
--detach=true \
--network swarm-net \
rabbitmq
