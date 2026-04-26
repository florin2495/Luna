#!/usr/bin/env bash
#
# Bring up the Luna stack via docker compose.
#
# Usage:
#   ./scripts/start.sh           # full stack (api + db; web later)
#   ./scripts/start.sh postgres  # postgres only
#
set -euo pipefail

# Always run from the Luna repo root (the directory above this script).
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LUNA_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${LUNA_DIR}"

# 1. Make sure a .env exists.
if [ ! -f .env ]; then
  if [ -f .env.example ]; then
    echo "[setup] No .env found — copying .env.example -> .env"
    echo "        Edit .env to change credentials before going to production."
    cp .env.example .env
  else
    echo "[error] Neither .env nor .env.example present in ${LUNA_DIR}." >&2
    exit 1
  fi
fi

# 2. Start the requested services (defaults to all).
echo "[up] docker compose up -d --build $*"
docker compose up -d --build "$@"

echo
echo "[status]"
docker compose ps

cat <<'EOF'

Endpoints (when fully up):
  API      http://localhost:5000
  Health   http://localhost:5000/health
  Postgres localhost:5432

Useful commands:
  docker compose logs -f api      # follow API logs
  docker compose down             # stop, keep DB volume
  docker compose down -v          # stop AND wipe DB volume
EOF
