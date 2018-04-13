#! /bin/bash

docker service create \
--replicas 1 \
--name ss-rabbitmq \
--network swarm-net \
rabbitmq
