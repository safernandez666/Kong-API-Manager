#!/bin/bash

echo "Starting Graylog..."

docker-compose up -d graylog elasticsearch mongo

echo "Graylog running http://127.0.0.1:9000/"

echo "Starting kong-database..."

#docker volume rm $(docker volume ls -q)

docker-compose up -d kong-database

STATUS="starting"

while [ "$STATUS" != "healthy" ]
do
    STATUS=$(docker inspect --format {{.State.Health.Status}} kong-database)
    echo "kong-database state = $STATUS"
    sleep 5
done

echo "Run database migrations..."

docker-compose up migrations

echo "Starting kong..."

docker-compose up -d kong

echo "Kong admin running http://0.0.0.0:8001/"
echo "Kong proxy running http://0.0.0.0:8000/"

echo "Starting konga..."

docker-compose up -d konga

echo "Konga running http://0.0.0.0:1337/"

docker-compose up -d grafana

echo "Grafana running http://0.0.0.0:3000/"

echo "Starting prometheus..."

docker-compose up -d prometheus node_exporter

echo "Prometheus running http://0.0.0.0:9090/"

echo "Starting API & DB..."

docker-compose up -d db api 

echo "API on http://0.0.0.0:5000/"