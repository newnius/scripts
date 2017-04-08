#! /bin/bash

docker service create \
--name hadoop-master \
--network swarm-net \
--hostname hadoop-master \
--replicas 1 \
--mount type=bind,source=/mnt/data/hadoop/hdfs/master,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/master,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--reserve-memory 1024MB \
--endpoint-mode dnsrr \
newnius/hadoop

docker service create \
--name hadoop-slave1 \
--network swarm-net \
--hostname hadoop-slave1 \
--replicas 1 \
--mount type=bind,source=/mnt/data/hadoop/hdfs/slave1,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/slave1,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--reserve-memory 1024MB \
--endpoint-mode dnsrr \
newnius/hadoop

docker service create \
--name hadoop-slave2 \
--network swarm-net \
--hostname hadoop-slave2 \
--replicas 1 \
--mount type=bind,source=/mnt/data/hadoop/hdfs/slave2,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/slave2,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--reserve-memory 1024MB \
--endpoint-mode dnsrr \
newnius/hadoop

docker service create \
--name hadoop-slave3 \
--network swarm-net \
--hostname hadoop-slave3 \
--replicas 1 \
--mount type=bind,source=/mnt/data/hadoop/hdfs/slave3,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/hadoop/logs/slave3,target=/usr/local/hadoop/logs \
--mount type=bind,source=/mnt/data/hadoop/config,target=/mnt/hadoop-config \
--reserve-memory 1024MB \
--endpoint-mode dnsrr \
newnius/hadoop
