#!/bin/sh
set -e

# No Nuxt app yet (stage 4 not done): stay alive so `docker compose up` works,
# and tell the author what to do next.
if [ ! -f package.json ]; then
  echo "[frontend] No package.json found in /app."
  echo "[frontend] Create the app with:"
  echo "[frontend]   docker compose run --rm --no-deps frontend npx nuxi@latest init . --force --packageManager npm --no-gitInit"
  exec sleep infinity
fi

[ -d node_modules/.bin ] || npm install

exec "$@"
