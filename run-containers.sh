#!/bin/bash

sudo docker system prune -a
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
# sudo docker network create my_network

sudo docker network create --driver bridge my_network

sudo docker build -t netcat-client:v1 -f Dockerfile.client .
sudo docker build -t netcat-server:v1 -f Dockerfile.server .

sudo docker container prune -f

sudo docker run --name=netcat-server --network my_network --detach -v ${pwd}:/netcat netcat-server:v1   
sudo docker run --name=netcat-client --network my_network --detach -v ${pwd}:/netcat netcat-client:v1
