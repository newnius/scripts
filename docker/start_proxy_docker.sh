#! /bin/bash

docker service create \
--replicas 1 \
--name proxy_docker \
--network swarm-net \
--detach=true \
-p 7001:7001 \
newnius/docker-proxy
