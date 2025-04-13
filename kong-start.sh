#!/bin/bash
set -e

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')] $1${NC}"
}

wait_for_healthy() {
    local container_name=$1
    local status="starting"
    while [ "$status" != "healthy" ]; do
        status=$(docker inspect --format '{{.State.Health.Status}}' "$container_name" 2>/dev/null || echo "not found")
        log "$container_name state = $status"
        sleep 5
    done
}

log "Starting Graylog stack..."
docker-compose up -d graylog elasticsearch mongo
log "Graylog running at: http://127.0.0.1:9000/"

log "Starting Kong database..."
docker-compose up -d kong-database
wait_for_healthy kong-database

log "Running Kong database migrations..."
docker-compose up migrations

log "Starting Kong..."
docker-compose up -d kong
log "Kong Admin: http://0.0.0.0:8001/"
log "Kong Proxy: http://0.0.0.0:8000/"

log "Starting Konga..."
docker-compose up -d konga
log "Konga: http://0.0.0.0:1337/"

log "Starting Grafana..."
docker-compose up -d grafana
log "Grafana: http://0.0.0.0:3000/"

log "Starting Prometheus stack..."
docker-compose up -d prometheus node_exporter
log "Prometheus: http://0.0.0.0:9090/"

log "Starting API and Database..."
docker-compose up -d db api
log "API: http://0.0.0.0:5000/"
