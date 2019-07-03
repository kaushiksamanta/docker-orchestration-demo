#!/bin/bash

echo "Building docker images"

docker build -t do-static:latest -f prod.Dockerfile .

echo "Building successfull"

docker-compose -f docker-compose_prod.yml up