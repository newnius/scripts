#! /bin/bash

# Notice: --endpoint-mode dnsrr is required

docker service create \
	--name spark-master \
	--hostname spark-master \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,source=/data/spark/hdfs/master,target=/tmp/hadoop-root \
	--mount type=bind,source=/data/spark/logs/master,target=/usr/local/hadoop/logs \
	--endpoint-mode dnsrr \
	newnius/spark
