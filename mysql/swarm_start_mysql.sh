#! /bin/bash

docker service create \
	--name mysql \
	--hostname mysql \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--user 1000:1000 \
	--mount type=bind,source=/data/mysql/data,target=/var/lib/mysql \
	--mount type=bind,source=/data/mysql/conf,target=/etc/mysql/conf.d \
	-e MYSQL_ROOT_PASSWORD=123456 \
	mysql:5.7
