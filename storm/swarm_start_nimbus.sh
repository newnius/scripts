#! /bin/bash

####### Configuration ##########
NIMBUS_NUM=3
################################

for i in $( seq 1 $NIMBUS_NUM ) ; do
	docker service create \
		--name storm_nimbus${i} \
		--hostname storm_nimbus${i} \
		--network swarm-net \
		--replicas 1 \
		--detach=true \
		--endpoint-mode dnsrr \
		--mount type=bind,source=/etc/localtime,target=/etc/localtime \
		--mount type=bind,src=/data/storm/logs,dst=/logs \
		--mount type=bind,src=/data/storm/data/nimbus${i},dst=/data \
		--mount type=bind,src=/data/storm/config/storm.yaml,dst=/conf/storm.yaml \
		--user 1000:1000 \
		storm:1.1 storm nimbus
done
