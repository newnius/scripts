#! /bin/bash

docker service create \
	--name hbase-slave1 \
	--hostname hbase-slave1 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/slave1,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6

docker service create \
	--name hbase-slave2 \
	--hostname hbase-slave2 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/slave2,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6

docker service create \
	--name hbase-slave3 \
	--hostname hbase-slave3 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/slave3,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6
