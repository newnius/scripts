# scripts

## Docker
  - [remove_all_images.sh](docker/remove_all_images.sh)
  - [start_mongodb.sh](docker/start_mongodb.sh)
  - [start_nginx.sh](docker/start_nginx.sh)
  - [start_socks.sh](docker/start_socks.sh)
  - [start_storm_ui.sh](docker/start_storm_ui.sh)
  - [start_apache_php7.sh](docker/start_apache_php7.sh)
  - [start_mysql.sh](docker/start_mysql.sh)
  - [start_redis.sh](docker/start_redis.sh)
  - [start_storm_nimbus.sh](docker/start_storm_nimbus.sh)
  - [start_zookeeper.sh](docker/start_zookeeper.sh)
  - [remove_all_containers.sh](docker/remove_all_containers.sh)
  - [start_busybox.sh](docker/start_busybox.sh)
  - [start_neo4j.sh](docker/start_neo4j.sh)
  - [start.sh](docker/start.sh)
  - [start_storm_supervisor.sh](docker/start_storm_supervisor.sh)
  - [stop_all_services.sh](docker/stop_all_services.sh)

## bin
  - [denter](bin/denter) --> docker exec -it $1 bash (support regex)
  - [dsls](bin/dsls)   --> docker service ls
  - [dsps](bin/dsps)   --> docker service ps $1
  - [dstart](bin/dstart) --> bash start_$1.sh
  - [dstop](bin/dstop)  --> docker service rm $1 (support regex, multi)

## Others
