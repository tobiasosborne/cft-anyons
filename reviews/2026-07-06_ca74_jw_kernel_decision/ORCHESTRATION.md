# Orchestration record — CA-74 JW-KERNEL-DECISION (2026-07-06)

Orchestrator: Claude (Fable 5) main session.  Commission (Tobias): execute
W1.4 of reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md, delegating
liberally to Opus and codex.  Input data: the CA-73 L=4 kernel datum
(dilute image 322 = parity-even dim 322 = M_8 - 1; kernel exactly
one-dimensional; splits 13 = 9 + 4, 21 = 9 + 12), independently re-run last
session.  Target: interpret the datum — parity-refined combinatorics, the
explicit kernel element (hypothesis: corner embedding of the TL_4
Jones-Wenzl projector at beta = phi), the upgraded CA-69 conjecture — and
write shard CA-74.

## Fan-out (3 parallel workers, then hostile verification)

1. **Derivation (Opus).**  Parity-refined charge-block multiplicities
   m_c^{even/odd}(L): recursion, closed forms, table L=1..6; parity-even
   subalgebra dimension formula (verify 9, 51, 322; predict L=5,6); the
   kernel identification theorem ker rho_4 = span{iota(p_4)} with every step
   labeled sourced/derived/needs-numerics; upgraded general-L conjecture +
   predicted kernel dimensions; Gram-rank deferral note.
   Deliverable: derivation_opus.md.  Status: running.

2. **Numerics (GPT-5.5 via codex exec, xhigh).**  src/JonesWenzlKernel.jl +
   standalone testset "jones-wenzl kernel decision (CA-74)": Wenzl recursion
   in the fully-occupied corner (defining JW properties checked, not
   remembered); THE decision assertion rho(iota(p_4)) = 0; nonvanishing of
   rho(iota(p_2)), rho(iota(p_3)); 322/322 cross-check vs CA-73 functions;
   [5]_phi = 0; parity-refined multiplicity table L=2..5 by pure path
   counting (L=5 combinatorial only — matrix work capped at L=4 per the
   AGENTS.md platform note); mutation-proving (3 mutations, RED, revert).
   Deliverable: numerics_codex.md + code.  Status: running
   (log: codex_exec.log; prompt: codex_prompt.md).

3. **Source anchors (Opus, read-only).**  Local anchors for: JW/Wenzl
   recursion; [5]_q = 0 at beta = 2cos(pi/5) / negligibility; kernel of
   dense TL_n(phi) -> End(tau^tensor n); dilute TL at roots of unity
   (ideals/cellular structure); dimension ledgers.  Absent anchors reported
   honestly as acquisition items (Law 1).
   Deliverable: sources_anchors.md.  Status: running.

Then: orchestrator cross-verification (derivation vs numerics vs anchors;
independent re-run of the decision assertion), one hostile review pass if
the pieces disagree anywhere (Rule 12 Core tier), shard CA-74 + catalog/
README/report.tex + guard + latexmk + worklog by the orchestrator.

## Outcome

All three workers converged with zero disagreements; no hostile-review pass
was needed (Rule 12: outputs agreed everywhere, orchestrator verified
independently).

- **Decision:** opnorm(rho(iota(p_4))) = 2.3e-15; p_2, p_3 survive (norm 1);
  rank rho_4 = 322 = P(4); ker rho_4 = span{iota(p_4)}.  CA-69 conjecture
  SETTLED at L=4.
- **Upgrade (derivation worker):** SRC-TL-JONES gives
  ker(TL_4(phi) -> End(tau^x4)) = span{E_4} analytically (radical dim 1 at
  n = l-1 = 4, tr = 0, unit coefficient 1), plus an independent
  positivity/quantum-trace argument — the kernel identity needs NO
  numerics; surjectivity (rank 322) is the single numerical input.
- **Combinatorics:** closed forms m_1^± = (F_{2L-1} ± F_{L+1})/2,
  m_tau^± = (F_{2L} ∓ F_L)/2; P(L) = 9, 51, 322, 2135, 14445; predicted
  kernel dims 1, 53, 1066 at L = 4, 5, 6 (rigorous lower bounds; equalities
  under the surjectivity conjecture).  Codex path counts (independent
  method) match opus closed forms through L = 5.
- **Cross-verification (orchestrator):** standalone testset re-run 113/113;
  every load-bearing ILZ anchor re-read against the raw file; closed forms
  re-checked by hand at L = 2, 4, 5.
- **Anchors:** strong verbatim anchors for the radical/JW/Jones-quotient
  claims (ILZ) and the dilute corner/radical structure (DiluteTL2014); two
  acquisition gaps recorded (explicit algebraic Wenzl recursion; categorical
  negligible formalism); ILZ extraction line :666 flagged as artifact.

Shipped: shard CA-74 (75 shards, 173 pp, guard + latexmk green),
CONVENTIONS (r) import caveat, src/JonesWenzlKernel.jl + CA-74 testset
(mutation-proved), worklog W1.4 entry.
