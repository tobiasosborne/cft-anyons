# E2 — Sceptical review (parity, mixed KS brackets, chiral/full delineation)

Reviewer: Opus (round-2 proof check), 2026-10-22. Lens: AGENTS.md Rules 16, 17.
Inputs read in full: `NOTE.md` (845 lines), `checks/` (script, README, raw output),
the brief `../briefs/E2-parity-and-chirality.md`, CA-79, CA-88, CONVENTIONS (s), (v),
(af), (ak)-(aq), VR-1 (`cft_machine/research/virasoro_routes.md:50-190`), the round-1
D6 NOTE/REVIEW/INTEGRATION passages cited, and every other cited anchor (section 1).
No Julia, no latexmk, no network. Reviewer checks: `checks/review_e2_checks.py`,
output `checks/review_raw_output.txt` (numpy, float64, tolerance 1e-9).

**Headline grade: WEAKER-RESULT-PROVED.** Every Lamport step I checked is valid
under its stated hypotheses; I found no invalid step and no counterexample to any
theorem as stated. But the conjecture's part (b) is proved only under an *added*
zero-mode hypothesis (ZC, or MW, or the current–momentum identification (12)),
part (a)'s parity intertwining needs the added transport hypothesis PC, and part
(c) is proved only in the restricted form E2-C. Exact comparison in section 6.

## 1. Citation check

| Citation in NOTE | What is there | Verdict |
|---|---|---|
| `virasoro_routes.md:50-150` VR-1 A1-A4, <1>1-<1>4 | A1 isometries + exact K transport (:57-60), A2 uniform C_(n,s) (:62-65), A3 summable (:67-70), A4 two-ledger residual (:72-76); <1>3 word convergence, <2>4 arbitrary-v tail (:118-137) | ok. The mixed-word extension (E2-P <1>1 <2>2) is a correct reading: <1>3's telescoping uses only per-letter A2/A3 |
| `virasoro_routes.md:154-177` | non-conclusions (positivity, integration, c=c*) | ok |
| CA-79 `:52-81` | (79-ks) modes, Lemma 79.1 Fourier commutator `-i(z^n-z^m)` | ok; (1) of NOTE matches (79-ks) with `S_n = Tbar_(-n)` |
| CA-79 `:85-145` | Thm 79.2; line 92: "each statement applies to both chiralities and to the mixed residuals" | ok (mixed residuals are hypotheses there) |
| CA-79 `:188-201` | Thm 79.8 exact-covariance no-go | ok |
| CONVENTIONS `:695-728` (s), `:801-829` (v), `:1196-1215` (af), `:1397-1522` (ak)-(ap) | two-ledger central term; graph norms; KS tier signs; tile/KS normalization | ok |
| checks README: CONVENTIONS `:444-474` (m) | Pauli basis | ok |
| Linnea11.5 `:791-822` | `p_j=i[h_j,h_(j-1)]`, KS energy/current Fourier form | ok; sign agrees with (ap): forward tile `k_j - J_j` |
| `references/lattice-symmetry/SOURCES.md:966-1044` | GS2020 registry | ok |
| Penneys `:145-154, 219-237, 442, 682-698, 917-935, 992-1019` | dagger conjugate-linear; orthogonal sums; simple unit; anti-monoidal dual functor + tensorator; self-duality, real/pseudoreal (and :935 `c+c^vee` canonically real); unitary dual functor `f^(vee dagger)=f^(dagger vee)` | ok, all say what is claimed |
| D6 NOTE `:158-177, 709-716`; REVIEW `:71-93`; INTEGRATION `:109-139` | barred tier "only when specified", mixed residuals "when both chiralities occur"; open problem 5 (spectators); A1 chirality objection + source gap; runner-up source acquisition | ok |
| CA-82 `:48-103,107-127`; `compiler/PROOF.md:78-142`; `LOCAL_LIMIT.md:1-8,64-98` | source-modified modes, local sine H, sharp CAR refinement, local reconstruction | ok |
| `CFTFromLatticeFermions.txt:221-253, 1843-1895, 3379-3420` | Theorem A; sharp momentum RG and its spatial nonlocality (eq. 112); no-wrap modification (197)-(199) | ok |
| worklog 015 `:106-117` | UV-edge doubling, "specified chiral OAR limit, not convergence of the entire low-energy spectrum" | ok |

