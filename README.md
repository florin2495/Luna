# Luna

**Meta-repository** for the Luna baby monitoring application.

This repo does **not** contain application code. It contains the orchestration
glue — Docker Compose, environment templates, helper scripts and
cross-cutting documentation — that ties together two sibling repositories:

- [`baby-monitor-frontend`](https://github.com/marchidan-florin24/baby-monitor-frontend) — Angular PWA
- [`baby-monitor-backend`](https://github.com/marchidan-florin24/baby-monitor-backend) — .NET 8 Web API + PostgreSQL

> The GitHub URLs above are placeholders — update them once the repos are
> published.

---

## What is Luna?

Luna is a self-hosted, offline-capable baby tracker. It lets parents log
feedings, sleep sessions, diaper changes, growth measurements, medications
and more from a mobile-friendly PWA. Everything runs locally on a personal
machine via Docker Desktop — no third-party cloud involved, data never
leaves the host.

## Architecture at a glance

```
+---------------------+          +-------------------------+
|  Angular PWA        |  HTTPS   |  .NET 8 Web API         |
|  (baby-monitor-     |<-------->|  (baby-monitor-backend) |
|   frontend)         |  JSON    |                         |
+---------------------+          +------------+------------+
                                              |
                                              | Npgsql / EF Core
                                              v
                                 +-------------------------+
                                 |  PostgreSQL 16          |
                                 |  (docker volume:        |
                                 |   postgres_data)        |
                                 +-------------------------+
```

All three services run as Docker containers orchestrated by the
`docker-compose.yml` that lives in **this** repository. The frontend and
backend images are built from their respective sibling repos via relative
build contexts (`../baby-monitor-frontend`, `../baby-monitor-backend`).

## Repository layout

Luna expects the three repositories to live side-by-side on disk:

```
<your-workspace>/
├── Luna/                       <- this repo
│   ├── docker-compose.yml      (planned)
│   ├── .env.example            (planned)
│   ├── scripts/                (planned)
│   │   ├── clone-all.sh
│   │   └── start.sh
│   ├── docs/                   (planned)
│   ├── README.md
│   ├── .gitignore
│   └── LICENSE
├── baby-monitor-frontend/      <- independent repo
└── baby-monitor-backend/       <- independent repo
```

Only `README.md`, `.gitignore` and `LICENSE` are committed at this stage.
Everything marked *(planned)* lands in follow-up commits.

## Prerequisites

- **Docker Desktop** with the WSL2 backend (Windows) or native Docker
  (Linux / macOS)
- **Git** 2.30+
- **.NET 8 SDK** and **Node.js 20+** — only needed if you plan to run the
  frontend/backend outside Docker for development

## Getting started (planned workflow)

> None of this works yet — the orchestration files are not committed. These
> are the commands you will run once the stack is wired up.

### 1. Clone all three repositories

```bash
mkdir LunaApp && cd LunaApp
git clone https://github.com/<you>/Luna.git
git clone https://github.com/<you>/baby-monitor-frontend.git
git clone https://github.com/<you>/baby-monitor-backend.git
```

Or, after Luna ships the helper script:

```bash
git clone https://github.com/<you>/Luna.git && cd Luna
./scripts/clone-all.sh
```

### 2. Configure environment

```bash
cd Luna
cp .env.example .env
# edit .env — set POSTGRES_PASSWORD, JWT_SECRET, etc.
```

### 3. Start the stack

```bash
docker compose up --build
```

Services:

| Service   | URL                          |
| --------- | ---------------------------- |
| Frontend  | http://localhost:8080        |
| Backend   | http://localhost:5000        |
| Swagger   | http://localhost:5000/swagger|
| Postgres  | localhost:5432               |

### 4. Apply database migrations (first run only)

```bash
docker compose exec api dotnet ef database update
```

### 5. Stop the stack

```bash
docker compose down         # stop containers, keep data
docker compose down -v      # stop containers AND wipe the DB volume
```

## Backup and restore

Because PostgreSQL data lives in a named Docker volume, you can snapshot it
with a one-liner (example on Linux / WSL):

```bash
docker run --rm \
  -v luna_postgres_data:/data \
  -v $PWD:/backup alpine \
  tar czf /backup/luna-$(date +%F).tar.gz -C /data .
```

Restore:

```bash
docker run --rm \
  -v luna_postgres_data:/data \
  -v $PWD:/backup alpine \
  sh -c "cd /data && tar xzf /backup/luna-<date>.tar.gz"
```

A ready-to-use backup script will be added under `scripts/` in a later commit.

## Roadmap

- [x] Initial repo skeletons for Luna, frontend, backend
- [ ] `docker-compose.yml` orchestrating api + db + frontend
- [ ] `.env.example` with all required variables
- [ ] `scripts/clone-all.sh` and `scripts/start.sh`
- [ ] Backend: .NET 8 solution scaffold (API / Core / Infrastructure)
- [ ] Backend: entities, EF Core migrations, initial CRUD controllers
- [ ] Frontend: Angular PWA scaffold, Dexie.js local storage
- [ ] Auth (ASP.NET Identity + JWT)
- [ ] Offline sync (`POST /api/sync` + client `SyncService`)
- [ ] PDF export for pediatrician reports
- [ ] Push notifications (reminders)
- [ ] Multi-user support (e.g., mom + dad sharing the same baby)

## Contributing

Luna is a personal project. Suggestions and pull requests are welcome —
please open an issue first for anything non-trivial.

## License

MIT — see [LICENSE](./LICENSE). The two sibling repos are also MIT-licensed.
