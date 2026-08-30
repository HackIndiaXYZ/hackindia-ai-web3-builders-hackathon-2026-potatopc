# Architecture

## System Overview

Synapse is built as a monorepo of four core components plus a blockchain access-control layer and Docker-based orchestration.

```
                ┌───────────────────────────────────────────┐
                │                 Frontend                  │
                │            (Next.js / wagmi+viem)         │
                └───────┬───────────────┬───────────┬───────┘
                        │ HTTP          │ wallet    │
                        ▼               │ signature │
              ┌─────────────────┐       ▼           ▼
              │     Backend     │   ┌──────────────────────┐
              │    (FastAPI)    │◄──┤      Security        │
              └───┬─────────┬───┘   │  (AES-GCM crypto)    │
                  │         │       └──────────────────────┘
          encrypted│         │ retrieval
          storage  ▼         ▼
              ┌─────────┐ ┌──────────────┐
              │ Supabase│ │  AI Engine   │
              │Postgres │ │ (LLM + RAG)  │
              │ pgvector│ │  embeddings  │
              └─────────┘ └──────┬───────┘
                                 │ verify access
                                 ▼
                        ┌──────────────────────┐
                        │  Smart Contracts     │
                        │ (Base Sepolia)       │
                        │ Access Permissions   │
                        └──────────────────────┘
```

## Data Flow

1. **Identity** — user's wallet is their verifiable identity (wagmi / viem).
2. **Ingestion** — memories are pushed to the backend, embedded by the AI engine, stored encrypted in Supabase/Postgres + pgvector.
3. **Permissions** — access grants are recorded on-chain by the contracts.
4. **Consumption** — an agent requests a memory; the backend verifies permission against the chain and returns decrypted content only if allowed.

## Privacy Model

- Sensitive memory content is **encrypted off-chain** (AES-GCM) with keys held by the user.
- The blockchain stores **only verifiable permission metadata**, never raw memory content.
- Permissions can be **granted, limited or revoked** at any time.
