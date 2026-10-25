# Astra explorations, round 3 — 2026-10-25

Six Codex explorers (gpt-6-astra, xhigh, ~70 min wall-clock budget each),
each given the ONE next target named at the end of a round-2 shard
(CA-89..CA-94) or by the north star (F6), sharpened into the most ambitious
plausibly-true statement, and asked for a rigorous Lamport-style proof (or an
explicit counterexample plus the strongest true version). Briefs in `briefs/`;
each explorer writes only its `NOTE.md` and `checks/`. Reviews in this round
are also Astra runs (`REVIEW.md`, sceptical, step by step, with their own
`checks/review_*`). Nothing here is a result until a review and the worklog
record it.

| Dir | Source target | Conjecture | Layer tags |
|---|---|---|---|
| F1-dyadic-lift-characterisation | CA-90 Target 90.T | Local dyadic unital lift exists iff [O] central in K(<O>) iff relative half-braiding; Vec_S3 decisive | any, L0, R0^u |
| F2-zero-mode-and-lattice-chirality | CA-91 next lemma | Zero-mode lemma; parity-free c_L = c_R for local periodic towers; sharpness | full, category-free, R2 [cond.] |
| F3-reflection-coherence | CA-92 / E3 INTEGRATION (e) | Canonical seam at L1; reflection-coherence lemma; multi-tile spatial RP and the crossing | full (twisted ch), L1 / L0+psi, -> R3 |
| F4-ward-to-residual | CA-89 Lemma 89.L | Probe-word Ward-to-residual implies W2; converse; free-fermion test with K = 1 + E_N | full, category-free, -> R2 |
| F5-contact-trichotomy | CA-94 Target 94.16 | Robin / Dirichlet / no-limit trichotomy on P_{<=2} F; fibre structure; all N; range r | any (open), L0 + decl., R0^c + z=2 |
| F6-what-the-tower-remembers | north star, CA-80 Prop. 80.8 | R0 inductive-limit algebra is AF, classified by the fusion ring of <O> and [O]; forgets F, R; R0 row of the fidelity ladder | any, L0, R0 |

Launch (from the repo root; `--approve-for-me` implies the workspace-write
sandbox and must not be combined with `-s`):

    codex exec -m gpt-6-astra -c model_reasoning_effort=xhigh --approve-for-me \
      --skip-git-repo-check -o explorations/2026-10-25-astra-r3/KEY/final-message.md \
      "$(cat explorations/2026-10-25-astra-r3/briefs/KEY.md)"
