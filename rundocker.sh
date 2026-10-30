#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
COMPOSE_FILE="$SCRIPT_DIR/docker-compose.yml"
ENV_FILE="$SCRIPT_DIR/.env"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing $ENV_FILE. Copy .env.example to .env and set the database connection string." >&2
  exit 1
fi

sudo docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" up -d --build
sudo docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" ps

