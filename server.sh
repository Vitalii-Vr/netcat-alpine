#!/bin/bash

# ifconfig
# PORT=5555;

touch output.log

# nc -l 2399
# while :; 
# do 
#     nc -l localhost 2399 >> output.log
# done
while :; 
do 
    nc -l netcat-client 2399 >> output.log
done
# netcat-server 