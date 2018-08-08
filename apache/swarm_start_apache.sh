#! /bin/bash

docker service create \
	--name apache \
	--hostname apache \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--publish 80:80 \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/apache/webroot,target=/var/www/html \
	--mount type=bind,source=/data/apache/weblogs,target=/var/log/apache2 \
	newnius/php:7.1
