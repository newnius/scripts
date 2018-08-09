# Short Commands

## denter

```bash
denter hadoop-mas
```

->

```bash
docker exec -it hadoop-mas*
```

## dsls

```bash
dsls
```

->

```bash
docker service ls
```

## dsps

```bash
dsps hadoop-master
```

->

```bash
docker service ps hadoop-master
```

## dstop

```bash
dstop hadoop-
```

->

```bash
docker service stop hadoop-master
docker service stop hadoop-slave1
docker service stop hadoop-slave2
docker service stop hadoop-slave3
```

## renter

enter remote docker container

```bash
renter [options] taskId [command]
```

->

```bash
docker -H ${node}:2375 exec -d ${containerId} ${comm:-/bin/bash}
```

## distribute_file

distribute file to other (multi) hosts (ssh passwordless required)

```bash
distribute_file config.json host1 host2 host3 ...
```

->

```bash
scp config.json host1:~/
scp config.json host2:~/
scp config.json host3:~/
...
```

## distribute_task

distribute and execute cmds on other (multi) hosts

```bash
distribute_task install_docker.sh host1 host2 host3 ...
```

->

```bash
ssh host1 "cat > cluster_task.sh && bash cluster_task.sh && rm cluster_task.sh" < install_docker.sh
ssh host2 "cat > cluster_task.sh && bash cluster_task.sh && rm cluster_task.sh" < install_docker.sh
ssh host3 "cat > cluster_task.sh && bash cluster_task.sh && rm cluster_task.sh" < install_docker.sh
...
```

[example](task.sh)

## remove_all_containers

kill & rm all containers on this host

```bash
remove_all_containers
```

->

```bash
docker kill hadoop-master
docker rm hadoop-master
docker kill hadoop-slave1
docker rm hadoop-slave1
docker kill hadoop-slave2
docker rm hadoop-slave2
...
```

## remove_all_images

clear unnecessary docker images to free the space

```bash
remove_all_images
```

->

```bash
docker rmi newnius/hadoop:latest
...
```

## stop_all_services

stop all services

```bash
stop_all_services
```

->

```bash
docker service rm hadoop-master
docker service rm hadoop-slave1
docker service rm hadoop-slave2
...
```
