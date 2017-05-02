#! /bin/bash

####### Configuration ##########
ZOOKEEPER_NUM=3

################################

function join() {
    # $1 is return variable name
    # $2 is sep
    # $3... are the elements to join
    local retname=$1 sep=$2 ret=$3
    shift 3 || shift $(($#))
    printf -v "$retname" "%s" "$ret${@/#/$sep}"
}

for i in $( seq 1 $ZOOKEEPER_NUM )
do
  array[${i}]=zookeeper_node${i}
done
join zookeeper_str , "${array[@]}"


for i in $( seq 1 $ZOOKEEPER_NUM )
do
docker service create \
-e MYID=${i} \
-e SERVERS=${zookeeper_str} \
--replicas 1 \
--name=zookeeper_node${i} \
--network swarm-net \
--hostname zookeeper_node${i} \
--endpoint-mode vip \
--mount type=bind,src=/mnt/data/zookeeper/node${i},dst=/tmp/zookeeper \
mesoscloud/zookeeper:3.4.8-ubuntu-14.04
echo "./renter zookeeper_node${i}.1 /opt/zookeeper/bin/zkServer.sh status"
done

