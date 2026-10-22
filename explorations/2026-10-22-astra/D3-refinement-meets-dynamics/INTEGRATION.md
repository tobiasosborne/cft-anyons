# D3 refinement meets dynamics: integration package for CA-75

Source: `NOTE.md` (sections cited as §n), audited in `REVIEW.md`. Statuses below
are the reconciled grades of REVIEW.md §4.

## (a) Replacement for the CA-75 "D3 refinement meets dynamics" placeholder

```latex
\item[D3 refinement meets dynamics.] \textbf{Reconciled} (\path{explorations/2026-10-22-astra/D3-refinement-meets-dynamics/NOTE.md}; audit \path{REVIEW.md}).
For any unitary fusion \(\Cc\), pointed \(O=\one\oplus X\) and isometric dressing \(W_n=U_nV_n\) with \(P_n=W_nW_n^\dagger\), \(p_n=\omega_{n+1}(P_n)\), \(q_n=1-p_n=\delta_n^2-\delta_n^4/4\)
(\(\delta_n^2\) the Theorem~72.3 defect): the corner pullback obeys \(\|\omega_{n+1}\theta_n-\rho\|\le p_nr_n+q_n\), the CP completion and any intertwining unital lift \(\le p_nr_n+2q_n\),
\(r_n\) the normalized-pullback mismatch; this answers Link~(b2), and no bound by \(q_n\) alone exists.  Scalar augmentation \(\Alg_n\oplus\mathbb C\) (generalising CA-84) is a strict
unital injective tower with adjacent drift in \([2q_n,\,p_n\|\tau_n-\rho_n\|+2q_n]\), answering Link~(b1) globally, not locally (D3-1, \S2; derived).
Dynamics: if the fine vacuum is unique in the declared sector with gap \(\Delta_{n+1}\) and \(\|(K_{n+1}W_n-W_n\lambda_nK_n)\Omega_n\|\le\epsilon_n\), then \(d_{k,n}\le2\epsilon_n/\Delta_{n+1}\)
and \(q_n\le(\epsilon_n/\Delta_{n+1})^2\) on every row, and summability excludes scalar collapse (D3-4, \S4; conditional, proof checked).  A local-witness variant needs energy,
full-ball compression and localisation certificates and a local unital lift (D3-3, \S3; conditional).  With \(\Delta_n\gtrsim a_n^z\), summability requires local density mismatch
\(o(a_n^{1+z})\) (\S5; arithmetic).  Canonical dressing: \(W(t)=e^{-tH}V(V^\dagger e^{-2tH}V)^{-1/2}\) is isometric, has the exactly local tangent \(\sum_Z[P_Z,h_Z]V\) and a
negative-semidefinite first-order energy change (D3-5, \S6; derived); uniform all-order locality is Conjecture~D3-C (Headline).
Negative (\S7; derived): polar filtering is trivial on a carrier commuting with \(H\); fixed-time heat strips cannot repair a closing gap; a fixed UV shell gap
does not select the IR vacuum.  The CA-72/73 qualifications (global corner pins, corner unit \(P\), operator-norm versus GNS-seminorm softness, \S1) concur with D1.
\textbf{Question:} both the \(q_n\) and \(\epsilon_n/\Delta_{n+1}\) routes are global-fidelity hypotheses, expected to fail for dressings of fixed local accuracy;
the local route waits on a local unital lift.  Link~(b3) therefore remains open (\path{REVIEW.md} \S2.4).
```

The block is 14 (long) lines of LaTeX. It uses only macros already in scope in CA-75
(`\Cc`, `\one`, `\Alg`, `\path`) and names no model.

**Companion edits for CA-75 (suggestions only; CA-75 has not been edited).**
- Link (b), CA-75:146–147: the phrase "the modulus of softness of the unital completion (Corollary 72.8)" should become "its GNS-seminorm defect; the operator-norm defect is |cov_χ| (D1, D3 §1)". This is identical to D1's suggestion.
- Row (3), "Missing", CA-75:79: append "global fidelity q_n→0 summably, or a local unital lift (D3 §2.4)".
- Item 4 of the acceptance contract, CA-75:179–181: the "declared soft fallback" may be the strict scalar augmentation, provided its non-locality is stated.

