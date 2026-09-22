# Independent referee: WT-1, WT-2, WT-3

Reviewed `cft_machine/research/wilson_triangle.md` on 2026-09-22.
This review concerns the parent's proof, not the reviewer's fermion benchmark.

**Verdict: WT-1, WT-2 and WT-3 accepted as conditional mathematical statements
after the WT-2 effective-input clarification below. No CFT-realization theorem
follows from these alone.**

1. WT-1's row telescoping is correct in the specified dual norm. Completeness,
   positivity/unitality under norm limits, compatibility under pullback, and
   the dense-union extension are all used with the right hypotheses. GNS
   null-space descent and cyclic-vector preservation use multiplicativity
   and unitality explicitly. I found no illicit corner-map substitution.
2. The uniqueness claim is correctly restricted to the prescribed row
   limits, not uniqueness among all states or microscopic ground states.
3. WT-3's quadratic-form argument correctly gives the stated operator-norm
   Gram bound. Its warning about changing kernels is essential and correct.
4. WT-2 uses `||a||` to choose the stopping index. Computable expectations
   and refinement maps alone do not explicitly provide a computable norm.
   Add as input a computable finite upper bound `B>=||a||`, and stop using
   `t_k(n) B < eta/2`; exact norm computability is unnecessary. This makes
   the advertised algorithm literal without strengthening the analysis.
5. The benchmark must distinguish an actual row of microscopic states
   `omega_Q o alpha_Q^M` from an exactly compatible limiting sea chosen at
   each M. Only the former instantiates the nontrivial horizontal part of
   WT-1. The parent's requested finite Dirac-covariance extension is the
   appropriate repair; a covariance estimate by itself should not be called
   the dual-state-norm drift bound without an explicit conversion argument.
6. The final scope boundary is correct: dynamics, locality, positive energy,
   projective-unitary integration and modular fidelity require additional
   results. No strengthening of WT-1 should remove that boundary.

Follow-up: the parent added the explicit computable upper bound B>=||a||
to WT-2 at line 113 and uses it in the stopping condition. Item 4 is resolved.
The actual Dirac-state extension is outside the scope of this independent
review because it is authored by this reviewer; it requires another referee.
