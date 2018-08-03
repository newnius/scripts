#! /bin/bash

# Notice: --endpoint-mode dnsrr is required

docker service create \
	--name hadoop-master \
	--hostname hadoop-master \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/hadoop/config,target=/mnt/hadoop-config \
	--mount type=bind,source=/data/hadoop/hdfs/master,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/hadoop/logs/master,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/hadoop:2.7.4