## (b) Promote to shard

**`CA-9x-REFINEMENT-DRIFT-BRIDGE`.** Use the next free ID; D1, D4 and D5 all propose CA-88 and CA-89.
Title: *Refinement Meets Dynamics: Corner Defect, Vacuum Residual and Polar Dressing*.
Outline (~200 lines, general C, examples table at the end only):
1. Sources and dependencies: CA-68, CA-71, CA-72, CA-73, CA-84, CA-81; `wilson_triangle.md` WT-1; `2306.16063.md:570–583`; `latticefermions.tex:487–491`; the D3 and D6 notes.
2. Setup: (1.1), the trial state `σ_n`, and why `α_n(a)W_n=W_na` is the interface. Qualifications to CA-72 Cor. 72.8 and CA-73 Lemma 73.1, with D1 concurrence.
3. Proposition (D3-1, which is also D6 P2): corner and CP bounds, `q=δ²−δ⁴/4`.
4. Proposition: strict scalar augmentation, its composition, the exact adjacent drift (2.3) and the scalar-collapse diagnostic.
5. Lemma (D3-2) and Theorem (D3-4): vacuum residual plus gap gives WT-1 A3, together with the reviewer's non-collapse corollary and the (4.3) circuit-conjugacy sufficient condition, including the volume and energy-origin costs.
6. Remark: the dyadic rate ledger (5.1), the requirement u > 1+z, and why dyadic spacing does not sum O(1) or 1/n errors.
7. Proposition (D3-5): the polar heat refinement, its local first tangent, the local tangent-extension lemma (6.3), and the frame-rotation identity (6.2). Conjecture D3-C stated, with its status.
8. Negative results: the commuting-corner identity, (7.1), and the D3-6 shell-gap counterexample.
9. Question: the global-fidelity versus local-lift dichotomy (REVIEW §2.4) as the precise form of Link (b3).
10. Checks: port `checks/check_drift.py` and `review_check_pointed.py` to `scripts/python/` with a run bundle, then the examples table, then the boundary section.

D3-3 and (3.3) can enter as a remark in item 9 rather than as theorems. They are conditional, and their hypotheses are not yet attainable. No separate shard for D3-C.

## (c) Links

- **D1 (carrier theory): concurs, and is fed by D3.**
  - D1-T5, D1-T5b (D1 NOTE.md:317–399) and D3 §1 (N:135–153) independently find the same three corner qualifications.
  - D3-4 implies D1-T5b's telescoping condition `Σ√(1−p_n)<∞` (D1 NOTE.md:381–384), via `q_n≤(ε_n/Δ)²` and the reviewer corollary.
  - D1-T5 `<1>3` gives the cellwise `W=UV` extension. D3's local tangent-extension lemma (6.3) is the first-order local version of the global statement.
  - Neither note constructs a local unital lift. This is D3 open problem 1 and D1 NOTE.md:639.
- **D2 (selection principle): D3 depends on it, and D2 consumes D3.**
  - D3 takes the couplings h_n as input (open problem 3, N:720–723). D2-C is the proposed selector.
  - D2-L8 (D2 NOTE.md:521–547) consumes D3-type drift bounds. D2's C5 (unital maps) is exactly D3's open problem 1.
  - D3-C's strip `e^{-tH}V` uses the exact gates of D2 eq. (2).
- **D4 (KS beyond free fields): D3 feeds it.**
  - (4.4) and its Duhamel corollary bound `(e^{-itK_f}W−We^{-itK_c})P_E` on energy windows. (8.2) and the centering identity are the transport identities that VR-1 A3 and D4's refinement defect need.
  - D4 also found the corner-unit qualification (per D1 REVIEW.md:130).
  - Interface caution: D3 uses open chains, while LC-4's KS tier is periodic (`04_cutoff_oar.md:22–24`).
- **D5 (fidelity): D5 depends on D3.**
  - D5's integration (D5 INTEGRATION.md:92–96) asks whether D3's polar maps commute with defect operators.
  - Reviewer answer, derived here: suppose `D_{n+1}` commutes with `H_{n+1}` and both `D_{n+1}V=VD_n` and `D_{n+1}^†V=VD_n^†` hold. Then `D_nG=GD_n`, hence `D_{n+1}W(t)=W(t)D_n` exactly, by functional calculus.
  - Whether categorical defect operators intertwine vacuum insertion this way is not checked and remains a Question for D5.
