#! /bin/bash

# mode=host to allow white list ip

docker service create \
	--name proxy_http \
	--hostname proxy_http \
	--network swarm-net \
	--repliacs 1 \
	--detach=true \
	--publish mode=host,published=8888,target=8888 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/tinyproxy,target=/etc/tinyproxy \
	newnius/tinyproxy
