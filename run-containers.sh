#!/bin/bash

sudo docker system prune -a
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)

sudo docker network create --driver bridge my_network

sudo docker build -t netcat-server:v1 -f Dockerfile.server .
sudo docker build -t netcat-client:v1 -f Dockerfile.client .

sudo docker container prune -f

if [ ! -d "./mount" ]; then
    mkdir mount
fi

sudo rm -rf ./mount/*
sudo cp client.sh ./mount/client.sh
sudo cp server.sh ./mount/server.sh

sudo docker run --name=netcat-server --detach -v $(pwd)/mount:/netcat netcat-server:v1   
sudo docker run --name=netcat-client --detach -v $(pwd)/mount:/netcat netcat-client:v1

sudo docker network connect my_network netcat-server
sudo docker network connect my_network netcat-client