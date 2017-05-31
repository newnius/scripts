#! /bin/bash

docker service create \
--replicas 1 \
--name ss-rabbitmq \
--network swarm-net \
--publish 15672:15672 \
rabbitmq:3-management
