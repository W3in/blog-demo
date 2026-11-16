#!/bin/sh
set -e

# No Rails app yet (stage 1 not done): stay alive so `docker compose up` works,
# and tell the author what to do next.
if [ ! -f Gemfile ]; then
  echo "[backend] No Gemfile found in /app."
  echo "[backend] Create the app with:"
  echo "[backend]   docker compose run --rm --no-deps backend rails new . --api --database=postgresql --force"
  exec sleep infinity
fi

bundle check >/dev/null 2>&1 || bundle install
rm -f tmp/pids/server.pid

exec "$@"
