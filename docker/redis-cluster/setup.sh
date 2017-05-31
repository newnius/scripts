#! /bin/bash

REDIS_NUM=6

list=""

for i in $( seq 1 $REDIS_NUM )
do
addr=$(getent hosts "redis-$i" | awk '{ print $1 }')
list="$list $addr:6379 "
done

ruby /redis-trib.rb create --replicas 1 $list
