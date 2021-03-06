#! /bin/bash

# Notice: --endpoint-mode dnsrr is required

docker service create \
	--name spark-slave \
	--network swarm-net \
	--replicas 5 \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	newnius/spark:2.3.1 slave spark://spark-master:7077
