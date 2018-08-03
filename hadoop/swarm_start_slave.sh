#! /bin/bash

# Notice: --endpoint-mode dnsrr is required

docker service create \
	--name hadoop-slave1 \
	--hostname hadoop-slave1 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hadoop/config,target=/mnt/hadoop-config \
	--mount type=bind,source=/data/hadoop/hdfs/slave1,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave1,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/hadoop:2.7.4

docker service create \
	--name hadoop-slave2 \
	--network swarm-net \
	--hostname hadoop-slave2 \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hadoop/config,target=/mnt/hadoop-config \
	--mount type=bind,source=/data/hadoop/hdfs/slave2,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave2,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/hadoop:2.7.4

docker service create \
	--name hadoop-slave3 \
	--hostname hadoop-slave3 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hadoop/config,target=/mnt/hadoop-config \
	--mount type=bind,source=/data/hadoop/hdfs/slave3,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/slave3,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/hadoop:2.7.4
