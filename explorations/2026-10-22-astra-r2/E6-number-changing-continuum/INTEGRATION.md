# E6 — Integration package

Basis: `NOTE.md` as reviewed in `REVIEW.md`. Grade: **COUNTEREXAMPLE (verified)**
to the brief's E6, with a **proof-complete replacement** (T1, T2, L1-L3, N2, P3).
Everything below is stated for a general unitary fusion category C.

## (a) The theorem as established (LaTeX-ready)

```latex
\textbf{Theorem (E6-T1, T2) [derived; setting any (open interval), data L0 + declared
reaction/contact data, rung $\mathsf R0^c$ + off-ladder $z{=}2$ resolvent limit].}
Let $\Cc$ be unitary fusion, $(O,\eta)$ pointed with $O\cong\one\oplus X$ (CONVENTIONS (am)),
and $\mathcal F=\hoplus_{c,n}L^2(\Delta_n;\Hom(c,X^{\otimes n}))$ with the box isometries
$K_\varepsilon$ of Theorem 77.8, $\varepsilon=1/L$.  Fix finitely many $b_\alpha\in\Hom(X,X^{\otimes2})$,
$v_\beta\in\Hom(\one,X^{\otimes2})$, weights $\lambda_\alpha,\kappa_\beta\ge0$ and $\mu>0$, and let
$H_\varepsilon=\sum_j[\varepsilon^{-2}D_h^\dagger D_h+\sum_\alpha\lambda_\alpha\varepsilon^{-1}D_{b_\alpha}^\dagger D_{b_\alpha}
+\sum_\beta\kappa_\beta\varepsilon^{-1}D_{v_\beta}^\dagger D_{v_\beta}]_j+\mu\hat N$ with $D_h=\pi_{X0}-\pi_{0X}$,
$D_b=\pi_{XX}-\sqrt\varepsilon\,b\,\pi_{X0}$, $D_v=\pi_{XX}-\varepsilon\,v\,\pi_{00}$ (D1-C).  Then the collision form
$q=\sum\|\nabla\psi\|^2+\mu\langle\psi,\hat N\psi\rangle+\sum\lambda_\alpha\|T\psi_{n+1}-B_{b_\alpha}\psi_n\|^2+\sum\kappa_\beta\|T\psi_{n+2}-V_{v_\beta}\psi_n\|^2$
on its maximal domain is closed, has a finite-particle smooth core, and defines $H\ge0$; and
$K_\varepsilon(H_\varepsilon+z)^{-1}K_\varepsilon^{*}\to(H+z)^{-1}$ strongly for every $z>0$, with no subsequence,
scalar subtraction, or $N$-uniform estimate.  $H$ changes $\hat N$ iff $\beta=\sum\lambda_\alpha b_\alpha\neq0$ or
$\nu=\sum\kappa_\beta v_\beta\ne0$.  $q$ depends only on $(a,\beta,\nu,Q_b,\gamma)$, whose attainable set is the finite
moment cone $Q_b-\beta^*\beta/a_b\in\{\sum d^*d: d\in\Hom(X,X^{\otimes2})\}$, $\gamma-\nu^*\nu/a_v\ge0$ (zero if
$\Hom(\one,X^{\otimes2})=0$).  The construction is natural under unitary tensor equivalences.
\textbf{Negative [derived]:} (i) for every $X\neq0$ the fixed pure-hop density has no full-Fock
projected-resolvent limit after any scalar subtraction (N1); (ii) $H$ is not an extension of the minimal
chamber Laplacian when any reaction is active (N2); (iii) if $\Hom(X^{\otimes p},X^{\otimes q})=0$ for
$0\le p\ne q\le r$, every range-$r$ density conserves $\hat N$ in the limit, so charge-preserving
number-changing collision extensions are unattainable (N3; instance $\mathrm{Hilb}(\mathbb Z_3)$, $r=2$).
The category enters through the fibres, the admissible Hom spaces, the moment cones and the grading obstruction.
Every analytic estimate is category-inert.
```

## (b) Destination

The ID is the next free one. E4 and E5 both propose CA-89, so in E-order this would be
CA-94; the integrator assigns.

**New shard: `CA-9x-NUMBER-CHANGING-COLLISION-DYNAMICS`**, titled *Number-Changing
Collision Dynamics on the Pointed Carrier: a Tuned Continuum Theorem and Three
Obstructions*. Outline, about 200 lines:
1. Status, sources and dependencies: CA-77 (77.4, 77.8, caveat), D1 NOTE:35-41,
   :483-543, D1 REVIEW:78-98, CA-88 D1-C entry. Record the analytic source gap
   (no Mosco or interior-boundary source is local).
2. Scaling dictionary (P1). Hop ε^-2, contact ε^-1, fusion cross ε^-1/2, pair cross
   ε^0. The brief's uniform buckets are inconsistent.
