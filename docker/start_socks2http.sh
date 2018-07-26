#! /bin/bash

docker service create \
				--name socks2http \
				--replicas 1 \
				--detach=true \
				--network swarm-net \
				--publish 8118:8118 \
				newnius/socks2http ss:1080
