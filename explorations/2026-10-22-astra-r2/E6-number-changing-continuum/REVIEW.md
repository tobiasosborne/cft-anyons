# E6 — Sceptical review (round 2)

Reviewer: Claude Opus (proof-checker subagent), 2026-10-22. Lens: AGENTS.md Rules 16, 17.
Inputs read in full: `NOTE.md` (863 lines), `checks/*`, brief
`briefs/E6-number-changing-continuum.md`, CA-77, CA-88, CONVENTIONS (ak)-(aq),
D1 `NOTE.md:1-120,390-600`, `REVIEW.md:60-145`, `INTEGRATION.md:85-141`,
`checks/review_contact_check.py`. No Julia, no latexmk, no edits outside this directory.

## Headline grade

**COUNTEREXAMPLE (verified)** for conjecture E6 as stated in the brief, with a
**proof-complete replacement**: E6-T1 (projected-resolvent convergence of the tuned
positive-square D1-C family on the whole Fock carrier, all sectors, no imported
analytic hypotheses) together with L1-L3, T2, N2, P3. I found no invalid step.
Brief clause by clause:
- (a) false: N1 (pure hop, every C, every X != 0, every real scalar subtraction,
  real or non-real spectral parameter). Recomputed independently.
- (b) false: falls with (a). k=0 also refutes a mandatory Laplacian. N2 shows that even the
  repaired limit is not an extension of the minimal chamber Laplacian, because
  lower-sector *interior* values feed upper-sector collision conditions.
- (c) false as an unrestricted surjectivity statement: N3 (grading obstruction G_r,
  instance Hilb(Z_3) at nearest-neighbour range). Recomputed. N3 does **not**
  settle (c) for categories without the grading obstruction or for a local target
  class. The note says so.

What is proved is a different, ε-dependent family. It is not the brief's fixed h
with three scaling buckets: hop ε^-2, fusion cross term ε^-1/2, pair cross term ε^0,
contact ε^-1 (P1). This replacement is the right statement. The brief's scaling is
inconsistent even for D1-C's own Hamiltonian.

## 1. Citation check

Every cited path:line was opened.

| Citation | Claimed content | Verdict |
|---|---|---|
| CONVENTIONS.md:631-694, 740-800, 1397-1519, 1521-1537 | (r); (t),(u); (ak)-(ap); (aq) | OK (headers at 631, 740, 773, 1397, 1521) |
| Penneys:195-237 | unitary ⇒ semisimple; orthogonal sums, projections, splittings | OK (3.2.5-3.2.16) |
| Penneys:219 | orthogonal summand projections | OK (Def. 3.2.10) |
| Penneys:394-398 | coherence / graphical calculus | OK (Thm 3.4.2) |
| Penneys:470-478, 528-538 | fusion rules; isometry inner product | OK |
| Penneys:20, 277-282 (examples table, Z_d) | graded vector spaces; Vec(G), Vec(G,ω) | **Minor mismatch**: these are the *non-unitary* Vec examples. The unitary Hilb_fd(G,ω) is Penneys:321 (Ex. 3.3.11). Replace with :321. |
| CA-77:96-126 | occupation grading Prop 77.4 | OK |
| CA-77:207-226 | carrier Thm 77.8, box isometries K_π | OK |
| CA-77:241-246 | tuned contact term caveat | OK |
| CA-88:41-108 | setting/data/rung definitions; R1 = Wilson state | OK (Def. 88.3 at :84-99) |
| D1 NOTE:35-41 | D1-C Hamiltonian | OK |
| D1 NOTE:91-104 | collapsed measure dS/√2, B, V, Γ | OK (:91-97 conventions 5) |
| D1 NOTE:483-516 | D1-T7 smooth recovery | OK; re-verified (below) |
| D1 NOTE:498-508 | face scalings ε^{n+1} | OK |
| D1 NOTE:534-543 | source bounds | OK |
| D1 REVIEW:78-98, 131-139 | contact tuning, inert category, liminf gap | OK |
| D1 INTEGRATION:92-141 | reformulation, first lemma, missing hypotheses | OK |
| review_contact_check.py:1-44 | two finite contact Hamiltonians | OK |
| girardeau:65, 88 | point-core discussion, no Mosco theorem | OK; correctly *not* used |
| references/manifest/SOURCES.md:35,57; category-theory/SOURCES.md:1-25 | provenance | OK |