3. Negative 1 (N1). Fixed densities need a number-proportional counterterm, not a scalar.
4. Lemma (L1+L2). The maximal collision form is closed, has a core, and defines H.
5. Lemma (L3). Collision-trace liminf by normal collars, with no N-uniform constant.
6. Theorem (T1). Projected-resolvent convergence, plus the number-change criterion.
7. Proposition (P2, N2). Weak domain and interior-boundary equations; not a
   chamber-Laplacian extension.
8. Theorem (T2). Finite moment-cone coefficient image, plus a categorical block test.
9. Negative 3 (N3). Grading obstruction G_r; the countertarget is nonlocal and that
   limitation is said explicitly. Naturality (P3); range-r conditional (P4); the
   codimension-2 trace obstruction.
10. Layer tags, examples table (Vec X=1; Hilb(Z_d); W=0 case), open problems, and the
    reviewer's minor citation fixes (Penneys:321, :319).

**Amendments**
- CA-77 §"Conjecture, with Caveat" (`77_pointed_carrier_invariants.tex:233-248`). Append:
  "D1-C is proved for the tuned family, without its closedness/core hypotheses, in
  CA-9x (Theorem T1). The caveat stands: the tuning is necessary (CA-9x N1)."
- CA-77 §"What This Does Not Claim" (:255-261). Replace "D1-T7 ... and the D1-C
  analytic gap are left to a later shard" with a pointer to CA-9x.
- CA-88 D1-C entry (`88_layered_targets.tex:145-153`). The collision-sewing version is
  now [derived], and its first lemma (N ∈ {0,1,2}) is superseded by L3 for all N. The
  restated R0^u+R1 target is unchanged and still open.

## (c) CA-88 grid cells

- **New row:** `CA-9x | any (open interval) | L0 + declared b,v,λ,κ,μ, contact tuning |
  R0^c + off-ladder z=2 limit [derived]; N1-N3 [negative] | D1-C proved for the tuned
  family; fixed-h E6 false`.
- **Moved:** the D1-C "collision-sewing" status moves from conjecture to derived.
  Rungs R1-R5 are untouched: no Wilson state, modes, conformality or fidelity.
- **Sharpened:** CA-88's L0 cell for D1. The category is not wholly inert. Fusion
  rules (G_r) bound which number-changing continuum dynamics are attainable at range r.

## (d) Links and conflicts

- **E1 (local unital lift).** E1 proves a braided local unital lift of *bare*
  interleaved vacuum insertion, with occupation-degree covariance. That is the
  refinement whose continuum is atomic (Prop. 77.9 / D1-N4). E6 lives on the
  length-weighted carrier 77.8.
  - Join (Open problem 5 = CA-88's restated D1-C): a unital local lift of the dressed
    refinement R = U(id⊗η) of CA-77:212. U commutes with N̂, which E1 notes is
    needed to keep degree.
  - This is a tension to resolve, not a contradiction.
- **E2 (parity).** N3's G_r is the Z-graded analogue of CA-77 Prop. 77.4(3) parity
  preservation. Parity-type gradings of the fusion ring constrain attainable dynamics
  in both.
- **E3, E4, E5.** No direct link. E6 is z=2 and nonrelativistic, so it supplies no
  reflection-positive history sum, no Ward/KS data, and no fidelity input. No conflict.
- **Round 1.**
  - Closes D1 INTEGRATION (e)2-3: the closedness/core hypotheses and the liminf gap.
  - Confirms D1 REVIEW R1: tuning is necessary, and N1 shows untuned fixed densities
    fail even before collisions matter.
  - Item (e)4 (contact discretisation is a declared choice) stands.
  - Qualifies D1 REVIEW R2 ("category does nothing") through N3 and T2's support cones.
  - No conflict with CA-76, CA-78-CA-80.

## (e) Single next lemma

**Contact trichotomy lemma (fixed densities, sectors N ≤ 2, general C).**
- Setup: a fixed self-adjoint h ∈ End_C(O⊗O) with number-conserving block t·hop + diagonal,
  scaled by ε^-2, plus the counterterm ε^-2 e_1 N̂, where e_1 is the one-particle band
  bottom. Fix the outer-endpoint terms as in D1's positive square. Write the
  two-particle contact coefficient as c_ε ε^-2 n_j n_{j+1}.
- Claim: the projected resolvents on P_{≤2}F converge iff c_ε = −2t + κε + o(ε),
  giving Robin collisions with κ, plus D1-type reaction coupling.
- Otherwise there are two failure modes. If c_ε > −2t eventually, collisions are
  Dirichlet and the sectors decouple. If c_ε < −2t eventually, a bound pair dives to −∞
  and there is no limit.
- This turns N1 and Open problem 1 into the classification the D1 reviewer asked for.
  It is testable at laptop scale with `checks/review_tuned_convergence.py` modified.