- **D6 (functor and obstructions): duplicate and feed.**
  - D6 P2 (D6 NOTE.md:287–303) is D3-1's second bound, found concurrently.
  - D3 supplies D6's K4 certificate conditionally (D6 NOTE.md:148), and the non-collapse corollary feeds K5.
  - D6's P1 multiplicity obstruction, "unitary dressing cannot remove it" (D6 NOTE.md:280–285), is consistent with D3's view that dressing alone does not create a unital lift.
- **Contradictions:** none with D1–D6. There is a contradiction with CA-72 Cor. 72.8 and its echo at CA-75:146–147; D3 is correct.

## (d) Headline verdict

**Needs reformulation.**
- D3-C is well posed, unrefuted and plausibly true. A first-order proof exists (D3-5), and the attack at small t is via short-imaginary-time analyticity or cluster expansion plus (6.3).
- It is a UV locality lemma. By the note's own §7 and D3-6, a near-identity dressing at fixed t cannot drive `q_n` or `ε_n/Δ_{n+1}` to zero summably for a critical vacuum.
- So it does not address the problem in the brief: synthesising WT-1 drift from dynamics.
- The real research target is the infrared statement. One option is a dressing family whose density mismatch is `o(a_n^{1+z})` uniformly, i.e. (4.3) with u > 1+z. The other is a local unital lift that makes the global-fidelity-free route D3-3 available.

**First attackable lemma.** The second-order step of D3-C. Show that the `t²` coefficient of `W(t)` admits an anti-Hermitian generator `Σ_I a_I` whose interval norms are summable with exponential weight. Do this by replacing the global `P_t` with products of quasi-local vacancy projectors, and reuse (6.3) and the connected-pair locality of N:470–474. If this works with constants uniform in L, the cluster-expansion induction is the route to D3-C item 1.

**Most uncertainty-reducing action.** Acquire, under `references/`, a source on quasi-locality of high-temperature (short imaginary time) effective Hamiltonians or Gibbs compressions, and a 1D imaginary-time Heisenberg-analyticity source. Either would likely turn D3-C into a corollary or expose an obstruction. No such source is local, and citations from memory are not admissible.

A secondary computation within the laptop budget: for a pointed carrier with fine N ≤ 10 (block dimension below 1000), compute the minimal-norm local extension of the polar generator at several t. Fit the decay of its tails with distance and check that the constants are uniform in N.

## (e) Hypotheses still to be synthesised from category data

1. A local unital *-lift `α_n` with `α_n(a)W_n=W_na`, together with complement representations and support bounds on `End_C(O^{⊗N})` (open problem 1).
2. Hermitian tile couplings `h_n` from the declared data (a selection principle): their scale dependence, counterterms, energy origin `E_n`, and rescaling `λ_n`.
3. A unique selected fine vacuum in a declared charge sector, with gap `Δ_n ≥ c a_n^z` on open chains. Endpoint and boundary data must be declared.
4. Vacuum residual `ε_n=O(a_n^{z+y})`: circuit conjugacy (4.3) with per-term mismatch `o(a_n^{1+z})`, including the volume factor and the energy-origin error.
5. For the local route: witnesses `K_B`, thresholds `λ_B`, full-ball compression `ℓ_B` and localisation `τ_{k,n}`, all obeying the rate ledger (5.2).
6. Lieb–Robinson constants `(C_LR, μ, v)` for categorical interval algebras and the dressing generator.
7. The D3-C constants `(t_0, μ, C_0, D_0)`, or whichever dressing replaces the polar strip.
8. Control of the induced metric and self-energy after shell elimination (7.2)–(7.3), relative to the infrared scale.
9. Computable all-scale majorants for WT-2 tails.
10. Declared extra data: a pointed site object O ⊇ 1 with a unit inclusion, the charge sector, and the open-chain boundary convention. Reconcile the boundary convention with LC-4's periodic tier.
