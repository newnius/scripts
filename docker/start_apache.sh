#! /bin/bash

docker service create \
--replicas 1 \
--name apache \
--network swarm-net \
--publish 80:80 \
--mount type=bind,source=/mnt/data/apache/webroot,target=/var/www/html \
--mount type=bind,source=/mnt/data/apache/weblogs,target=/var/log/apache2 \
newnius/php:5.6
