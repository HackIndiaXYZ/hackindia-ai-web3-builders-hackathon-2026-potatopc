# Deployment

This project can be run component-by-component or via Docker Compose. See the `docker/` directory.

## Local (dev)

See the individual component READMEs in `backend/`, `ai/`, `frontend/`, `security/` and `contracts/` for component-specific setup.

## Docker

```bash
docker compose -f docker/docker-compose.yml up --build
```

Services exposed:

| Service    | Port  | Component          |
|------------|-------|--------------------|
| backend    | 8000  | FastAPI API        |
| frontend   | 3000  | Next.js UI         |
| postgres   | 5432  | Supabase / pgvector|

## Networks

- **Contracts** are deployed to **Base Sepolia** (testnet).
- Point RPC URLs at the intended network via environment variables (e.g. `BASE_SEPOLIA_RPC_URL`).
