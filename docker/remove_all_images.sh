docker images | sed -n '2,$p' | sed "s/ \+/ /g" | cut -f3 -d" "| xargs docker rmi --force
