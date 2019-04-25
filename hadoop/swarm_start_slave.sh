#! /bin/bash

# Notice: --endpoint-mode dnsrr is required

docker service create \
	--name hadoop-slave1 \
	--hostname hadoop-slave1 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave1,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave1,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4

docker service create \
	--name hadoop-slave2 \
	--hostname hadoop-slave2 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave2,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave2,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4

docker service create \
	--name hadoop-slave3 \
	--hostname hadoop-slave3 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hadoop/config,target=/config/hadoop \
	--mount type=bind,source=/data/hadoop/hdfs/slave3,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave3,target=/usr/local/hadoop/logs \
	newnius/hadoop:2.7.4