**No fabricated or mismatched citation.** Two *statement* (not citation)
mismatches: (M1) the abstract, NOTE:8-10, says "nearest-neighbour KS locality +
the two separate VR-1 certificates + conservation of the normalized total energy
current imply vanishing of every mixed bracket". That leaves out **equal anomaly
ledgers**, which E2-Z assumes (NOTE:295) and which comes from parity (E2-P). The
omission has already spread into `../E4-ward-to-ks-transfer/INTEGRATION.md:94-96`.
(M2) The ledger lines (NOTE:743-758) and layer table (:762-769) tag E2-P/M/Z/S/C as
"L0". Those proofs use no categorical datum (section 5 below).

## 2. Step-by-step verdicts

Notation as in the NOTE: `L_n=T_(r,n)=E_n-B_n`, `S_n=Tbar_(r,-n)=E_n+B_n`, `D=L_0-S_0=-2B_0`.

### E2-P (anomaly equality; parity transport under PC)
- <1>1 (<2>1-<2>3) common D, mixed words converge: **valid**. VR-1 <1>1 is built
  from (J,K) only; <1>3's one-factor-at-a-time telescoping is per letter.
- <1>2 reflection offset (3): **valid**. Independently re-derived:
  `P E_n P* = E_(-n)`, `P J_j P* = -J_(-j-1)`, so `P B_n P* = -z^(-n) B_(-n)` and
  `P L_n P* - Tbar_n = (z^(-n)-1) B_(-n)`. Checked numerically (all n in -3..3,
  N=5,6) on a Vec_Z3 chain with non-self-dual `X=g` (reviewer check). The bound
  `pi|n|(C^R+C^L)/N` in (s,1) is uniform in r (A2 constants).
- <1>3 ledgers agree: **valid**. Conjugation by P preserves graph norms
  (`[P,K]=0`). The replacement terms are O(1/N) in (s,2) by the product rule
  `||AB||_(s,d+e) <= ||A||_(s,d)||B||_(s+d,e)` (checked). The fixed transported coarse
  vector argument correctly avoids any assumption on `||K_r^-2||`. The (1,-1),(2,-2)
  linear system gives `Delta c* = Delta c = 0`.
  *Unstated but harmless:* `N >= 3` so the neighbour terms do not coincide (CA-79 fixes N>=4).
- <1>4 limiting P under PC: **valid**. PC gives well-definedness on the algebraic
  union; `[P_r,K_r]=0` gives isometry on every H_s; (3) passes to the limit at each s.
- Negative E2-P0: **valid** (and trivial: zero modes, K=I). The first-site excitation is
  carried to mutually orthogonal vectors, so there is no strong limit. This refutes
  only convergence of the *specified* P_r, which is what the NOTE claims.

### E2-M (mixed decay with loss four, under MW)
- <1>1 (6): **valid**. Expanding `[L_m+S_m, L_n+S_n] = 4[E_m,E_n]`, with
  `[S_m,S_n] = -(m-n)S_(m+n) - z^R_mn + F^R_(-m,-n)` (checked: `z^R_(-m,-n) = -z^R_mn`),
  gives `A_mn = (4 kappa - 2(n-m))B_(m+n) - F^L_mn - F^R_(-m,-n) - (z^L_mn - z^R_mn)`.
  The last term vanishes **only by equal ledgers**, which is assumed. Taylor bound
  `|4 kappa - 2(n-m)| <= 2 pi (m^2+n^2)/N` re-derived. Checked numerically for four
  (m,n) pairs (reviewer check) and exactly by the NOTE's script.
- <1>2 (8): **valid** (`[S_0,S_n] = n S_n + F^R_(0,-n)`, `z^R_(0,n)=0`).
- <1>3 (9),(10): **valid**. Re-derived:
  `[L_0,C_mn] = -m C_mn + V_mn`; swapping m,n and using `C_nm = C_mn - A_mn` gives (9).
  Loss-three bound term by term correct.
- <1>4 (11): **valid**. `a=|n|+1, b=n-a` satisfies `a!=b`, `a!=n`, `b!=n` for every
  integer n (checked by cases n>=0, n<0).
