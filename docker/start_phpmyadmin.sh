#! /bin/bash

docker service create \
--name phpmyadmin \
--network swarm-net \
--publish 8081:80 \
-e PMA_HOST=mysql \
-e PMA_PORT=3306 \
phpmyadmin/phpmyadmin
