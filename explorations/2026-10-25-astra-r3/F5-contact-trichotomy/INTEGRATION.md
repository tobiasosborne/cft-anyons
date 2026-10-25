# F5 contact classification — integration package, 2026-10-25

Basis: the working-tree NOTE reviewed in `REVIEW.md`, SHA256
`c1f6537614c6345743bf12443d5851e0f580752f12cd15ff8a9ee786db766aa7`.
Review grade: **COUNTEREXAMPLE to F5 as posed**, with a **PROOF-COMPLETE
exact-family N<=2 replacement**. This package recommends later report edits;
it performs none. A future shard ID must be allocated by the integrator.

## (a) Statements safe to lift, with grades

All categorical statements are for general unitary fusion C and pointed
O=1+X. Unless stated otherwise, tags are **S=any (open interval); L=L0 plus
declared microscopic data; R=inherited R0^c plus an off-ladder z=2 result**.
They do not select a chiral or full conformal target. Analytic lemmas use only
fixed finite-dimensional fibres; category-specific rows remain calibrations.

| Statement | Grade | Exact safe content / boundary |
|---|---|---|
| Exact compressed coefficients, A1 | derived | The Galerkin compression P<=2 H_eps P<=2 retains outgoing source-square diagonals W_0,W_1,W_2. Total contact and external excess must be distinguished. |
| Global trace lemma, L1 | derived | At N=2 the exclusion-grid trace satisfies C_eps<=eta E_eps+C_0(1+eta^-1)N_eps, and bounded norm/energy sequences have strongly convergent bulk and full collision traces. Category-free, fixed finite fibre; ingredient only. |
| Finite signed-contact limit, T1 | derived | For exact (F), alpha_eps->alpha in R gives the closed semibounded form (Q) and projected nonreal strong-resolvent convergence on N<=2. |
| Weak generator and fibre structure, B1 | derived | The homogeneous trace coefficient is alpha times identity on each E_c,2; beta and nu give the categorical source maps, Q_b its coherent bulk insertions. Exact domain is variational. |
| Global H2/classical boundary equations for every domain vector | conditional | A separate regularity theorem is needed. B1 only uses classical equations for sufficiently regular vectors. |
| Either-sign divergent contact, T2/T3 | derived | For exact (F), |alpha_eps|->infinity at arbitrary rate gives Dirichlet collisions and Neumann outer walls on N<=2, retaining W_n. Sign oscillation is allowed. |
| Complete scalar-contact classification, T4 | derived | With X!=0, the preceding finite or absolute-divergent alternatives are necessary and sufficient for a self-adjoint projected-resolvent limit on the entire N<=2 carrier. |
| Original negative-divergence/no-limit branch | negative | Refuted even by fixed bounded c_eps=-6t on N<=2; spectral diving coexists with the Dirichlet limit. |
| Nonreacting deep contact on full Fock, N1 | derived | Arbitrary signs with |alpha_eps|eps^3->infinity suffice; in particular +/-eps^-6 adjacency penalties. Number conservation permits the full-Fock direct-sum argument. Adding mu N is sectorwise harmless. |
| Positive full-Fock extension, C1 | derived | Eventual alpha_eps>=a, with alpha_eps->alpha in [a,infinity) or ->+infinity, gives the stated full-Fock limit. No n-uniform trace constant is claimed. |
| Negative total-contact stability, C2 | negative | Normalized pure-n trials have energy <=-c n(n-1)^2+O(n) for alpha<0. This excludes a common lower bound, not a self-adjoint operator or resolvent limit. |
| Arbitrary diagonals / G_r-only classification, N2/D1 | negative | Internal bands can be unaligned and individual fibre channels can have different collision laws. G_r enforces occupation conservation only. |
| General positive range-r interface | conditional | Retain CA-94.13's graph control, finite stencil, bounded source, closed-core and recovery assumptions. A signed extension needs its own boundary consistency argument. |
| Signed reacting full-Fock classification | conditional | Requires the new realization/core lemma in (e); T4 cannot be lifted to this scope. |
| Independently renormalized triple-cluster dynamics | conjectural | CA-94.14 gives an H1 trace obstruction, not a universal counterterm or its coefficient. |

The main report statement should explicitly declare t>0, mu>0, finite
reaction lists with lambda_rho,kappa_sigma>=0, the five moments, eps=1/L,
scalar kinetic/contact action, and the exact open endpoint completion.
With the square factors of CONVENTIONS (aw), the microscopic family is

