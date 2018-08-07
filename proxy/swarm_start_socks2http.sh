#! /bin/bash

docker service create \
	--name proxy_socks2http \
	--hostname proxy_socks2http \
	--replicas 1 \
	--detach=true \
	--network swarm-net \
	--publish 8118:8118 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/socks2http proxy_ss_cli:1080
