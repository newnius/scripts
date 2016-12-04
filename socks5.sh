#! /bin/bash

PID=-1

while [ true ]
do
  cnt=`netstat -nultp 2>/dev/null | grep -c '0.0.0.0:7001'`
  if [ ${cnt} -eq 0 ]; then
    echo "connection lost"  
    ssh -t -t -D 0.0.0.0:7001 band &
    PID=$!
    echo "connecting..., new PID="${PID}
  else  
    echo "connection works well"
  fi

  sleep 30
done
