#!/bin/bash
set -e

APP_NAME=lavkesh-rabbitmq
echo "$APP_NAME"
CONTAINER_ID=$(docker ps -a -f name="$APP_NAME" -q)

if [[ $? -eq 0 ]]; then
   if [[ $CONTAINER_ID != "" ]]; then
    echo "Removing CONTAINER_ID  =>  $CONTAINER_ID"
    docker stop $CONTAINER_ID
    docker rm -f $CONTAINER_ID
   fi
else
  #Fail
  echo "'docker ps -a -f name=$APP_NAME -q' command not run successfully!"
  exit 1
fi

docker run --hostname $APP_NAME --name $APP_NAME \
-p 15672:15672 -p 5672:5672 \
-e RABBITMQ_USERNAME=rabbitmq-user \
-e RABBITMQ_PASSWORD=LwXIYhhspbOomXmLfibRGzOfumBRNe96OX5jqWuQMl+uuIxY \
lavkesh/rabbitmq:$1