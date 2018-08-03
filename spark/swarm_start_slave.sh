#! /bin/bash

# Notice: --endpoint-mode dnsrr is required

docker service create \
	--name spark-slave1 \
	--hostname spark-slave1 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/spark/hdfs/slave1,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/spark/logs/slave1,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/spark


docker service create \
	--name spark-slave2 \
	--hostname spark-slave2 \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/spark/hdfs/slave2,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/spark/logs/slave2,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/spark
