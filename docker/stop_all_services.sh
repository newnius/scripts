docker service ls | cut -f1 -d" " | xargs docker service rm