```
H_eps = sum_j [t eps^-2 D_h,j^*D_h,j
          + sum_rho lambda_rho eps^-1 D_b,rho,j^*D_b,rho,j
          + sum_sigma kappa_sigma eps^-1 D_v,sigma,j^*D_v,sigma,j
          + (alpha_eps-a) eps^-1 P_XX,j] + mu N,
c_eps = -2t + eps alpha_eps.
```

For its **Galerkin compression**, the classification is exactly
`alpha_eps -> alpha in R` **or** `|alpha_eps| -> infinity`. The finite limit
has the boundary relation
`t D u_2 + alpha T u_2 - B_beta u_1 - V_nu u_0 = 0`.
The infinite limit has `T u_2=0` and decoupled sectors, with

```
W_0 = gamma,
W_1 = mu I + Q_b + gamma I,
W_2 = 2mu I + (Q_b)_1 + (Q_b)_2 + gamma I.
```

Do not identify this with compressing the untruncated resolvent. Do not replace
the declared (F) by “hop plus diagonal.” No new F/R gauge, braided exchange
statistics, modular datum or conformal symmetry is supplied.

Evidence to carry with the shard: NOTE A1/L1/T1/B1/T2/T3/T4, N1/N2/C1/C2/D1;
`REVIEW.md` per-step audit; four raw reviewer output files and
`checks/review_manifest.json`. Two new independent scripts test global trace
interpolation and complex, nonconstant-source graph approximants; their finite
checks do not replace the proofs. If a single shard cannot retain these
boundaries within 280 lines, split the classification and full-Fock/range
limitations rather than silently omitting hypotheses.

## (b) Exact CA-88 cells that move and do not

Line anchors refer to `report/sections/88_layered_targets.tex` as reviewed.

| Cell / anchor | Change justified by this review |
|---|---|
| Existing-results row **CA-94**, :153, Comment column | Expand “D1-C proved for tuned family” with “exact scalar-contact moment deformation classified on N<=2 Galerkin carrier; both infinite signs give Dirichlet; positive full-Fock extension and nonreacting attractive counterfamilies derived.” The whole D1-C row is not universally classified. |
| Same row :153, S column | Unchanged: any (open). |
| Same row :153, L column | Unchanged: L0 plus declarations. Explicit scalar contact/kinetic action is a microscopic restriction, not an automatic consequence of L0. |
| Same row :153, R column | Unchanged: R0^c plus off-ladder z=2. This is horizontal classification progress, not a new conformal rung. |
| D1-C collision-sewing discussion, :167-174 | Sharpen the derived family scope with T4 and the retained W_n. Qualify “tuning is necessary”: the finite-Robin window is not necessary for existence of every limit; Dirichlet limits occur outside it. |
| D1-C restated **R0^u+R1** target, :169-171 | Unchanged/open: local unital refinements and a compatible WT-1 state are not constructed. |
| D1-C first lemma, :175-176 | Unchanged/open: the local unital lift of the dressed refinement is not supplied by contact classification. |
| D1-C next-layer demands, :176-177 | Unchanged: KS/Ward data and fidelity markings remain absent. |
| Definition 88.3 certificates, :102-108 | No new R0^u or R1-R5 certificate; retain all existing statuses. |
| Round-2 E6 next-target pointer, :237 | Append a dated round-3 pointer recording that Target 94.16 was refuted and replaced, not proved as stated. |
| Other existing-results rows, :136-152,154-155 | No status changes follow from F5. |

By forgetting extra data the restricted statements also hold when C comes with
L1-L4 data. This does not create new use of those data or a fidelity result.

## (c) Amendments other shards need — dated pointer form

These are proposed append-only pointers. Substitute the allocated new shard ID
for the F5 labels when integration occurs; retain the original text as history.

1. **CA-94, after Target 94.16 (:240-248):**
   “**Amendment (2026-10-25, round 3).** The contact trichotomy is refuted:
   spectral diving does not preclude a projected nonreal resolvent limit.
   F5-T4 classifies the exact scalar family (F) on the N<=2 Galerkin carrier:
   finite alpha gives the coupled Robin form; |alpha|->infinity gives
   Dirichlet with retained lower potentials, for either sign. Arbitrary fixed
   h and the signed reacting full-Fock problem are not classified.”

