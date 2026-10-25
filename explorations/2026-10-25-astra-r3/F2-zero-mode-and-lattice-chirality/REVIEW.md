GRADE: WEAKER-RESULT-PROVED

# F2 round-3 skeptical review — 2026-10-25

Provisional review skeleton, written at the start of the review and to be
refined after the remaining source and independent-check audit.

The main requested zero-mode lemma F2(a) is not proved or refuted. The note
says this explicitly. Its parity-free conditional balance theorem and cubic
balance theorem appear valid on the stated common invariant domain; they
are weaker results than the full brief. Neither a general microscopic
chirality no-go nor the sharpness claim F2(c) follows.

## Findings to resolve

- Audit every Lamport step, especially the finite/core norm equivalence,
  the double-Jacobi calculation, and the spectral-cutoff estimates.
- Require a nonzero common Hilbert space wherever a scalar multiple of the
  identity is used to identify ledger coefficients.
- Distinguish finite commutation range in F2-R from bounded spatial support
  of the densities. The former alone does not prove local support of Jcut.
- Keep the declared-target spectral cutoff outside the standard-KS class;
  it changes more than just the range hypothesis.

## Per-step verdicts

Pending completion: F2-G (3 steps); F2-N (3); F2-B (5 top-level steps,
including its nested steps); F2-Cubic (5); F2-Aalg (5); F2-R (4);
F2-Spec (5); F2-Kernel (2); the unnumbered corollaries and example.

## Corrected statement and layer tags

Subject to the completed audit: on a nonzero common standard
nearest-neighbour KS/VR-1 system, cubic anomaly balance holds without
parity; zero-mode commutation additionally gives both-ledger balance and
all mixed commutators zero. Tags: (full/periodic; category-free plus the
declared analytic certificates; conditional R2). No R3/R4/R5 follows.

## What the brief got wrong

The reference to CONVENTIONS (as) should be (at). Its claimed equivalence
between a theorem about certified KS modes and a no-go for all physical
lattice continuum limits requires extra hypotheses. A spectral logarithm
of translation need not approximate the energy-current zero mode.

## Independent verification

The two original scripts are being rerun with output saved as
`checks/review_rerun_f2.txt` and `checks/review_rerun_range_kernel.txt`.
An independent load-bearing check and mutation control will follow.

## Single sharpest next lemma

Prove or refute automatic zero-mode commutation on the common positive
Hilbert-space core of an actual nearest-neighbour standard-KS tower under
the original F2(a) hypotheses. Formal Jacobi identities alone are
insufficient; a logarithm-branch choice alone is insufficient.

## Sources checked

The completed review will list all checked source paths and anchors,
including limitations rather than treating citations as proof by authority.