**Source gap confirmed.** I grepped `references/` and `literature/md/` for Mosco,
Kuwae, interior-boundary, Teufel and Tumulka, and point interaction. There is no
analytic source. The note proves its analytic lemmas inline and does not cite one
from memory. That is the correct Law-1 behaviour.

**Unsourced standard fact.** The bound ‖id⊗b⊗id‖ ≤ ‖b‖ is used in L2 `<1>2` and is
inherited from D1:538. It follows from ⊗ being a linear †-functor (Penneys:319,
Def. 3.3.10), since `id⊗(·)` is then a *-homomorphism of the C*-algebras End. Cite :319.

## 2. Step-by-step verdicts

**N1** (pure hop has no full-Fock projected-resolvent limit).
- <1>1 valid: k annihilates `00`, and K preserves the vacuum.
- <1>2 valid: injectivity of a resolvent forces s_ε to converge to a finite real number.
- <1>3 valid: the one-particle sector is `Hom(c,X)⊗ℓ²`, with the hop acting as the
  identity on the fibre via unitors. The residual bound is ‖w‖² ≤ sup|f''|², by L
  entries of size √ε·sup|f''|.
- <1>4 valid: |d_ε| → ∞.
- <1>5 valid: ‖K*g − u‖ ≤ ‖g − Ku‖. K_εK_ε* → I is not even needed.
- Real-λ reduction: checked. |1−(λ+i)t|² = (1−λt)²+t² ≥ 1/(1+λ²), and the second
  resolvent identity gives strong inverse convergence.
- Robustness: N1 survives if the "diagonal part" is also scaled by ε^-2. The mismatch
  is a number-proportional chemical potential, never a scalar.
- Nuance: the limit does exist as a pseudo-resolvent of an operator on the vacuum
  line only (generalised resolvent convergence). N1 refutes the brief's
  "self-adjoint H_h on F" wording, which is exactly what was claimed.

**P1** valid. Square expansions re-multiplied. Power counting: fusion amplitudes
ε^{(n+1)/2}, ε^{(n+2)/2}, pair ε^{n/2}, ε^{(n+2)/2}, on a grid of ε^{-(n+1)} points, give
g_b = ε^{-1/2}, g_v = 1. The brief's uniform ε^-1 on fixed tiles gives cross sizes
ε^-1/2 and ε^-1. My mutation run shows the vacuum diagonal growing ∝ L.

**L1** valid; this is standard. Dilation about an interior point of the convex simplex,
then mollification; the pyramid Jacobian height·(1−t)^{n−1} and the FTC/Cauchy-Schwarz
trace bound were checked. Constants depend on n, which is harmless because the lemma
is used sectorwise only.

**L2** valid.
- <1>1-<1>4 valid. S is bounded on V₀ through μ>0. T is closed because V₀ convergence
  gives fixed-sector H¹ convergence and hence trace convergence. Graph-norm
  equivalence holds by two triangle inequalities.
- <1>5 valid. Truncation commutes with T by upper-sector number. The lower source
  from ψ_M into sectors M+1, M+2 is correctly retained.
- <1>6-<1>7 valid. This is the Riesz-variational construction of the associated
  operator; the self-adjointness argument (w = R_z(g+zw)) was checked. Hypothesis
  μ>0 is stated and needed: with b ≠ 0 and μ = 0, S is not bounded by the bulk form.

**L3** (collision-trace liminf) valid. This is the new analytic content, and it closes
D1-C's stated gap.
- <1>1 valid. The hopping energy is exactly ε^{n−2}Σ_edges‖Δf‖², counted once. Fibres
  are transported by coherent unitors only.
- <1>2 valid. Forward quotients are exact box shifts on a uniform grid. Summation by
  parts is legal on supp φ ⊂ Ω_d. Global H¹ follows because every test function lives
  in some Ω_d.
- <1>3 <2>1 valid. Jensen gives ‖A−M‖² ≤ (1/m)Σ_r‖f_0−f_r‖². Telescoping gives
  ≤ (m/2)Σ_s‖Δ_s‖²; the note's bound mε·E is weaker and true. Row-uniqueness of
  collar edges and bulk boxes was checked: the face cell fixes the row.
- <2>2 valid. The kernel G_ε has its z-interval (jε,(j+m)ε) beginning at the upper
  cell boundary, with t ∈ cell j ⇒ t < jε. G_ε → G strongly in L², and a strong×weak
  pairing converges.
