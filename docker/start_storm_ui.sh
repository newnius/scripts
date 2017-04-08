#! /bin/bash

####### Configuration ##########
ZOOKEEPER_NUM=3
NIMBUS_NUM=3

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
join zookeepers_str \",\" "${array[@]}"
zookeepers_str="[\""${zookeepers_str}"\"]"
echo ${zookeepers_str}

for i in $( seq 1 $NIMBUS_NUM )
do
  nimbus_array[${i}]=storm_nimbus${i}
done
join nimbuss_str \",\" "${nimbus_array[@]}"
nimbuss_str="[\""${nimbuss_str}"\"]"
echo ${nimbuss_str}


docker service create \
--name storm_ui \
--network swarm-net \
--publish 8080:8080 \
--endpoint-mode vip \
--mount type=bind,src=/mnt/share,dst=/mnt \
31z4/storm storm ui \
-c storm.zookeeper.servers="${zookeepers_str}" \
-c nimbus.seeds="${nimbuss_str}"
echo "./renter storm_ui.1 netstat -nultp"
