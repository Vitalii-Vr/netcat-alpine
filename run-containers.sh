#!/bin/bash

sudo docker system prune -a
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)

sudo docker network create --driver bridge my_network

sudo docker build -t netcat-server:v2 -f Dockerfile.server .
sudo docker build -t netcat-client:v2 -f Dockerfile.client .

sudo docker container prune -f

sudo docker run --name=netcat-server --detach  netcat-server:v2   
sudo docker run --name=netcat-client --detach -v $(pwd)/mount:/netcat netcat-client:v2

sudo docker network connect my_network netcat-server
sudo docker network connect my_network netcat-client