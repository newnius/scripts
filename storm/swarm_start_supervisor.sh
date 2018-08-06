#! /bin/bash

####### Configuration ##########
SUPERVISOR_NUM=5

################################

docker service create \
	--name storm_supervisor \
	--hostname storm_supervisor_{{.Task.ID}} \
	--network swarm-net \
	--replicas ${SUPERVISOR_NUM} \
	--detach=true \
	--endpoint-mode dnsrr \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/data/storm/logs,dst=/apache-storm-1.1.0/logs \
	--mount type=bind,src=/data/storm/config/storm.yaml,dst=/conf/storm.yaml \
	--user 1000:1000 \
storm:1.1 storm supervisor
