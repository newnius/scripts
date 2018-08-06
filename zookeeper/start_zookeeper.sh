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
  array[${i}]=server.${i}=zookeeper_node${i}:2888:3888
done
join zookeeper_str " " "${array[@]}"

echo ${zookeeper_str}

for i in $( seq 1 $ZOOKEEPER_NUM )
do

docker service create \
	--name zookeeper_node${i} \
	--env ZOO_MY_ID=${i} \
	--env ZOO_SERVERS=${zookeeper_str} \
	--replicas 1 \
	--network swarm-net \
	--endpoint-mode dnsrr \
	--detach=true \
	--mount type=bind,source=/etc/localtime,target=/etc/localtime \
	--mount type=bind,src=/mnt/data/zookeeper/node${i},dst=/data \
	zookeeper:latest
done
