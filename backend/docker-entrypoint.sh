#!/bin/sh
set -e

# No Rails app yet (stage 1 not done). Only the default server command idles,
# so `docker compose up` works. Any other command (like `rails new`) runs as given.
if [ ! -f Gemfile ]; then
  if [ "$1" = "bin/rails" ]; then
    echo "[backend] No Gemfile found in /app."
    echo "[backend] Create the app with:"
    echo "[backend]   docker compose run --rm --no-deps backend rails new . --api --database=postgresql --skip-git --force"
    exec sleep infinity
  fi
  exec "$@"
fi

bundle check >/dev/null 2>&1 || bundle install
rm -f tmp/pids/server.pid

exec "$@"
