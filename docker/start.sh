#! /bin/bash

PID=-1

while [ true ]
do
  kill ${PID}
  ssh -t -t -D 0.0.0.0:7001 band &
  PID=$!
  sleep 18000
done
