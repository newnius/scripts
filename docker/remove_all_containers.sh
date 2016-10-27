docker ps -a | sed "s/ \+/ /g" | cut -f1 -d" "| xargs docker rm