- <1>5 limit: **valid**. `||i_r^* v||_(r;s+4) <= ||v||_(s+4)` by VR-1 <1>1 <2>2.
- *Reviewer remark (not an error):* in the limit, MW is **equivalent** to
  `[T_0,Tbar_n]=0` for all n, because `[T_0-Tbar_0,Tbar_n]-nTbar_n = [T_0,Tbar_n]`.
  So E2-M assumes one row of the conclusion at finite stage. Its genuine content is
  the explicit finite-stage rate (5) and the upgrade from that row to all (m,n).

### E2-Z (single zero-mode commutator suffices)
- <1>1: **valid** given equal ledgers (see (M1)).
- <1>2 `C_mn = X_(m+n)`: **valid**. The cyclic sum cancels by symmetry. k=0 gives the
  off-diagonal case. The triple `(p,n-p,n)` with `p not in {0,n,n/2}` gives
  `(2p-n)(C_nn - X_2n)=0`: both other entries are off-diagonal (re-derived).
- <1>3: **valid**. Re-derived `[L_p,X_q] = pX_(p+q) + A_(p+q)`, `A_p = -pX_p` (uses
  X_0=0), so `[L_p,X_q] = -qX_(p+q)`. In the same way `[S_p,X_q] = qX_(p+q)`, using
  `[S_p,S_0] = -pS_p` with no central term.
- <1>4: **valid**. `[[L_1,S_-1],X_q] = -q(q-1)X_q + q(q+1)X_q = 2qX_q`, and
  `[L_1,S_-1] = X_0 = 0`.
- Z0 paragraph: **valid**. `[L_0,S_0] = 2a^2[sum k, Q]`, scalars drop (numerically
  checked). Also valid: (12) plus p a spectral function of U implies ZC, because
  `[p,S_0]=0` by translation invariance of S_0.

### E2-S (momentum sector implies MW)
- <1>1: **valid**. `U Tbar_n U* = z^n Tbar_n` for `U k_j U* = k_(j+1)` (re-derived).
  Block selection rule `q'-q-n in NZ`.
- <1>2: **valid**. The bound (14) follows from the product rule.
- Sufficient form (15): **valid**, given the stated `[p,K]=0`. For a centred branch
  and N>2|n|, a wrapped block has its input within |n| of a branch endpoint, and
  the output spectral projections of p commute with K.
- The NOTE's identification of the open core as (12) is correct and honest.

### E2-V (abstract counterexample to "A1-A4 alone")
- **Valid.** The Witt polynomial identity was re-derived by hand. Adjoint pairing
  holds (`A_n* = A_(-n)`). I re-ran the weighted A4 residual for p=2 numerically:
  `1.1e-2, 3.3e-3, 8.9e-4, 2.3e-4, 6.0e-5` at M=8..128, i.e. `~M^(2-2p)` as claimed.
  The mixed bracket is `[T_1,Tbar_-1]e_1 = 2e_1`. It is weak: it uses T=Tbar, so (6)
  fails. The NOTE says exactly this, so it is not over-claimed.

### E2-C (absent right stress forces absent left stress)
- <1>1-<1>3: **valid**. The scalar system gives `c_R*=0` and `c_R=24t`, which is the
  Lemma 79.1 energy-origin shift.
- <1>4: **valid**. VR-1 <1>2 <2>4 gives `||Tbar_(r,n) - t delta I||_(r;s,1) -> 0`.
  Conjugation by P (no P^2=I needed) and (3) transfer this bound to L_n.
- The NOTE's discussion of the contrapositive as a disjunction is correct.

### E2-D, E2-D0, E2-A, E2-T, (19)
- E2-D: **valid**. `P Q P* = -Q` was checked numerically. J_j is self-adjoint and
  three-site. "Breaks the specified P iff lambda Q != 0" is trivially true.
- E2-D0: **valid** (Penneys:442).
- E2-A: **valid**. (17) was re-derived: `[X,Z] = -2iY` gives
  `i[g_j,g_(j+1)] = 2(X Y Z - Z Y X)`, and the words are HS-orthogonal for N>=4.
  *Unstated hypothesis (harmless, but should be said):* `g_j -> g_(-j)` needs the
  bond-centred reflection `x -> 1-x` on the flags, which is the convention that makes
  `P k_j P* = k_(-j)` possible at all. The NOTE's script uses exactly this.
- E2-T (18): **valid**. `2a(H(lambda)-N eps)+2b = (L_0+S_0)+lambda D` exactly.
- (19): **valid** finite geometric series. At M=N/2 it is nonzero at every odd separation.