- <2>3 valid. The FTC remainder and h/3 bound were checked:
  |h^{-1}∫(h−s)g|² ≤ (h/3)∫|g|². Identifying all cluster points with Tψ uses weak lsc
  of ‖A_ε−M_ε,h‖; correct.
- <1>4 valid. Lower sources are exactly B(K u_{n−1}) and the pulled-back V(K u_{n−2})
  on separated patches. The face weight ε^{n−1} was re-derived: ε^{-1}·ε^n·‖f_n−bf_{n−1}‖².
- <1>5 valid. Distinct faces correspond to distinct operator terms (bond, rest
  configuration), so there is no double counting. Bulk and reaction terms are
  different operator summands. Positive exhaustion: corners have face-measure zero.
- **No N-uniform constant is used**, and the claim is true. Every constant depends on
  a finite collection (n, d, U, h), and the supremum is taken after the liminf.

**T1** valid.
- <1>1 relies on D1-T7, which I re-verified for vectors smooth on closed chambers.
  Riemann sums, an O(ε) strip for missing moves, face sums converging to collapsed
  integrals, and finitely many sectors.
- <1>2: the diagonal recovery is correct.
- <1>3-<1>5: the Γ-to-resolvent argument is correct. Completing the square gives
  F_ε(v)−F_ε(u_ε) = ⟨v−u_ε,(H_ε+z)(v−u_ε)⟩ ≥ z‖v−u_ε‖².
- Note: T1 does *not* use K_εK_ε* → I. The pairing ⟨K_ε*f,v_ε⟩ = ⟨f,K_εv_ε⟩ suffices,
  so convention 2's uniform-mesh remark is not load-bearing.
- Number-change criterion: valid. If β = ν = 0, q splits by n. Otherwise there is a
  nonzero mixed form, and reduction by every P_k would split the form on a form
  core (the N3 <2>1-<2>2 argument, checked).

**P2** valid as stated. It is a regular-vector computation, with the √2 bookkeeping
checked: ∂_ν = (∂_i−∂_{i+1})/√2 and dS = √2 dy. Global H² is honestly marked
conditional.

**N2** valid. If H ⊇ A_min, then ψ ∈ D(H) and q(ψ) = ⟨ψ,A_minψ⟩. But q(ψ) exceeds this
by ‖Sψ‖² > 0. In fact a stronger statement holds: a C_c^∞ lower vector with Bψ ≠ 0 is
not in D(H) at all, since the mixed form is a boundary functional of the upper sector.

**T2** valid.
- The moment identity Σλ(b−β/a)*(b−β/a) = Q_b − β*β/a was re-derived.
- The 2k-map reconstruction was checked for zeroth, first and second moments.
- G_M is the cone of PSD blocks on charges with n_c > 0, by a row-Gram argument.
- G_W = R_{≥0} or {0}. Both reaction types range over every collision face once, so
  only a = a_b + a_v enters.
- The same holds exactly at finite ε, not only in the limit.

**N3** valid.
- <1>1: degree-(q−p) tiles lie in Hom(Z_p,Z_q) = 0, using CA-77:96-116.
- <1>2: strong limits preserve commutation with the bounded P_k.
- <1>3-<1>6: ℓ_s is H¹-bounded by L1. The form is closed (a bounded nonnegative
  perturbation of the closed Neumann form). It contains the free minimal operator.
  The non-splitting computation was checked: L(u_m+u_n) = 0 and L(u_m−u_n) = 2.
- Equivariance is robust. The rank-one fibre map e_m e_n* is induced by the morphism
  ι_m ι_n*: X^n → X^m, which exists because n > r. So N3 also holds under the
  stronger "induced by a morphism, natural in c" reading.
- The Lagrangian graph remark (L²×L² symplectic form) is formal and not
  load-bearing. The operator comes from the form.

**P3** valid: a unitary †-functor preserves the isometry inner products, and
tensorators are unitary.

**P4** valid, and its extension to range r is honestly labelled conditional.

**Codimension-two obstruction** valid. The log-cutoff gives energy 2π/log(h/δ) (times
the wedge fraction) → 0, with a fixed stratum value; points have zero H¹-capacity in 2D.

## 3. Refutation attempts (all on T1/T2 failed; N1/N3 confirmed)

