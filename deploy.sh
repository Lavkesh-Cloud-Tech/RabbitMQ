#!/bin/bash
set -e

APP_NAME=rabbitmq
NETWORK_NAME=my-bridge
echo "Container Name: $APP_NAME"
echo "Network: $NETWORK_NAME"

NETWORK_ID=$(docker network ls -f "name=$NETWORK_NAME" -q)
if [[ $NETWORK_ID = "" ]]; then
  echo "Creating network  $NETWORK_NAME"
  docker network create -d bridge $NETWORK_NAME
fi

CONTAINER_ID=$(docker ps -a -f name="$APP_NAME" -q)
if [[ $CONTAINER_ID != "" ]]; then
  echo "Removing CONTAINER_ID  =>  $CONTAINER_ID"
  docker stop $CONTAINER_ID
  docker rm -f $CONTAINER_ID
fi

docker run -d --name $APP_NAME \
--network=$NETWORK_NAME \
-p 15672:15672 -p 5672:5672 \
-e RABBITMQ_USERNAME=rabbitmq-user \
-e RABBITMQ_PASSWORD=LwXIYhhspbOomXmLfibRGzOfumBRNe96OX5jqWuQMl+uuIxY \
lavkesh/rabbitmq:$1