### Section 7 and E2-R
- (20) conjugate-linear: **valid** (Penneys:145, 682-698).
- E2-R <1>1-<1>4: **valid**. `(C f)^dagger C g = (g^dagger f)^vee` holds by unitary
  duality (Penneys:992-999); `mu(ab) = mu(a)mu(b)` and `mu(a^dagger) = mu(a)^dagger`
  after conjugation; `P d_j P* = d_(-j)` holds by the swap. Multiplicity is allowed
  (`g^dagger f in End(c) = C id`). No self-duality or braiding is used. Remark: this
  is a doubled theory with a swap parity. It types the reflection correctly but adds
  a mirror copy, as the NOTE states.

**Summary of section 2:** no invalid step. The only hypothesis used without
being written into a statement is equal ledgers in the abstract's sentence (M1).
The bond-centred reflection convention in E2-A is implicit.

## 3. Rule 16 / Rule 17 audit

- **Rule 16:** clean. No model enters any proof. Unit-multiplicity flags are
  category-independent. No step uses self-duality, multiplicity-freeness, braiding,
  a TL quotient, or `1+tau = tau^2`-type accidents.
- **Rule 17, data layer:** E2-P, M, Z, S, C, P0 and V use no categorical datum at all.
  They need finite Hilbert spaces, nearest-neighbour commutation of the densities,
  translation, a linear unitary P and VR-1. By (aq) and CA-88 their tag is
  **category-free ("none")**, like VR-1, not L0. E2-D and E2-A are L0 (unit object,
  direct sums), and so is E2-R (unitary spherical duality).
- **Rule 17, setting:** in (aq) a periodic chain with two families is **full**.
  "both" is acceptable only for the *delineation* corollary E2-C, which speaks about
  chiral targets from the full setting.
- **Rule 17, rung:** R2 is right for E2-P/M/Z/S, conditional on the VR-1
  certificates (VR-1 itself sits at R2 in CA-88). E2-D/A/R are finite ingredients,
  "->R0" or "finite", not R0. They build no tower.

## 4. Refutation attempts

1. **Vec (any qudit chain).** E2-P/M/Z are category-free and apply verbatim. No break.
2. **Non-self-dual X (Vec_Z3, O = 1+g, g^vee = g^2).** The swap-symmetric two-site
   C-morphisms are block diagonal in pair charge. (3), (6), Z0 and `PQP*=-Q` all hold
   exactly at N=5,6 (reviewer check). Site reversal is a *linear* unitary here, since
   reversed strings keep their total charge. No break.
3. **Vec_G with cocycle / non-braided C.** The NOTE takes P as data and never builds
   it from F. E2-R builds a linear mirror for any unitary fusion C. Whether a linear
   reflection on the *original* carrier exists for `Vec_G^omega` depends on an
   identification `C ~ C^mp`. That is correctly left as data (NOTE:657-661). No break.
4. **Brief's own parity ("site reflection composed with the pivotal/dagger
   structure").** I checked the NOTE's warning and made it sharper. For an
   *antiunitary* `Theta` with `Theta k_j Theta* = k_(-j)`,
   `Theta J_j Theta* = +J_(-j-1)`, `Theta E_n Theta* = E_n`, and
   **`Theta L_n Theta* = E_n - z^n B_n = T_n + O(|n|/N)`**. This was verified exactly
   at N=5,6 (reviewer check). So a dagger-type reflection *preserves* each chirality
   and gives no `c_L = c_R` constraint. The conjecture's (a) is false for the P the
   brief describes, and true for a linear P. This is a substantive correction to the
   brief, and the NOTE gets it right.
5. **Uniformity in N.** Every constant is a fixed A2/A4/MW constant at fixed (m,n,s).
   The bounds b, h, d go to 0 for each fixed mode, not uniformly in modes, and none is
   claimed uniformly. The rate statement (NOTE:288-290) is correctly conditional.
6. **Is ZC automatic at finite N?** No. `||[H,Q]|| = 0` for an XXZ-type density, but
   it is nonzero (3.1 at N=5, 4.7 at N=6) once a swap-symmetric chemical-potential
   term `beta(n_j+n_(j+1))` is added, although H stays integrable. Exact ZC therefore
   depends on the *density split*, not on H alone. This matches the NOTE's insistence
   that density and velocity are construction data, and it shows ZC is a genuine
   selection condition at finite N. It does not settle the graph-norm limit.
