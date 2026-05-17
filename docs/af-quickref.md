# af CLI Quick Reference

## What af Is

`af` (Adversarial Proof Framework) is a command-line tool for collaborative natural-language mathematical proof construction. Multiple AI agents work concurrently in strictly separated prover and verifier roles: provers decompose and argue; verifiers attack and challenge. No agent plays both roles. All state lives in an append-only ledger of JSON events, with POSIX-atomic file operations for concurrency safety. The result is a tree of proof nodes, each progressing from `draft` → `pending` → `validated` (or `challenged` → `resolved` → re-submitted). Completed proofs can be exported to LaTeX or other formats.

Binary: `/home/tobias/go/bin/af` (on PATH). Workspace discovery: `af` looks for a `ledger/` directory in the current working directory. Always `cd` into the workspace root (e.g., `cft-anyons-deprecated/af/master/`) before running commands.

---

## The Prover/Verifier Loop — Worked Example

```
# 1. Initialise (done once by setup agent)
af init --conjecture "Prove X"

# 2. Prover claims root node and adds first child
af claim 1       --owner prover-1 --role prover
af refine 1      --owner prover-1 -s "Case split: assume A"
af submit 1.1    --owner prover-1
af release 1     --owner prover-1

# 3. Fresh verifier sub-agent reviews the child
af claim 1.1     --owner verifier-1 --role verifier
af accept 1.1    --agent verifier-1           # if satisfied
# or:
af challenge 1.1 --owner verifier-1 --reason "Missing: why A implies B"
af release 1.1   --owner verifier-1

# 4. Prover addresses the challenge
af claim 1.1     --owner prover-1 --role prover
af refine 1.1    --owner prover-1 -s "A implies B because ..."
af resolve-challenge 1.1:c1 --owner prover-1
af release 1.1   --owner prover-1

# 5. Verifier re-reviews and accepts
af claim 1.1     --owner verifier-2 --role verifier   # fresh agent
af accept 1.1    --agent verifier-2
af release 1.1   --owner verifier-2

# 6. When all children of node N are validated, parent N can be accepted
af accept 1      --agent verifier-3
```

The key invariant: **never let the prover verify its own nodes**. Each verification step should use a fresh agent identity.

---

## Principal Commands by Group

### Setup & Status

| Command | Purpose |
|---------|---------|
| `af init --conjecture "..."` | Create a new workspace in the current directory |
| `af status` | Full proof tree with epistemic states (colour-coded) |
| `af progress` | Numeric summary: % validated, node counts by state, blockers |
| `af health` | Health check: detects stuck states, open challenges, next step |
| `af handoff` | Concise session-transition summary (completion %, open jobs) |
| `af outline` | Per-stage coverage (requires prior `af outline set`) |
| `af coverage` | Coverage metrics over outline stages |
| `af repair-stats [node]` | Repair fatigue: warns if a node has cycled 3+ times |
| `af export` | Export proof to LaTeX/Markdown |

### Agent Workflow

| Command | Purpose |
|---------|---------|
| `af jobs [--role prover\|verifier]` | List available work items |
| `af agents` | Show active claims and recent 50 activity events |
| `af claim <id> --owner <name> --role prover\|verifier` | Lock a node for work |
| `af extend-claim <id> --owner <name>` | Extend claim expiry |
| `af release <id> --owner <name>` | Release a claimed node |
| `af pending-defs` | List unresolved definition requests |
| `af pending-refs` | List unresolved external reference requests |

### Prover Commands

| Command | Purpose |
|---------|---------|
| `af refine <id> --owner <name> -s "..."` | Add a child node to a claimed parent |
| `af refine-sibling <id> --owner <name> -s "..."` | Add a sibling at parent level |
| `af submit <id> --owner <name>` | Submit a draft node for verification |
| `af amend <id> --owner <name>` | Correct a node's statement |
| `af resolve-challenge <id>:<ch-id> --owner <name>` | Answer a challenge with updated proof |
| `af approach-tried <id> --owner <name>` | Record a failed approach (prevents loops) |
| `af extract-lemma <id>` | Package a validated node as a reusable lemma |
| `af attach <id> --file <path>` | Attach computational evidence (hashed) |
| `af request-def <term>` | Request a definition for an undefined term |
| `af strategy-propose <id>` | Propose a high-level proof strategy |

### Verifier Commands

| Command | Purpose |
|---------|---------|
| `af accept <id> --agent <name>` | Accept a validated node |
| `af challenge <id> --owner <name> --reason "..."` | Raise a challenge |
| `af withdraw-challenge <id>:<ch-id>` | Retract a challenge |
| `af request-refinement <id>` | Ask for more detail without full challenge |
| `af unadmit <id>` | Revoke an admission (revert to pending) |
| `af unvalidate <id>` | Revoke validation (revert to pending) |
| `af claim-test <id>` | Run computational falsification on a node's claim |
| `af def-check <term>` | Stress-test a definition |

