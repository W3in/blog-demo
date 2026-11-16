# Blog demo

Rails API + Nuxt frontend + PostgreSQL, all run through Docker. You only need Git and Docker installed.

## Run

```bash
cp .env.example .env
docker compose up --build
```

| Service | URL |
| --- | --- |
| Frontend | http://localhost:3000 |
| Backend | http://localhost:3001 (`/up` health check) |
| Mailpit (dev mail inbox) | http://localhost:8025 |
| PostgreSQL | localhost:5432 |

## Status

Stage 0 (Docker setup) is done. Until the apps are created, the backend and frontend containers
stay idle and print what to run next:

```bash
# stage 1: create the Rails API
docker compose run --rm --no-deps backend rails new . --api --database=postgresql --force

# stage 4: create the Nuxt app
docker compose run --rm --no-deps frontend npx nuxi@latest init . --force --packageManager npm --no-gitInit
```

Full plan: see the project plan document.
