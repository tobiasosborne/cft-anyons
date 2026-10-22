# E4 — Sceptical review of the Ward-to-Koo–Saleur transfer note

Reviewer: Claude Opus 5.5, 2026-10-22. Lens: AGENTS.md Rules 16, 17 and Laws 1–3.
Object: `NOTE.md` (625 lines) and `checks/`. Brief:
`../briefs/E4-ward-to-ks-transfer.md`. No file outside this directory was
edited. Nothing was committed. Julia and latexmk were not run.

**Headline grade: WEAKER-RESULT-PROVED.** The note says itself that the brief's
conjecture E4 is not proved. Its own proved and conditional statements hold
step by step: E4-W, E4-T, E4-A, E4-P, E4-C, E4-N1, E4-N2 and E4-N3. Every
citation checks out apart from one minor attribution. There are three
reviewer findings. They do not invalidate any step, but they change how the
note's results should be read and integrated.

* **(F1) E4-W has almost no transfer content.** W1 does not constrain X or W,
  because they are defined by (5). As a result, the assembled error E in W2
  is *identically* `[S_m,S_n] − β_N S_{m+n} − z^{(r)}_{mn}` (computed below,
  check R1). W2 is therefore A4 with the finite-size multiplier β_N in place
  of (m−n). Given W3, E4-W is the elementary implication "β_N-A4 ⇒ A4". The
  whole contour-to-commutator problem sits inside hypothesis W2. The note's
  open lemmas 1–2 already say so, but its status line "the quantitative
  transfer theorems below are proved" overstates E4-W.
* **(F2) A2 fails for the brief's literal control.** The note says A2 for the
  brief's K = 1+(H−E_0)/v is "generally very strong". It is actually false
  whenever the spectral width w_N of (H_N−E_0)/v_N stays bounded below. In
  that case max(|T_0|_{0,1}, |T̄_0|_{0,1}) ≥ N w_N/(4π(1+w_N)) → ∞
  (check R2). Every A2-dependent result (E4-W, E4-T, E4-C) therefore needs a
  different control, for example the conformal 1+E_N or CA-79's Q^p.
