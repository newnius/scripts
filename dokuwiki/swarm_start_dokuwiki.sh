#! /bin/bash

docker service create \
	--name wiki \
	--hostname wiki \
	--replicas 1 \
	--network swarm-net \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/wiki,target=/bitnami \
	bitnami/dokuwiki
