#! /bin/bash


# 配置区域开始
ZOOKEEPER_NUM=3

# 配置区域结束

# 首先创建ZOOKEEPER_NUM个zookeeper集群

zookeeper_str=""
if [ $ZOOKEEPER_NUM -gt 0 ]; then
  zookeeper_str+="zookeeper_1"
else
  echo "Zookeeper_num must > 0"
  exit 1
fi

for i in $( seq 2 $ZOOKEEPER_NUM )
do
  zookeeper_str+=",zookeeper_"${i}
done

echo ${zookeeper_str}

for i in $( seq 1 $ZOOKEEPER_NUM )
do
docker service create \
-e MYID=${i} \
-e SERVERS=${zookeeper_str} \
--replicas 1 \
--network my-network \
--endpoint-mode dnsrr \
--name=zookeeper_${i} mesoscloud/zookeeper:3.4.8-ubuntu-14.04
done