* **(F3) The "any refinement" A3 clause of E4 is self-defeating.** E4-N3
  can be strengthened to a reductio that needs no A2 and no liminf
  hypothesis. Suppose E4's conclusion held for one refinement J with c* ≠ 0,
  translation-covariant gates and a translation-invariant control with
  min spec 1 (the brief's K qualifies). Then the refinement W J, with W a
  translation by an even number of sites ≈ N'/2, intertwines the gates
  equally well but violates A3. So E4 as worded can hold only vacuously or
  with c* = 0 (proof in §3).

## 1. Citation check

Every path:line in the note was opened.

| Cited | Claimed | Verdict |
|---|---|---|
| CA-78:233–250 | C1–C6 numbering; C3 collars; C4 Ward | Correct (Conj. 78.12 at :233, C3 at :236–238, C4 at :238). **Minor mismatch:** the clause "after the full KS normalization" attributed to CA-78's C1 is in D2 NOTE:620–622, not CA-78. |
| D2 NOTE:639–653 | C3 asks for differentiated transport and two-loss Ward residuals | Correct |
| D2 NOTE:655–701 | (19) is a correlation identity; operator bridge open | Correct ((19) at :664, "Still open" at :696) |
| D2 INTEGRATION:110–115 | reconciled transfer target | Correct (:111) |
| D2 NOTE:549–573, 575–594 | L9 Gram amplification, L10 collars | Correct |
| D2 REVIEW:76–97, 149–157 | certificate limits; L9/L10 verified | Correct |
| CA-79:73–81, 159–176 | Lemma 79.1, D4-R leakage | Correct |
| CA-79:85–90, 112–155 | interpretation vs regularity control; Thm 79.2; Ex. 79.5 | Correct |
| CA-79:79–81 | zero-mode shift c ↦ c+24d, c* fixed | Correct |
| Linnea11.5.tex:791–820 | KS normalization | Correct (generators at :806–818) |
| Linnea11.5.tex:3191–3198, 3220–3229 | modified bracket with c, c*; conjectural | Correct ("Combining the three conjectures") |
| KooSaleur1993:1095–1108 | intermediate-state caveat | Correct |
| CarpiWeiner2004:727–747 | continuum energy bound | Correct |
| Schottenloher2008.md:2507–2517, 2552–2589, 2610–2634 | H²(W)≅ℂ; diagonal reduction; recurrence | Correct; the source removes the coboundary (h(1)=0), the note keeps it, as it says |
| CGS StressTensor.tex:527–532, 603–626 | convergence proved only at n=1 | Correct |
| VR-1 virasoro_routes.md:55–76, 78–149, 151–177 | A1–A4; theorem; exclusions | Correct |
| reconstruction/01_cells.md:164–195 | LC-W; accumulated sum not bounded | Correct (:173, :190, :194) |
| CONVENTIONS 704–718, 801–810, 1099–1115, 1196–1215, 1397–1448, 1483–1534 | (s), (v), (ad), (af), (ak), (al)–(aq) | Correct; "category-free" tag at :1528 |
| SOURCES.md entries | provenance | Present |

The checks were run: `python3 .../checks/check.py` passes all 5 groups. They
are exact SymPy identities for the displayed algebra. They verify nothing
about W1, W2 or any certificate, and the note says this.

## 2. Step-by-step verdicts

**§1, normalization warning.** The identity T_0+T̄_0 = N(K−1)/(2π)+2b_r is
valid (CA-79:79 with K = 1+(H−E_0)/v). The qualitative reading is too weak;
see (F2).

**E4-W.** (Hypotheses W0–W3.)
* <1>1<2>1 *Valid.* D_N f_m = d_N(m) f_m, and periodic summation by parts
  `Σ A D B = −Σ (DA) B` (shift both sums).
* <1>1<2>2 *Valid.* The nonscalar sum is (2d(m)−d(m+n))(S_{m+n}−bδ). I
  re-derived it, and check R1 confirms it numerically for random Q.
* <1>1<2>3 *Valid.* The aliasing δ_{m+n≡0 (N)} equals δ_{m+n,0} once
  N>|m+n|. The scalar is κ3 d³+(κ1−2b)d, since β_N(m,−m) = 2d(m).
* <1>2 *Valid.* |d_N(m)−m| ≤ ℓ²|m|³/6, which gives (9).
* <1>3 *Valid*, because |X|_{s,d+1} ≤ |X|_{s,d} and ‖K^{-2}‖ ≤ 1. A2 (W3)
  is genuinely used, and the note points this out.
* <1>4 *Valid.* The Virasoro form (7) holds *by hypothesis*: the scalar
  contacts are restricted to D³ and D. The note admits this.
* **Reviewer's reading (F1).** Given any operators Q_j and constants κ, put
  X := 0 and W := [S_m,Q_j] − (Ward right-hand side). Then W1 holds. By
  <1>1, E_{r,m,n} = [S_m,S_n] − β_N S_{m+n} − z^{(r)}_{mn}, an identity
  independent of the split into X and W (check R1, max deviation 4e-15).
  So W2 is a near-A4 statement, not a statement about local Ward identities.
  The note's sufficient condition N⁻¹Σ_j(|X_j|+|W_j|) → 0 is a genuinely
  local criterion. However, it asks each local commutator [S_m,Q_j] to
  contain the *scalar* κ3 d³ f_m(j) up to an error that is small in the
  two-loss norm. No source or check shows that a lattice density can do
  this. The central term of KS commutators is a state-level effect of the
  assembled sum (traces of finite commutators vanish). This local form is
  **unverified and plausibly never satisfied**. It should not be advertised
  as the natural route.

**E4-T.** <1>1 *valid*: triangle inequality, and the KS adjoint pairing comes
from CA-79 Lemma 79.1. <1>2 *valid*: the expansion (11) was checked by
hand. <1>3 *valid*: each of the 8 product bounds in (12) follows from (3)
with the correct graph orders; d is needed at orders s and s+1, M at s and
s+1. The constants are uniform in r by hypothesis. <1>4 *valid with a
stated hypothesis*: mixed contours with zero contact. Tags: the statement
uses no categorical data, so it is category-free, not "L0 plus".

**E4-N1.** *Valid* (computed: [A,B] = [[0,1],[−1,0]], norm 1). It shows that
some product bound such as A2 is needed. It does not refute any claim of
the brief directly.

**E4-A.**
* <1>1–<1>2 *valid*: Cauchy's formula for the η-linear coefficient, so
  |F'(0)| ≤ u/ρ. This needs J independent of η, which the note states.
* <1>3 *valid*: K_{r+1}^{-s-1}J = J K_r^{-s-1} by functional calculus on
  the reducing range, and J is an isometry.
* <1>4 *valid*.
* Unstated but harmless: K_r and K_{r+1} must not depend on η. This is
  implicit in "fixed graph weights".

**E4-N2.** *Valid.* ∂_η G_r(1,0) = −ε⁻¹e⁻¹A (computed), and
sup ‖G_r − G‖ ≤ ε on 0 ≤ t ≤ 1. The family is entire, but its complex
growth ~ e^{ρ/ε²} breaks (13), which is exactly the point the note makes.
It is an abstract operator family, not a C1 certificate, and the note says
so.

**E4-N3.**
* <1>1 *valid* (check R3).
* <1>2 *valid*: (16) is correct for odd n.
* <1>3 *valid*: W_rJ_r is a graph isometry because W commutes with K_{r+1}.
* <1>4 *valid*.
* Two hypotheses are superfluous. "Even fine sizes" can be dropped by using
  U^k with k even and |k − N'/2| ≤ 1: the phase tends to −1, and an even k
  also preserves a brick-wall sweep. The liminf hypothesis can be dropped
  by the dichotomy in (F3).

**E4-P.** *Valid* formal residue calculus. I re-derived
Res g(f∂T + 2f'T) = (m−n)L_{m+n}, the general (A_2−A_1)(m+1)−A_1(n+1), and
the shift c = c_W + 24b. It is consistent with (7) under the cylinder chart:
plane-to-cylinder gives κ1 = 0 and κ3 = c_W/12, so c = 24b′ with
b′ = b + c_W/24. The note correctly leaves the lattice chart-change
estimate open (lemma 5).

**E4-C.**
* <1>1<2>1 *valid*.
* <1>1<2>2 *valid*: translation averaging is contractive because U commutes
  with K, and the min spec K = 1 anchor gives ‖K^{-2}‖ = 1.
* <1>1<2>3 *valid*: the operator part [T_m,T_m*] − 2mT_0 is self-adjoint,
  tested on the K = 1 eigenvector.
* <1>2 *valid*: (20) has the correct orders, the Witt coefficients cancel,
  and the remaining scalar is killed by ‖K^{-3}‖ = 1.
* <1>3 *valid*: the recurrence (21) was re-derived from the triple
  (m,1,−m−1). The closed form and (19) were checked symbolically (note's
  group 2).
* E4-C is the strongest new item. **Any** A4-type closure with convergent
  scalars, under translation covariance and A2, automatically has the
  two-constant Virasoro form. This answers the brief's "prove it has
  Virasoro form" independently of how the contact is computed.

## 3. Reviewer findings with proofs

**R-A2 [negative; full, category-free, →R2].** ASSUME the KS modes of
CA-79 (79-ks) with ε_N = E_0/(Nv_N), K_N = 1+(H_N−E_0)/v_N, and
w_N := max spec K_N − 1 ≥ w > 0 for all large N. PROVE A2 fails at
(n,s) = (0,0).
<1>1. T_0+T̄_0 = N(K−1)/(2π)+2b (CA-79:79).
<1>2. On the top eigenvector,
max(|T_0|_{0,1}, |T̄_0|_{0,1}) ≥ ½|N w_N/(2π)+2b|/(1+w_N) → ∞.
QED.
Calibration (C = Vec, O = ℂ², Heisenberg density, L = 4, 6, 8):
0.85, 2.07, 3.12, growing linearly (check R2). Extensive width makes w_N
grow; even w_N bounded below suffices.

**R-N3′ [negative, conditional reductio; full, category-free, →R2].**
ASSUME:
* VR-1 A1 (isometric J_r, exact transport of K) and N_r → ∞;
* unitaries U_r commuting with K_r and with the time gates, with
  U_r T_{r,n} U_r* = e^{−2πin/N_r} T_{r,n};
* min spec K_r = 1;
* the KS modes satisfy A3 for J and A4 with (c*, c).
PROVE: either c* = 0, or A3 fails for J′_r := U_{r+1}^{k_r} J_r with
k_r even and |k_r − N_{r+1}/2| ≤ 1. The refinement J′ has the same
gate-intertwining errors as J.
<1>1. W T_n = λ_r T_n W with λ_r = e^{−2πink_r/N_{r+1}} → −1 for odd n.
Then Δ′ = W(λ⁻¹Δ + (λ⁻¹ − 1) J T_{r,n}), and since W J is a graph
isometry, |Δ′|_{s,1} ≥ |λ⁻¹ − 1| |T_{r,n}|_{s,1} − |Δ|_{s,1}.
<1>2. Case A: limsup_r |T_{r,n}|_{s,1} > 0 for some odd n and some s. Then
|Δ′|_{s,1} does not tend to 0, so A3 fails for J′.
<1>3. Case B: |T_{r,n}|_{s,1} → 0 for all odd n and all s. Then
|T_nT_{−n}|_{s,2} ≤ |T_n|_{s,1}|T_{−n}|_{s+1,1} → 0, and likewise in the
other order. So by A4, T_0 + z_{n,−n}/(2n) → 0 in |·|_{s,2} for n = 1 and
n = 3. Their difference is a scalar times 1, and ‖K^{-2}‖ = 1. Hence
z_1/2 = z_3/6, which forces c* = 0 (check R4).
<1>4. QED.
The brief's E4 claims A3 for *every* gate-intertwining J and c* = 12κ3 ≠ 0.
It is therefore false in every non-vacuous instance with nonzero Ward
charge. A2 is not used.

## 4. Refutation attempts

| Attempt | Outcome |
|---|---|
| C = Vec, O = 1 | All modes are scalar or zero, and E4-C gives c = c* = 0. Consistent, no refutation. |
| C = Vec, O = ℂ² (qubit chains) | In scope, and gave R-A2 (literal K fails A2). It refutes no stated theorem of the note: the note only warns. |
| Vec_G^ω, multiplicities, non-self-dual X | Nothing in E4-W/T/A/C uses F, ω, cups/caps, multiplicity-freeness or TL relations. The KS current needs only nearest-neighbour densities and disjoint-support commutativity, which is declared in CA-79's setting. Survives. |
| Non-braided C | No braiding is used. One caveat: E4-C and E4-N3 use a periodic **translation** U_N. For a periodic C-chain with nontrivial flux sectors this is declared extra data (CA-79's setting; for non-braided C it is a half-braiding / Z(C) datum). It is not a fusion consequence and should be tagged so. |
| Uniformity in N | Every constant is uniform by hypothesis (M, w, d, u/ρ). The only N-dependence the note derives is a_N = O(N⁻²) and the aliasing threshold N > |m+n|, both uniform at fixed modes. No polynomial control in the mode number is claimed, as the note says. |
| Uniformity: finite-size β_N antisymmetry | β_N(m,m) ≠ 0 at finite N (for example 2d(1) − d(2) ≠ 0). This is absorbed into E and acknowledged (<1>4). |
| Low-energy anchor removed | Without min spec K = 1, scalar identities can vanish in weighted norm. The note flags this. With the brief's K the anchor holds. |
| "c is the contact coefficient, not an input" | Only c* = 12κ3 is an output. c = 24b − 12κ1 depends on the declared zero-mode shift b. Genuine Virasoro (c = c*) needs b = (c* + 12κ1)/24, which is an input or a further equation. The note states this correctly. |

## 5. Rule 16 and Rule 17 audit

**Rule 16: clean.** No model enters any proof. The examples table is
instance-only.

**Rule 17: minor corrections.**
* E4-W, E4-T, E4-A, E4-C, E4-N1, E4-N2 and E4-N3 use no categorical data.
  Per (aq) they should be tagged **category-free**, not "L0" or "L0 plus".
* The setting is per chiral family: a single-family statement is "full,
  one chirality". The two-chiral conclusion needs the mixed hypothesis
  (E4-T <1>4).
* Rung →R2 is correct throughout. Nothing reaches R2 without VR-1 A1 and
  an instance.

## 6. Grade

**WEAKER-RESULT-PROVED.**
* *Proved:* the category-free graph-norm interfaces E4-T and E4-A,
  conditional on A2 for a suitable control, summable geometric-minus-KS
  discrepancy, and holomorphic differentiated matching with exact K
  transport. Also the cocycle classification E4-C, the formal residue
  bookkeeping E4-P, and the negative lemmas N1–N3, which the reviewer
  strengthens to R-A2 and R-N3′.
* *Claimed by the brief, not proved:* that C1+C3, a discrete Ward identity
  and summable gate errors imply A3/A4.
* *First gap:* turning the correlation-level contour identity (D2 (19))
  into the operator two-loss estimate W2. By F1, W2 is equivalent to A4 up
  to β_N, so the conjecture's entire content sits there.
* *A3 clause:* refuted by R-N3′ in every non-vacuous instance with c* ≠ 0.

Reviewer checks: `checks/review/review_checks.py`, output
`checks/review/review_output.txt` (R1–R4, all pass).
