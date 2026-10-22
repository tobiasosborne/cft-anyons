# REVIEW — E1 local unital lift (round 2)

Reviewer: sceptical Opus proof-checker, 2026-10-22. Lens: AGENTS.md Rules 16 and 17.
Read in full: `NOTE.md` (301 lines), `checks/` (script, README, both outputs), the brief
`briefs/E1-local-unital-lift.md` and `_common.md`, CA-68, CA-71, CA-75 Link (b), CA-76, CA-88,
CONVENTIONS (r), (t), (x), (am), (an), (aq), D6 NOTE/REVIEW/INTEGRATION, D3 NOTE/REVIEW/INTEGRATION,
and every local source the note cites, at the cited lines. No Julia, no latexmk, no network.
Two reviewer scripts were added under `checks/` (commands at the end).

## Verdict

| Part of the brief | Grade |
|---|---|
| Conjecture E1 (i)–(iv), braided C, open chain | **PROOF-COMPLETE** (with the hypotheses as stated: unitary braiding, pointed (O,eta), the (am) degree reading of (iii), pointed equivalences in the naturality clause) |
| "Bound r" | answered: r = 0 (support exactly [2j−1,2k−1]); verified |
| "Bounded-depth circuit?" | answered for the contiguous-ancilla geometry: depth L−1 is optimal; verified |
| Converse for non-braided C | **WEAKER-RESULT-PROVED**: sufficient condition (pointed relative half-braiding on ⟨O⟩) plus finite equations; the integer obstruction (7) is proved only for the note's construction. The note says so honestly. This review strengthens it (Proposition R-1): (7) obstructs **every** one-gap lift with the E1.1 support pattern. |

Headline grade: **PROOF-COMPLETE** for Conjecture E1 as stated. The open part is the brief's
add-on question (existence or complete obstruction at L0 for arbitrary dyadic local lifts), which the
note leaves open and labels as open.

## 1. Citation check

Every locator was opened. All support the claims made, with the minor exceptions marked (m).

| Cited | Says | Verdict |
|---|---|---|
| CONVENTIONS.md:631–688 (r), :740–761 (t), :871–883 (x), :1450–1480 (am),(an) | site object, left-assoc bracketing; dyadic placement φ(j)=2j−1; WT notation; pointed pair (O,eta), grading Q_{L,n}; p_n,e_n,tau_n | match |
| Penneys :219–237, :319, :321, :325–348, :395–398 | orthogonal direct sums/splittings; unitary monoidal = †-functor ⊗; Hilb(G,ω); monoidal functors and tensorators; graphical-calculus coherence | match. (m) :325–348 defines monoidal functors only; *braided* and *unitary* monoidal functors (used in E1.2 <1>5) are not defined at any cited local line. |
| FRS hep.tex :806–819, :921–924, :1023–1125 | associativity/unit constraints and coherence; braiding defined; functoriality and tensoriality of braiding (figure block) | match. (m) the derived fact c_{Y,1}=id, used for the last identity of (H), is standard but not displayed at a cited line. |
| 1704.04221.md:298–307 | half-braiding b_{A,X}, "natural conditions", tensor rule of eq. (18) | match; the source does not spell out the axioms, which the note acknowledges by imposing them explicitly. |
| ENO .md:1221 | forgetful image of K(Z(C)) lies in the centre of K(C) | match |
| CA-68:54–92 | V_L: old j → 2j−1, cellwise id⊗iota_1; isometry; corner map; Boundary [open] | match |
| CA-71:53–123 | placements, V_φ, exact composition V_ψV_φ=V_{ψφ} | match (theorem at :102–123) |
| CA-76:90–112, :123–147, :236–251 | Prop. 76.1 (iii)–(iv); 76.3/76.4; Proposal 76.5; Question 76.12, Interface | match. (m) the *brief* calls it "Theorem 76.1"; the shard calls it Proposition 76.1. |
| D6 NOTE:262–311, REVIEW:142–170, :205–225, INTEGRATION:110–123 | P1, P2; R2 remark; R1 braided sketch; owed non-pointed check | match |
| D3 NOTE:226–260, :712–715; REVIEW:58–68, :93–101; INTEGRATION:76–84 | D3-3 local witness theorem; open problem 1 (local unital lift); limitation and (G)/(L) dichotomy; verdict | match |
| wilson_triangle.md:18–107, :109–129 | WT-1 (A1–A3), WT-2 | match |
| 2010.11121.md:126–180 (164–176) | (2.8)–(2.12); directed system (:170), projective consistency (:178) | match |
| RSWfinal3.tex:2379–2407 | Fibonacci R^{ττ}_1=e^{−4πi/5}, R^{ττ}_τ=e^{3πi/5}, F^{τττ}_τ | match; script uses exactly these |