7. **Can the limiting algebra force X_0 = 0 (open problem 1)?** I tried to derive
   `X_0 = 0` from two Virasoro families with symmetric C, Jacobi and adjoint pairing.
   - The relations reduce everything to `[L_p,X_q] = pX_(p+q) + A_(p+q)`. Everything
     I checked was consistent: the ad-action of `l_m = L_m - L_0` on `{X, A}` closes
     with `[l_m,A] = 2mA + m^2 X`, and the Jacobi identities hold.
   - If ad L_0 had homogeneous components, the X_h would form the weight-0 density
     module `L_m v_k = -k v_(k+m)`. Its formal solution is a point-supported distribution
     (a "point-defect" coupling of the two chiralities). Translation invariance on the
     circle appears to obstruct the naive coboundary realisation.
   - Inconclusive: no derivation and no realisation. The NOTE's open problem 1
     stands as stated.
8. **Can the ledger hypothesis in E2-Z be dropped?** Without parity, the limit of (6)
   gives `C_mn - C_nm = delta_(m+n,0) gamma_m I`. In the special case where the mixed
   brackets are scalars, Jacobi on `[[T_p,T_q],Tbar_n]` forces `gamma = 0` (the
   2-cocycle condition). So E2-Z may hold without equal ledgers, but **I did not prove
   the general case**. For now the hypothesis must stay explicit.

## 5. Comparison with the conjecture as stated in the brief

| Brief | Proved | Gap |
|---|---|---|
| (a) modes exist | yes (VR-1 per family; mixed words, E2-P <1>1) | none |
| (a) P intertwines | only under PC (E2-P <1>4) | E2-P0 shows the specified P_r need not converge; PC is not derived |
| (a) c = cbar | **yes, without PC**, both ledgers (E2-P <1>3) | needs P *linear* (refutation attempt 4) |
| (b) `[T_m,Tbar_n] -> 0` | yes **under ZC**, or (12) alone, or MW (with the rate (5)) | redundancy of ZC under the brief's hypotheses is open (open problem 1). E2-V does not show ZC is needed in a KS realisation |
| (c) no parity-symmetric chiral limit with c != 0 | E2-C: absent right stress forces scalar left stress and zero cubic anomaly | "chiral targets REQUIRE parity-breaking densities" is not proved; the correct contrapositive is a disjunction |
| (c) general parity-breaking construction | E2-D (needs Q != 0), E2-A (enlarged carrier, always) | no "discard a Fermi edge" construction; E2-T shows a tilt does not delete a family |
| non-self-dual X | E2-R linear mirror; P as linear data | none at R0 |

## 6. Grade

**WEAKER-RESULT-PROVED.** What is proved, all category-free, periodic (full)
setting, R2 conditional on two VR-1 certificates on one system:

- (i) A linear reflection commuting with K forces `c_L=c_R` and `c*_L=c*_R`.
- (ii) Given equal ledgers, all mixed brackets vanish on D if and only if
  `[T_0,Tbar_0]=0`. The finite certificate ZC, i.e. `N^2[H,Q] -> 0` in (s,2), or the
  current–momentum identification (12), supplies this condition. MW gives the
  explicit loss-four rate.
- (iii) Under the full parity-paired standard-KS hypotheses, absent right stress
  forces absent left stress.
- (iv) Parity-odd local perturbations exist when Q != 0, and always on the enlarged
  carrier. A conjugate-dual mirror types the non-self-dual case.

What was claimed in the brief and not proved:

- (b) from the brief's hypotheses alone.
- P-intertwining without PC.
- The "requires parity-breaking densities" form of (c).
- A Fermi-edge-discard functor.

**First unverifiable step for the full conjecture:** (b) without ZC. That is NOTE
open problem 1, the zero-mode lemma. Either of two results would close it: a proof
that the complete KS + VR-1 + parity hypotheses give `||2a_N^2[H_N,Q_N]||_(s,2) -> 0`
(for instance via (12)), or a categorical KS tower with both certificates whose
limit has `[T_0,Tbar_0] != 0`.

**Required small fixes before lifting:**

- (M1): add "equal anomaly ledgers (e.g. by linear parity)" to the abstract's
  sentence. Propagate the same fix to E4 INTEGRATION (d).
- (M2): retag E2-P/M/Z/S/C as category-free / full.
- State the bond-centred reflection convention in E2-A.
