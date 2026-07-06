# CA-74 numerics brief — identify the Jones-Wenzl kernel of rho_4 (Fibonacci, L=4)

You are the numerics implementer for shard CA-74-JW-KERNEL-DECISION in the
repo at the current directory. You work under this repo's AGENTS.md — READ IT
FIRST, top to bottom. The Three Laws and numbered Rules bind you (fail fast;
no claim without a local citation or a checked invariant; every test asserts a
known value or invariant, never "didn't throw"). Platform note in AGENTS.md
applies: laptop, NO full Pkg.test() runs, L=4 is the hard ceiling for matrix
computations. Combinatorial path counting at L=5 is allowed (no big matrices).

## Read before coding

- AGENTS.md (all of it)
- CONVENTIONS.md entries (b), (r), (s)
- report/sections/69_dilute_tl_word_algebra.tex  (evaluation map rho_L, parity,
  Motzkin dimensions, the CA-69 conjecture, corner iso pi_A dTL_n pi_A = TL_|A|)
- report/sections/73_categorical_residual_set.tex (Julia Invariants section)
- src/FibonacciLocalOperators.jl  (Tier-1 generator matrices on the CA-66 path
  basis: occupancies, hop, raw-cup pair with u^2 = phi u, dense e_j)
- src/CategoricalResiduals.jl     (dilute_image_dimension, parity_even_dimension)
- test/runtests.jl testset "categorical residual set (CA-73)" (from ~line 1636)
  — follow its structure and mutation-note comment conventions.

## Established data (CA-73, independently re-run; do not re-derive, do cross-check)

- dim dTL_L(phi) = M_{2L} = 9, 51, 323 for L = 2, 3, 4 (sourced in CA-69).
- dim End(O^tensor L) = F_{4L-1} = 13, 89, 610.
- Dilute Tier-1 image dimension inside A_L: 9, 51, 322 (L = 2, 3, 4).
- Parity-even subalgebra dimension: 9, 51, 322 — at L=4 image = parity-even
  subalgebra exactly, and 322 = 323 - 1: the kernel of rho_4 is exactly
  one-dimensional. CA-74 must IDENTIFY it.
- Hypothesis (CA-69): the kernel is the corner embedding iota(p_4) of the first
  negligible Jones-Wenzl projector of TL_4 at beta = phi = 2cos(pi/5).
- Warning (CA-73 friction): the dense braid relation e_j e_{j±1} e_j = e_j
  holds ONLY on the dense corner; on the full dilute space e_1 e_2 e_1 = 0.
  The Wenzl recursion below lives entirely inside the fully-occupied corner
  (unit = Pi_A), where this is not an obstruction — but be careful which unit
  you use.

## Task

Create NEW file `src/JonesWenzlKernel.jl` (target ~200 lines, hard cap 280),
add its include to `src/CftAnyons.jl`, and append a standalone testset
`"jones-wenzl kernel decision (CA-74)"` to `test/runtests.jl`. Implement:

1. **Corner unit** Pi_A at L = 4: the product of occupancy projectors
   selecting the fully-occupied subspace, built from FibonacciLocalOperators.
2. **Dense corner TL generators** E_j (j = 1..3): the dense e_j images already
   implemented for CA-73 (u_j = b_j^t b_j), restricted/consistent with Pi_A.
3. **Wenzl recursion at beta = phi**: quantum integers [1] = 1, [2] = phi,
   [n+1] = phi[n] - [n-1] (so [3] = phi^2 - 1, [4] = phi^3 - 2 phi, [5] = 0);
   p_1 = Pi_A;  p_{k+1} = p_k - ([k]/[k+1]) p_k E_k p_k.
   Law 1 discipline: do NOT rely on the remembered formula alone — the testset
   must verify the DEFINING JW properties so the object is characterized by
   checked invariants: p_k^2 = p_k (1e-12), E_j p_k = p_k E_j = 0 for all
   j < k, and p_k has coefficient 1 on the corner unit (p_k - Pi_A lies in the
   span of words containing at least one E_j; check numerically e.g. via
   trace pairing or by construction). Grep references/ and literature/md/ for
   'Wenzl' / 'Jones-Wenzl' and cite any local anchor you find in the repo's
   `% Source:`-style code comments; if none found, record that gap explicitly
   in your report and lean on the checked defining properties.
4. **Decision computations** (all at L <= 4):
   a. norm(rho(iota(p_2))) and norm(rho(iota(p_3))) are NONZERO (> 0.1) —
      consistency with injectivity at L <= 3.
   b. **THE DECISION**: opnorm(rho(iota(p_4))) <= 1e-12 (the Wenzl polynomial
      evaluated on the generator IMAGES — by the homomorphism property this IS
      rho_4 of the corner JW element).
   c. Cross-check: dilute_image_dimension at L = 4 returns 322 and
      parity_even_dimension returns 322 (reuse CA-73 functions; do not fork).
   d. [5] = phi*[4] - [3] == 0 exactly (up to 1e-14) — the negligibility scalar.
   e. **Parity-refined multiplicities by pure path counting** (cheap, L = 2..5):
      for each total charge c in {1, tau} count CA-66 basis paths of O^tensor L
      with even/odd occupied number N. Verify the L = 4 split 13 = 9 + 4 and
      21 = 9 + 12, and determine PRECISELY which parity class carries which
      count (state it — the derivation shard needs the correct assignment).
      Report the L = 5 split as new data. Verify
      sum_c (m_c^even^2 + m_c^odd^2) = 9, 51, 322 at L = 2, 3, 4.
   f. Rank-nullity conclusion as a code comment + report statement: rank 322 +
      dim dTL_4 = 323 (sourced) + rho(iota(p_4)) = 0 + iota(p_4) != 0 in dTL_4
      (coefficient 1 on the corner-unit diagram; diagram basis is linearly
      independent) => ker rho_4 = span{iota(p_4)}.
5. **Mutation-prove the testset** (Rule 6): apply each mutation to
   src/JonesWenzlKernel.jl ALONE, re-run the testset STANDALONE, confirm RED,
   record pass/fail counts, REVERT:
   (i) Wenzl coefficient [3] -> [3] + 0.01;
   (ii) beta = phi -> phi + 1e-3 inside the recursion's quantum integers only;
   (iii) corner unit: drop one occupancy factor from Pi_A.
   Leave the tree green and unmutated at the end (verify with git diff).
6. **Run gates**: the new testset standalone (write a scratch runner under
   /tmp that does `using Test, CftAnyons, LinearAlgebra` + include of only your
   testset block, or an equivalent extraction) + `julia --project=. -e 'using
   CftAnyons'` load check. Do NOT run the full suite.
7. **Report**: write reviews/2026-07-06_ca74_jw_kernel_decision/numerics_codex.md
   with: the headline decision sentence; all computed numbers ((a)-(f)); the
   parity-refined multiplicity table L = 2..5 with the parity assignment made
   explicit; the mutation table; source anchors used; any gaps or surprises.
   If ANY check contradicts the hypothesis, say so loudly and stop — do not
   paper over it (Rule 1/2).

## Hard constraints

- Do NOT edit report/, worklog/, CONVENTIONS.md, Makefile, or any existing src
  file except the one-line include in src/CftAnyons.jl.
- Do NOT git commit, stage, or push. The orchestrator handles git.
- No matrix computation beyond L = 4; L = 5 is path counting only.
- Total runtime target: a few minutes. If something is unexpectedly expensive,
  stop and record why rather than burning the laptop.