1. **Vec, X = 1** (non-connected O, scalar fibres; Rule-16 calibration only).
   `checks/review_tuned_convergence.py` compresses H_ε to N ≤ 2 with λ = κ = μ = 1,
   b = 0.7, v = 1.3, at L = 12, 24, 48, 96.
   - The lowest eigenvalues are Cauchy, with successive maximal differences
     0.265, 0.143, 0.074, consistent with O(ε).
   - ⟨Ω|H|Ω⟩ → κv*v = 1.69 (γ).
   - The ground-state N=2 weight stays ≈ 0.052 instead of decoupling (Dirichlet failure absent).
   - Brief-scaling mutation: ⟨Ω|H|Ω⟩ grows as 223, 933, 3813.
   Raw output: `checks/review_tuned_convergence_output.txt`.
2. **N1 recomputed** with a different probe and three real shifts
   (`checks/review_N1_N3.py`). The one-particle projected resolvent falls as
   ~ε² (1e-3 → 3e-6), while the vacuum response stays |(-s-i)^{-1}|.
3. **N3 example recomputed.** Hilb(Z_d): G_r holds for (d,r) = (3,2), (4,3), (5,2).
   X² and X^{d+2} share a simple. d = 3 correctly fails G_3.
4. **Vec_G with cocycle.** ω enters only through the coherent unitors and associators
   that transport fibres. L3 and T1 use only finite-dimensional norms. No break.
5. **Non-self-dual X.** Hom(1,X²) may vanish. T2 handles W = 0 (ν = γ = 0, pure contact
   weight allowed). No step uses duality.
6. **Multiplicities.** T2's block cones are stated with general m_c, n_c. L3 never
   uses a basis.
7. **Non-braided.** Ordered 1D configurations never exchange; nothing uses R.
8. **X = 0.** H = 0 on the vacuum line; consistent with T2.
9. **Uniformity in N.** I searched for any constant that silently needs to be
   N-uniform: S-bound (uniform through μN), truncation (tail through the graph norm),
   liminf (finite collections then supremum). None found.
10. **Uniformity in ε.** All uniform meshes ε = 1/L are allowed. Uniform boxes make
    discrete shifts exact; nested meshes are not needed for T1.

**Scope omission, not a gap.** For non-connected O (Hom(1,X) ≠ 0), (ak)-type tiles of
degree ±1 that create a *single* particle from a vacancy exist. They are bulk
(codimension-zero) sources and lie outside the D1 family. Neither T1 nor N1 covers
them. N1 does not need them, but a fixed-density classification (Open problem 1) must.

## 4. Rule 16 / Rule 17 audit

- **Rule 16.** Pass. Proofs are for general unitary fusion C with arbitrary fibres;
  the only named category is Hilb(Z_d), in the examples table. The checks use scalar
  fibres as declared calibrations.
- **Rule 17.** The note's tags are correct and more careful than the brief's:
  - Setting: any, with open-interval geometry.
  - Data layer: L0 plus declared reaction, kinetic and contact data.
  - Rung: R0^c carrier (CA-77) plus an off-ladder z=2 resolvent limit.

  The note correctly refuses the brief's "R1 for dynamics", since CA-88 R1 is a
  Wilson-triangle state. **Where the category enters is stated correctly**: fibres,
  admissible Hom spaces, coherent insertions, T2 support cones, and G_r. **Where it is
  inert** is also stated correctly: every analytic estimate. N3 is the one place where
  fusion rules restrict the *attainable* continuum dynamics, which sharpens D1 R2's
  "inert category" verdict.

## 5. Minor issues (non-blocking)

1. Examples-table citation should be Penneys:321 (unitary Hilb_fd(G,ω)), not :20,277-282.
2. Cite Penneys:319 for ‖id⊗b⊗id‖ ≤ ‖b‖.
3. The Lagrangian in N3 uses an L²×L² trace pairing, which is not a boundary triple
   for the Laplacian on polytopes. Label it "formal".
4. Convention 2's all-uniform-mesh projection claim is not used by T1. Say so.
5. Number-change criterion <1>3 forward-references N3 <2>1-<2>2. Fine, but could be
   promoted to a stand-alone lemma ("reduction passes to the form").
6. The operator class found is exactly the interior-boundary-condition type, where
   lower-sector interior values enter upper-sector collision conditions. Prior art on
   such Hamiltonians may exist, but **no local source is present**. Acquire one
   before any novelty or comparison claim; nothing is cited here from memory.
