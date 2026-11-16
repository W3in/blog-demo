#!/bin/sh
set -e

# No Nuxt app yet (stage 4 not done). Only the default dev command idles,
# so `docker compose up` works. Any other command (like `npx nuxi init`) runs as given.
if [ ! -f package.json ]; then
  if [ "$1" = "npm" ]; then
    echo "[frontend] No package.json found in /app."
    echo "[frontend] Create the app with:"
    echo "[frontend]   docker compose run --rm --no-deps frontend npx nuxi@latest init . --force --packageManager npm --no-gitInit"
    exec sleep infinity
  fi
  exec "$@"
fi

[ -d node_modules/.bin ] || npm install

exec "$@"
