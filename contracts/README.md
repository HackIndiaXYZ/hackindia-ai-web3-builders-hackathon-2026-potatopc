# contracts

Smart contracts implementing the verifiable access-permission layer for Synapse, deployed to **Base Sepolia**.

## Overview

The blockchain component of Synapse provides a transparent, tamper-proof record of who can access which memories and for how long. Users grant, limit and revoke agent access to specific memories on-chain, while the sensitive memory content itself remains encrypted off-chain.

## Contracts

| Contract            | Purpose                                                              |
|---------------------|----------------------------------------------------------------------|
| `MemoryPermission`  | Grants / limits / revokes agent access to a user's memory vault      |
| `MemoryAccess`      | Records access grants with scoped memory references and expiry       |

## Tech Stack

- **Language** — Solidity
- **Frameworks** — OpenZeppelin (access control, nonces), Foundry (Forge + Cast)
- **Network** — Base Sepolia testnet

## Architecture

1. A user's wallet address is their verifiable identity.
2. `grantAccess` issues a scoped, time-limited access token for an agent to query specific memories.
3. `revokeAccess` / expiry enforces the permission lifecycle.
4. Consumers verify permissions against the chain before serving any memory.

## Getting Started

```bash
# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Install deps (OpenZeppelin etc.)
forge install

# Build
forge build

# Run tests
forge test

# Deploy to Base Sepolia
forge script script/Deploy.s.sol --rpc-url $BASE_SEPOLIA_RPC_URL --broadcast

# Deploy locally
anvil
```

## Directory Layout

```
contracts/
├── src/          # contracts
├── test/         # Foundry tests
├── script/       # deployment scripts
└── foundry.toml  # Foundry config
```
