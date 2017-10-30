#! /bin/bash

docker service create \
--name hadoop-master \
--network swarm-net \
--hostname hadoop-master \
--replicas 1 \
--detach=true \
--mount type=bind,source=/mnt/data/hadoop/hdfs/master,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/master,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--mount type=bind,source=/mnt/share/hadoop/,target=/share \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode dnsrr \
newnius/hive:2.1.1

docker service create \
--name hadoop-slave1 \
--network swarm-net \
--hostname hadoop-slave1 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/mnt/data/hadoop/hdfs/slave1,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/slave1,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4

docker service create \
--name hadoop-slave2 \
--network swarm-net \
--hostname hadoop-slave2 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/mnt/data/hadoop/hdfs/slave2,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/slave2,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4

docker service create \
--name hadoop-slave3 \
--network swarm-net \
--hostname hadoop-slave3 \
--replicas 1 \
--detach=true \
--mount type=bind,source=/mnt/data/hadoop/hdfs/slave3,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/slave3,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--mount type=bind,source=/etc/localtime,target=/etc/localtime \
--endpoint-mode dnsrr \
newnius/hadoop:2.7.4
