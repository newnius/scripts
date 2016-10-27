docker service create \
--name storm_supervisor \
--replicas 5 \
--network my-network \
--endpoint-mode dnsrr \
--mount type=bind,src=/mnt/Package,dst=/package,readonly \
--env ZOOKEEPER_1=zookeeper_1 \
--env ZOOKEEPER_2=zookeeper_2 \
--env ZOOKEEPER_3=zookeeper_3 \
--env NIMBUS_SEED_1=storm_nimbus_1 \
--env NIMBUS_SEED_2=storm_nimbus_2 \
--env NIMBUS_SEED_3=storm_nimbus_3 \
sun/storm \
start-service supervisor

