#!/bin/bash

touch output.log

while :; 
do 
    nc -vlkp 2399 >> output.log #listen 2399 port and write to log file
done