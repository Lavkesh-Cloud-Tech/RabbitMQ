#!/bin/bash
set -e

APP_NAME=lavkesh-rabbitmq
echo "$APP_NAME"
CONTAINER_ID=$(docker ps -a -f name="$APP_NAME" -q)

if [[ $? -eq 0 ]]; then
   echo "CONTAINER_ID  =>  $CONTAINER_ID"

   if [[ $CONTAINER_ID != "" ]]; then
    docker stop $CONTAINER_ID
    docker rm -f $CONTAINER_ID
   fi

else
  #Fail
  echo "'docker ps -a -f name=$APP_NAME -q' command not run succefully!"
  exit 1
fi

docker run -d --hostname $APP_NAME --name $APP_NAME \
-p 15672:15672 -p 8080:15672 \
-e RABBITMQ_USERNAME=user \
-e RABBITMQ_PASSWORD=LwXIYhhspbOomXmLfibRGzOfumBRNe96OX5jqWuQMl+uuIxY \
lavkesh/rabbitmq:$1