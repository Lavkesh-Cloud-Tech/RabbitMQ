#!/bin/bash
set -e

echo "======================== Start build image ======================="
docker build -t lavkesh/rabbitmq:$1 .
echo "Image build => lavkesh/rabbitmq:$1"