No claim rests on an unlocated source. Citation mismatches are cosmetic.

## 2. Step-by-step verdicts

Notation as in the note. "Valid" means checked line by line against the definitions.

**§1 conventions.** Support = membership in `1⊗End(W_I)⊗1`: correct notion for D3-3 (which needs
local approximants in A(B)). Degree = `[N,a]=qa` is equivalent to the (am) grading because the
Q_{L,n} are the spectral projections of N. (H): for a braiding, unit and tensor identities are
tensoriality (FRS); the eta identity follows from naturality in the second slot and c_{Y,1}=id.
Valid (m: c_{Y,1}=id not cited).

**Lemma E1.1 (one-gap lift).**
- <1>1 valid: b unitary (composite of unitary crossings and associators); injectivity by compressing with 1⊗eta.
- <1>2 valid: b(1⊗eta)=v from the eta identity applied to the suffix.
- <1>3 valid: s≥k, disjoint factors, interchange.
- <1>4 valid: naturality of t on the arbitrary suffix morphism a_tail; no generation by one-site operators is assumed. This is the step that needs naturality on all of End(W), hence (H) on a *full* subcategory.
- <1>5 valid: tensor identity splits t_{R⊗C'}; the C'-part cancels by disjointness; the bracket lives on J O R.
- <1>6 valid. Hypotheses used: (H) only. No self-duality, multiplicity-freeness, ribbon, TL quotient.

**Theorem E1.2 (dyadic lift).**
- <1>1 valid: before step i, old_i sits at 2i−1 (I recomputed the position bookkeeping); composite of b's equals B_L of (2).
- <1>2 valid: composite of one-gap insertions is the dyadic V_L by CA-71 composition with φ(j)=2j−1 (CONVENTIONS (t)).
- <1>3 valid: tracking the current interval through i<j (shift), j≤i<k (right endpoint +1), i≥k (fixed) gives [2j−1,2k−1]; uniform in L, n and C; r=0 in the brief's convention. Singleton formula alpha(f^(j))=f^(2j−1) valid.
- <1>4 valid: naturality transports p_e on old strands; the eta identity plus unitarity transports p0 (hence p1) on new strands; N_{2L}B_L=B_L(N_L⊗1+1⊗N_L) gives exact degree preservation.
- <1>5 valid with the hypothesis made explicit in the note: F unitary braided strong monoidal and u:F(O)→O' carrying F(eta) to eta'. The final sentence (compatibility with composition of equivalences and with monoidal natural isomorphisms) is asserted, not proved; it is routine (a pointed unitary U on O' commutes through alpha' by naturality and U eta=eta) and is not used downstream. Valid for the stated square.
- <1>6 valid: composites define a coherent directed system of unital injective *-maps = WT-1 A1 (2010.11121:170).
- "Absolute number" remark valid: ||N_{2L}−alpha(N_L)|| = L for X≠0.

**Corollary E1.3.** <1>1 valid: exact instance of CA-76 Prop. 76.1(iv) with W_n=V_n. <1>2 valid (p_n=0 endpoint).
<1>3 valid and correctly conditional: A3 needs summable bounds.

**Proposition E1.4.** <1>1–<1>3 valid (e_{2M}=V_Me_M, f_{2M}=V_Mf_M; pullback through alpha by intertwining
and V†V=1). <1>4 valid: tau_n equals the occupied state, e_n=2, drift exactly 2 on 2p0^(1)−1. This is a
correct but elementary negative: it shows A3 is not implied by p_n=1. The R1 instance is the trivial vacuum product state.

**Theorem E1.5 (non-braided sufficient condition).** <1>1–<1>3 valid: every W_M and every endomorphism lies in the
full D=⟨O⟩, so (H) on D is all E1.1–E1.4 use. The Vec_G example (O=1⊕g, g noncentral) is valid: ⟨g⟩ is cyclic,
untwisted, symmetric; [O][h]−[h][O]=[gh]−[hg]≠0 forbids an ambient Z(C) lift. The non-central-point Vec_{Z2}
example is valid; reproduced numerically (D h D = −h, alpha(h)V = −Vh).

**Proposition E1.6 (finite equations).** <1>1 valid (necessity; Δ≠0 forbids O⊗s_i≅s_i⊗O). <1>2 valid: basis
independence by unitary mixing of multiplicity bases; naturality by Schur; tensor identity on simples by summing (6)
against f†, extended by naturality. Associators "understood on both sides" is acceptable given Penneys :395–398.

**Boundary of the converse.** Correct as stated: E1.6 concerns the construction, not all lifts. See R-1 below,
which upgrades (7) for the one-gap class.

**Theorem E1.7 (circuits).**
- <1>1–<1>2 valid. I simulated the schedule for L≤13: every layer uses disjoint adjacent (old_j,new_i) pairs with
  j = L+i−t, each pair i<j crosses exactly once, the final word is interleaved, L(L−1)/2 gates. Identification with the
  sequential B_L needs that all reduced words of this permutation are commutation-equivalent; this holds because a shuffle
  of two increasing sequences is 321-avoiding (no three strands pairwise cross), so no braid move (hence no
  Yang–Baxter, which a half-braiding need not supply among old strands) is ever needed. The note's "order of crossings on
  each strand is preserved" is a terse form of this. Valid with that unstated combinatorial lemma.
- <1>3 valid (light-cone growth w−1 per layer, by interchange).
- <1>4 valid: p0 at a site outside an interval is not in that interval algebra (compression with eta vs. an isometric
  simple summand of X gives the same scalar for interval operators, 1 vs 0 for p0). Needs X≠0, as stated.
- Scope: the lower bound concerns implementations of this alpha from the contiguous input a⊗1_{W_L}; the note does not
  overclaim. Answer to the brief: no bounded-depth implementation in that geometry; alpha itself has zero support growth.

**D3 dressing corollary.** Valid; r=2D(w−1); grading only if [U,N]=0, as stated.

**Uniformity.** All support constants are exact and independent of L, n, C; no epsilon occurs. The drift bound is
CA-76's, with no new constant. No hidden N-dependence.

**Rule 16.** The general proofs use only: unitary fusion structure, the pointed splitting, and the crossing family with (H).
No self-duality, multiplicity-freeness, ribbon/twist, TL quotient or Fibonacci identity. The Fibonacci script is
calibration only, and its RED/GREEN pair is genuinely discriminating (I re-read the script: the embedding `two` uses F only;
the crossing uses sourced R).

**Rule 17 tags.** Substantively right; two nomenclature fixes for CONVENTIONS (aq):
(a) the setting is `any` (the statements involve no target), with "open chain" a microscopic declaration; "open; either
future target" is not an (aq) value, and CA-88 Def. 88.1 couples open chains to S_ch, so the tag should be `any` + open
geometry, with the periodic version (needed for S_full and LC-4/E4) flagged open (the note's open problem 5).
(b) the rung is `R0^u` (local unital tower), not bare `R0`. Data layer: E1.2 is L1, but E1.5 shows the minimal data is
"L0 + a declared pointed relative half-braiding of (O,eta) on ⟨O⟩" — the most general layer, which the note states.
E1.4's R1 is genuine but trivial (vacuum product state).

## 3. Refutation attempts (all failed unless stated)

Script `checks/review_pointed_lift.py` (numpy; matrices ≤ 729×729; coarse L≤4 only for 2-letter alphabets).
Independent engine: skeletal Vec_{Z_n}^ω, left-associated chain basis, interval embedding by associator phases,
pentagon and embedding coherence asserted. Generic Gaussian morphisms are used for the linear support claim
(a subspace containing a generic element of a space contains the space, with probability one).

1. **Non-self-dual X** (Vec_{Z3}, bicharacter braiding, O=1⊕g): hom, unital, dagger, aV=Va, support [2j−1,2k−1],
   exact degree, L=2,3: PASS. Discrimination: the g–g crossing phase is invisible on the 2-letter chain for L≤3
   (it cancels between same-grade words of length ≤2); at L=4 exactly the three cube roots pass. **Gotcha for future
   checks:** pointed instances need a block of n old sites (Z_n) before the braid phase is tested.
2. **Multiplicity + nontrivial associator** (semion ω, R=i⊗label flip, O=1⊕2g): all properties PASS at L=2,3;
   the phase-free crossing FAILS the support claim (RED). Labels must travel with strands.
3. **Unit summand inside X** (O=1⊕1'⊕g, semion): PASS at L=3 (the (am) clause "X may contain units" is harmless).
4. **Non-braided C** (Vec_{Z3}^ω, ω nontrivial): no braiding on the 27th-root grid (0 families pass both naturalities;
   control Vec_{Z3} passes); pointed half-braidings of O=1⊕g exist (exactly three, matching the half-braidings of g on
   the full Z3 alphabet). E1.5 crossing: all properties PASS at L=4. O=1⊕g⊕g² (X = g ⊕ ḡ) with a relative half-braiding:
   PASS at L=3; mutated phase FAILS. So E1.5 genuinely reaches beyond L1, in a twisted category.
5. **Non-central point** (note's Vec_{Z2} example): reproduced alpha(h)V = −Vh.
6. **Vec_G, O=1⊕g⊕h, gh≠hg (G=S3)**: E1.5 is unavailable (Δ≠0 on ⟨O⟩=S3). This is the sharp test case for the
   note's open problem 1. See R-1: every one-gap lift of the E1.1 pattern is excluded here.
7. **Uniformity in N**: no constant depends on L; the only L-growth is in E1.7 depth, which is intrinsic (light cone).
8. **Vec**: C=Vec, O=C^d: alpha is the tensor shuffle (c = flip), support exact. X=0: alpha = id. No failure.

No counterexample to any proved statement was found.

## 4. Reviewer Proposition R-1 (derived here; L0; any; ->R0^u negative)

**ASSUME** C unitary fusion, (O,eta) pointed, M≥2, 1≤s≤M−1, J=W_s, R=W_{M−s}, and a unital *-hom
β: A_M→A_{M+1} with β(a)v_{M,s}=v_{M,s}a, mapping A_[j,k]→A_[j,k] for k≤s and A_[j,k]→A_[j+1,k+1] for j>s
(the E1.1 pattern; straddling intervals unconstrained). **PROVE** dim Hom(c,O⊗x)=dim Hom(c,x⊗O) for all simple c
and every simple x that is a summand of both J and R.
<1>1. For a∈End(J): β(a⊗1_R)=a⊗1_O⊗1_R; for b∈End(R): β(1_J⊗b)=1_J⊗1_O⊗b. BY the support pattern
(β(a⊗1)=a''⊗1_{O⊗R}) and intertwining: v(a''⊗1_R)=v(a⊗1_R), v isometric.
<1>2. Hence β|_S(a⊗b)=a⊗1_O⊗b on S=End(J)⊗End(R) ⊂ End(J⊗R). Its blocks (i,j) occur in block c of End(J⊗R)
with multiplicity N_{ij}^c and in block c' of End(J⊗O⊗R) with multiplicity T_{ij}^{c'}=dim Hom(c',s_i⊗O⊗s_j).
BY Hom(c,J⊗R)=⊕Hom(s_i,J)⊗Hom(s_j,R)⊗Hom(c,s_i⊗s_j).
<1>3. If Λ is β's inclusion matrix, restriction to S gives Σ_c N_{ij}^c Λ_{cc'}=T_{ij}^{c'}. BY uniqueness of
decomposition of finite-dimensional C*-representations.
<1>4. i=1 (1⊂J since 1⊂O): Λ_{xc'}=dim Hom(c',O⊗x). j=1: Λ_{xc'}=dim Hom(c',x⊗O). QED.

So E1.6's integer obstruction (7) is a **no-go for every one-gap local lift** of the E1.1 pattern, not only for the
half-braiding construction, once every simple of ⟨O⟩ occurs in both W_s and W_{M−s} (true for s, M−s large).
Instance: Vec_{S3}, O=1⊕g⊕h, already at M=2, s=1 (`checks/review_one_gap_obstruction.py`). It does **not** decide
dyadic lifts with slack r or a different internal placement: there the left/right images are only lifts, not
identities, and the Bratteli bookkeeping involves their unknown inclusion matrices. That is the sharp remaining
question (INTEGRATION (e)).

## 5. Required corrections before lifting (none blocks the grade)

1. Retag per (aq): setting `any` + open-chain declaration; rung `R0^u`.
2. Cite a local definition of braided (unitary) monoidal functor or record the gap (Law 1); cite c_{Y,1}=id.
3. State the 321-avoiding / commutation-class lemma in E1.7 <1>2.
4. Record that the R1 instance of E1.4 is the trivial vacuum product state.
5. Add R-1 to the converse discussion: the integer obstruction is necessary for all one-gap pattern lifts.

## Reproducibility (reviewer additions)

```bash
OPENBLAS_NUM_THREADS=1 python3 -I explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/review_pointed_lift.py > explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/review_pointed_lift_output.txt 2>&1   # ~4 min
python3 -I explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/review_one_gap_obstruction.py > explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/review_one_gap_obstruction_output.txt
```
Python 3.12.3, NumPy 1.26.4; tolerance 1e-10 absolute; Float64 calibration only, not proof.

SHA256 at execution: `review_pointed_lift.py` 6c9e725edb725f20a8a16dbabfcc31a893174ccb7ca0dab2d7bafe449da7fded;
`review_one_gap_obstruction.py` a67f5833e14270eab041e3fbe7df9252ee4fd0e082e21860b85629ef11cf653f;
outputs b302ba3197d3cfb3634541224bd242fe2235b91589e727762b924daca27b80a0 and
af4733e708616680c6993b55ca60869a5135cf9d2e4c29fd8fd7f16a35e3e380. Both exit 0. The "not braided"
statement for Vec_{Z3}^ω is a finite-grid search (27th roots), not a proof.
