#!/bin/bash

# echo -n 'Hello world' | nc localhost 2399 
# nc localhost 2399 

sleep 10

echo -n 'Hello world' | nc netcat-server 2399
for i in {1..10}
do
    echo "Number $1" | nc netcat-server 2399 
done

sleep 1000