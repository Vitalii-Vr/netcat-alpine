#!/bin/bash

sleep 10 #wait before container network configure

echo 'Hello world' | nc netcat-server 2399 #tranfer text to netcat server
for i in {1..10}
do
    echo "Number $i" | nc netcat-server 2399 
    sleep 0.1 #wait between message
done 