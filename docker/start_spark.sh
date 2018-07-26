#! /bin/bash

docker service create \
--name spark-master \
--detach=true \
--hostname spark-master \
--network swarm-net \
--replicas 1 \
--reserve-memory 2048MB \
--mount type=bind,source=/mnt/data/spark/hdfs/master,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/spark/logs/master,target=/usr/local/hadoop/logs \
--endpoint-mode dnsrr \
newnius/spark


docker service create \
--name spark-slave1 \
--detach=true \
--hostname spark-slave1 \
--network swarm-net \
--replicas 1 \
--reserve-memory 2048MB \
--mount type=bind,source=/mnt/data/spark/hdfs/slave1,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/spark/logs/slave1,target=/usr/local/hadoop/logs \
--endpoint-mode dnsrr \
newnius/spark


docker service create \
--name spark-slave2 \
--detach=true \
--hostname spark-slave2 \
--network swarm-net \
--replicas 1 \
--reserve-memory 2048MB \
--mount type=bind,source=/mnt/data/spark/hdfs/slave2,target=/tmp/hadoop-root \
--mount type=bind,source=/mnt/data/spark/logs/slave2,target=/usr/local/hadoop/logs \
--endpoint-mode dnsrr \
newnius/spark
