#! /bin/bash

docker service create \
	--name hbase-master \
	--hostname hbase-master \
	--network swarm-net \
	--replicas 1 \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly \
	--mount type=bind,source=/data/hbase/config,target=/config/hbase \
	--mount type=bind,source=/data/hbase/logs/master,target=/usr/local/hbase/logs \
	newnius/hbase:1.2.6
