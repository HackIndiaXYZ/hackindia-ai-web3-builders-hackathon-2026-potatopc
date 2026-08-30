# Synapse: User Owned Memory for AI Agents

Synapse is a decentralized memory layer that allows users to own, manage and share their AI context across different AI agents. Instead of each AI application keeping its own isolated memory, Synapse provides a single user controlled memory vault containing information such as projects, skills, preferences and knowledge.

AI agents can request access to specific memories for a particular task, while users decide what information can be shared and for how long. Permissions can be granted, limited or revoked at any time.

AI handles intelligent memory organization and retrieval while blockchain provides a verifiable layer for user identity and access permissions. Sensitive memories remain encrypted off-chain keeping private data separate from the blockchain.

### In short, Synapse makes AI memory portable, permissioned and user owned.

## The Problem

Today every AI application traps the user inside its own isolated memory silo — chat histories, preferences, projects and knowledge live behind each app's walls. Moving between assistants means re-explaining yourself from scratch, and the user has no control over what is stored, shared or retained.

## The Synapse Solution

Synapse flips this model. Instead of apps owning your context, **you** own a single memory vault that plugs into any AI agent:

- **Portable** — one memory layer consumed by any AI application.
- **Permissioned** — agents request access to specific memories for a specific task.
- **User owned** — grant, limit or revoke access at any time.

AI handles the intelligent organization and retrieval of memories (via RAG + embeddings), while blockchain provides a verifiable, tamper-proof layer for identity and access permissions. Sensitive memories stay **encrypted off-chain**, keeping private data separate from the chain.

## Repository Structure

This is a monorepo split into several components:

```
├── ai/          # AI / memory engine (Python)
├── backend/     # API layer (Python / FastAPI)
├── contracts/   # Smart contracts (Solidity / Foundry)
├── docker/      # Dockerfiles + docker-compose orchestration
├── docs/        # Architecture & deployment documentation
├── frontend/    # User + agent UI (Next.js / TypeScript)
├── security/    # Crypto layer (TypeScript / Bun)
└── README.md
```

| Directory    | Role                                             | Stack                                                  |
|--------------|--------------------------------------------------|--------------------------------------------------------|
| `frontend/`  | Wallet-connected UI for the memory vault         | Next.js, React 19, Tailwind v4, TypeScript, bun        |
| `backend/`   | REST API, auth, data / permission orchestration  | FastAPI, Uvicorn, Supabase / PostgreSQL                |
| `ai/`        | Memory ingestion, organization and retrieval     | Local LLM, RAG + embeddings, pgvector                  |
| `contracts/` | On-chain access-permission layer                 | Solidity, OpenZeppelin, Foundry, Base Sepolia          |
| `security/`  | Client-side encryption & signing primitives      | AES-GCM encryption, wallet signatures, Bun             |
| `docs/`      | Project documentation                           | Markdown                                               |
| `docker/`    | Containerized orchestration                      | Docker, docker-compose, pgvector                       |

## Tech Stack

- **Frontend** — Next.js, React 19, Tailwind CSS, wagmi + viem
- **Backend** — FastAPI, Uvicorn, Supabase / PostgreSQL
- **AI / Memory** — Local LLM, RAG + Embeddings, pgvector
- **Web3** — Solidity, OpenZeppelin, Base Sepolia, Foundry
- **Security** — AES-GCM Encryption, Wallet Signatures

## Architecture

1. **User connects a wallet** via the frontend (wagmi / viem) — the wallet becomes their verifiable identity.
2. **Memories are ingested** and organized by the AI layer: embeddings are stored in pgvector and encrypted with the user's key (AES-GCM) before any sensitive data touches off-chain storage.
3. **Agents request access** to specific memories for a specific task and duration.
4. **Access control is enforced on-chain** via the Solidity contracts in [`contracts/`](contracts/README.md) deployed to Base Sepolia — grants and revocations are transparent and verifiable.

See [`docs/architecture.md`](docs/architecture.md) for a full system diagram and data-flow description.

## Getting Started

### Prerequisites

- [Bun](https://bun.com) (frontend / security)
- [uv](https://docs.astral.sh/uv/) + Python >= 3.14 (ai / backend)
- A wallet (e.g. MetaMask) for the web3 flow

### Frontend

```bash
cd frontend
bun install
bun dev        # http://localhost:3000
```

### Backend

```bash
cd backend
uv sync
uv run python main.py
```

### AI / Memory

```bash
cd ai
uv sync
uv run python main.py
```

### Security

```bash
cd security
bun install
bun run index.ts
```

### Contracts

```bash
cd contracts
foundryup
forge install
forge build
forge test
```

### Docker (all services)

```bash
docker compose -f docker/docker-compose.yml up --build
```

> Note: The components are currently scaffolded. Individual `README.md` files inside each directory describe the local setup for that package. See [`docs/`](docs/README.md) for architecture and deployment details.

## Roadmap

- [ ] Memory Vault CRUD with wallet-authenticated access
- [ ] AI ingestion pipeline (local LLM + embeddings + pgvector retrieval)
- [ ] AES-GCM off-chain encryption of sensitive memories
- [ ] Solidity access-control contracts on Base Sepolia
- [ ] Agent-facing API for permissioned memory requests
- [ ] Grant / limit / revoke permission lifecycle UI

## License

This project is licensed under the [MIT License](LICENSE).
