#! /bin/bash

docker service create \
--replicas 1 \
--name mysql \
--network swarm-net \
--endpoint-mode dnsrr \
--user 1000:1000 \
--mount type=bind,source=/mnt/data/mysql,target=/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=123456 \
mysql