### Escape Hatches

| Command | Purpose |
|---------|---------|
| `af admit <id>` | Accept without full verification — **introduces taint** |
| `af archive <id>` | Abandon a branch (mark superseded) |
| `af refute <id>` | Mark a node as disproven |

### Query & Reference

| Command | Purpose |
|---------|---------|
| `af externals` | List all registered external references |
| `af external "<name>"` | Show one external reference |
| `af lemmas` | List extracted lemmas |
| `af assumptions` | List formal assumptions |
| `af challenges` | List all challenges (resolved and open) |
| `af amendments <id>` | Statement amendment history for a node |
| `af approach-list <id>` | Failed approaches for a node |
| `af critical-path` | Deepest unvalidated nodes on worst paths |

---

## Where State Lives — Filesystem Layout

```
<workspace>/              ← must be cwd when running af
├── meta.json             ← workspace version: {"version": "1.0"}
├── ledger/               ← append-only; 000001.json, 000002.json, …
│     (source of truth; human-readable JSON, one event per file)
├── nodes/                ← empty (nodes reconstructed from ledger)
├── externals/            ← <hex-id>.json per registered external ref
├── lemmas/               ← <hex-id>.json per extracted lemma
├── assumptions/          ← <hex-id>.json per formal assumption
├── defs/                 ← pending definition requests
└── locks/                ← POSIX lock files for concurrency (ephemeral)
```

**Ledger event schema (sample fields):**
```json
{"type": "proof_initialized",  "timestamp": "...", "conjecture": "..."}
{"type": "node_created",       "timestamp": "...", "node": {"id":"1.2","statement":"...",...}}
{"type": "evidence_attached",  "timestamp": "...", "node_id":"1.8","file_path":"...","content_hash":"..."}
{"type": "nodes_released",     "timestamp": "...", "node_ids":["1.2.9"]}
```

Node IDs are hierarchical dotted integers (e.g., `1.3.12`). The ledger is never edited; `af` only appends. To read the tree, use `af status` rather than grepping the ledger directly.

---

## Pitfalls and Gotchas

1. **Wrong working directory.** `af` looks for `ledger/` in `$PWD`. Running it from `cft-anyons-deprecated/` instead of `cft-anyons-deprecated/af/master/` returns `stat ledger: no such file or directory`. Always `cd` to the workspace root first.

2. **Stale claims.** Claimed nodes not released before a session ends leave stale locks. Claim expiry is time-based; after expiry the job reappears in `af jobs`. Old claims by `codex-prover` in this workspace have all expired. Use `af agents` to inspect.

3. **Parent nodes stay pending after children validate.** `af progress` shows 88% but the root and all WP parents are still `pending`. Parent acceptance is a manual step: run `af accept <parent-id> --agent <verifier>` once all children are validated.

4. **Taint propagation is lazy.** All non-root nodes show `taint_state: unresolved` until a taint-scan is run. This is normal and does not indicate a problem; `admitted` nodes propagate taint to dependents.

5. **No outline = no coverage.** `af coverage` and `af outline` require a prior `af outline set` call. This workspace never set an outline, so coverage metrics are unavailable.

6. **`af export` requires complete validation.** Exporting to LaTeX will include all nodes regardless of state, but pending/admitted nodes will be flagged. WP7 (the pdflatex document) must be manually authored or generated after the tree is complete.

7. **Role isolation.** The prover and verifier for the same node must have different `--owner` values. Using the same agent for both roles is not technically blocked but violates the adversarial invariant. WP6 in this workspace exists precisely to enforce this discipline.

---

## How to Read and Write the Ledger Sensibly

**Reading:** Always prefer `af status`, `af progress`, `af health`, and `af handoff` over reading ledger JSON files directly. For a specific node's history, use `af amendments <id>`, `af challenges`, and `af approach-list <id>`.

To sample raw ledger events:
```bash
# First event (initialization):
cat af/master/ledger/000001.json | python3 -m json.tool

# Latest event:
ls af/master/ledger/ | sort | tail -1 | xargs -I{} cat af/master/ledger/{}
```

**Writing:** Never edit ledger files. All writes go through `af` subcommands, which append atomically. To add computational evidence: `af attach <node-id> --file scripts/julia/check.jl --type test --description "..."`. To register an external reference: `af pending-ref "<name>" --source "<path>:<line>"`.

**Recovering from a crashed session:** Run `af health` first. If stale claims are blocking jobs, wait for expiry or use `af release <id> --owner <stuck-agent>` (requires knowing the agent name from `af agents`).