2. **CA-94, after the effect/limitations paragraphs (:250-259):**
   “**Amendment (2026-10-25, round 3).** F5-C1 extends the positive full-Fock
   family under eventual alpha_eps>=a; F5-N1 gives nonreacting attractive
   and sign-oscillating full-Fock examples. F5-C2 excludes a common lower
   bound for negative total alpha, without proving absence of a limit.
   F5-N2/D1 require internal band and channel assumptions in any extension.
   The general range and higher-codimension qualifications remain.”

3. **CA-77, after its existing amendment (:249-251):**
   “**Amendment (2026-10-25, round 3).** For the exact family (F), F5-T4
   classifies N<=2 Galerkin collision limits. The -2t+O(eps) window produces
   finite Robin data; limits also exist outside that window. Dirichlet
   decoupling retains outgoing reaction-square potentials. The carrier is
   unchanged and the result remains off-ladder z=2.”
   This avoids reading the historical “tuning is necessary” as the false iff.

4. **CA-88, row :153 and D1-C :167-177:** append a short
   “**Amendment (2026-10-25, round 3):** see F5-T4 for the exact-family
   N<=2 classification and F5-C1/C2 for the full-Fock boundary; R0^u+R1
   remains open.” Use the precise cells in (b), not a global “classified” tag.

CA-89--CA-93 need no mathematical amendment from this result. In particular,
no reflection-positive history, Ward/KS certificate or fidelity conclusion
can be inferred from these nonrelativistic resolvents. The older E6 integration
proposal (:104-117) should receive a dated supersession pointer if historical
exploration documents are maintained; it must not remain a live theorem target.

## (d) CONVENTIONS entries needed

Add a dated amendment to **(aw)** or an allocated new collision-classification
entry; do not pre-empt a letter being assigned to another round-3 result.

- **Exact data and positivity:** finite fixed b/v lists, nonnegative weights,
  t>0, mu>0, scalar kinetic/contact blocks, and open no-outer-penalty endpoints.
  CA-94:77-78 already states the weights' positivity; repeat it directly.
- **Total versus excess contact:** alpha_eps=(c_eps+2t)/eps;
  deformation of the D1 squares is (alpha_eps-a)eps^-1 P_XX. If the external
  coefficient is specified before adding squares, alpha=delta+a.
- **Truncation:** H_eps^[M]=P<=M H_eps P<=M on Ran(P<=M); keep all lower
  source squares into omitted occupations. This differs from
  P<=M(H_eps-z)^-1P<=M. The classification uses M=2.
- **Resolvents:** use (H-i)^-1 for the signed classification. A common positive
  real shift is available for finite-contact semibounded proofs, not assumed
  for arbitrary divergent attractive contacts. Diving energies and failure of
  a self-adjoint projected limit are distinct assertions.
- **Flux/measure:** retain D=partial_1-partial_2 and dy=dS/sqrt(2). In collar
  coordinates s=(x+y)/2, r=y-x, D=-2partial_r. Robin normalization is alpha/t
  for D or alpha/(sqrt(2)t) for unit normal.
- **Retained potentials:** record W_0,W_1,W_2 above, with coherent insertion
  notation instead of a tensor-product factorization of a fusion fibre.
- **Review calibration conventions:** cell-centre samples, eps^(n/2) amplitude,
  complex conjugate-transpose daggers and explicit tolerances are in the new
  review scripts. No raw Fibonacci cup/vertex value is assumed by these tests.

No change is needed to the unit index, left-associated categorical bracketing,
F/R convention, chirality tags or CA-88 target ladder.

## (e) Single next lemma

**Signed reacting full-Fock realization and graph-core lemma**
(any/open; L0 plus fixed signed microscopic data; off-ladder z=2).

For (F) with X!=0, finite total alpha<0 and beta or nu nonzero, construct a
self-adjoint full-Fock operator satisfying the local CA-94 source equations,
together with a dense operator core D and lattice approximants for every
u in D obeying

```
K_eps u_eps -> u,
K_eps H_eps u_eps -> H_alpha u.
```

Alternatively give a fixed source whose projected nonreal resolvents cannot
converge to a self-adjoint limit. The proof must control occupation tails and
boundary feedback, not just the N<=2 compression. C2 forbids a common lower
bound for this unmodified negative-total-contact form; it does not settle
self-adjoint realization. Finite-sector smooth form cores must not be relabelled
operator cores: reacting boundary equations can require higher occupations.
Neither an automatic triple counterterm nor N-uniform estimates from CA-94.5
may be assumed. This is the remaining lemma, not a new result of this review.
