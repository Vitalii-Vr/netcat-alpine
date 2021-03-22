#!/bin/bash

sleep 15 #wait before container network configure

echo 'Hello world' | nc netcat-server 2399 #tranfer text to netcat server
for i in {1..10}
do
    echo "Number $i" | nc netcat-server 2399 
done