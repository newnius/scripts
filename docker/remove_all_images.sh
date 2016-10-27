docker images | sed "s/ \+/ /g" | cut -f3 -d" "| xargs docker rmi --force
