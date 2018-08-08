#! /bin/bash

docker service create \
	--name mongodb \
	--hostname mongodb \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--user 1000:1000 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/data/mongodb/data,dst=/data/db \
	mongo
