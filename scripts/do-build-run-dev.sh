#!/bin/bash

echo "Building docker images"

docker build -t do-nginx:latest -f nginx/Dockerfile .
docker build -t do-microservice-one:latest -f microservice-one/Dockerfile .
docker build -t do-microservice-two:latest -f microservice-two/Dockerfile .

echo "Building successfull"

docker-compose -f docker-compose_dev.yml up