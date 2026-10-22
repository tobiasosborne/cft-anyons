# E5 review — Two-sided fidelity through normal expectations

Reviewer: sceptical proof-checker (Opus), 2026-10-22. Lens: AGENTS.md Rules 16 and 17.
Object: `NOTE.md` (sha256 `ace9e0cc…c1ec4c`, matching `checks/provenance.json`) and
`checks/`. Brief: `../briefs/E5-two-sided-fidelity.md`. No file outside this directory
was edited. No Julia and no latexmk were run. Independent checks are in `checks/review_check.py`,
with output in `checks/review_raw_output.txt`. The author's `check_expectations.py` was re-run
and reproduces `raw_output.txt`.

**Headline grade: PROOF-COMPLETE**, for Theorem E5-F *as the note states it*. The note's
statement replaces the brief's bare bound `liminf PP(N_k⊂M_k)<=Dim C` with three precise inputs:
a bound on the costs of the **selected** finite expectations, a **common normal state** (L)
or the normal-extension criterion (N), and **bounded exhaustion** of both N and M. Every step
is valid under those hypotheses. Three qualifications, none of which is a gap:

- (Q1) The brief's literal variant, with the *minimal* finite constants and no selection
  certificate (O), is **not proved**. The note does not claim it (ledger, last line).
- (Q2) The proof needs less data than its tags say. L2 is a consequence, not a hypothesis, and
  dimension preservation is automatic (§4). This is a Rule-17 improvement, not an error.
- (Q3) The brief's full-theory corollary ("the diagonal theory has symmetry category Z(C)")
  is false if it is read as DHR of the LR extension. The note's correction is verified (§2, D).

## 1. Citation check

Every local anchor was opened at the cited path:line.

| Citation | Claimed content | Verdict |
|---|---|---|
| KLM:430–443 | PP inequality, `[M:N]_E=λ^{-1}`, minimal index | ✓ |
| KLM:507–556 | Prop. p3. The increasing case goes "after taking commutants" (:530–531) | ✓. Note: the decreasing case (b) uses *weak limit points* and does not need normality |
| KLM:688–719 | complete rationality (a)–(d); μ_A; transportable sectors | ✓ |
| KLM:782–792 | modular PCT, "automatic if A is conformal" (:792) | ✓ |
| KLM:1719–1729 | Thm c21: μ_A=Σd(ρ_i)², under complete rationality **and modular PCT** | ✓ |
| KLM:1899–1900 | every sector is a direct sum of finite-dimensional sectors | ✓ |
| KLM:969–972, 1518–1559 | type-I corollary; Lemma l17; Cor. c18 (sectors of A⊗A^o are ρ_i⊗ρ_j^o) | ✓. c18 is about KLM's 1D net A⊗A^o (time-zero picture), not a 2D light-ray product. See D below |
| KLM:1086–1098 | LR net, canonical endomorphism ⊕ρ_i⊗ρ_i^o, time-zero fields, no spectrum condition | ✓ |
| KLM:1089–1092 | ε^o = j(ε)^*, two braidings ε^± | ✓ |
| KLM:1578–1587 | Lemma p18: braiding nondegenerate ⟺ LR net has no nontrivial bounded-localized finite-index endomorphism | ✓ |
| KLM:1861–1879 | Cor. c23: μ_B=1, braiding nondegenerate | ✓ |
| KLM:2758–2770 | "same bounded-cluster method" | **loose**. This is a lemma on σ-weak continuity on a unit ball (cluster point t, then t=0). It is similar in technique only. The note itself says "precedent", so it is harmless |
| B:604–621 | conjugate equations, normalized/standard solutions, d=FP dimension | ✓ |
| B:620–645 | spherical structure from standard solutions; premodular; C^rev | ✓. "Twists" are not named explicitly; "ribbon fusion category" (:642) is the anchor |
| B:643–645, :660–664 | ε^-(ρ,σ)=ε(σ,ρ)^*; Z(C)≃C⊠C^rev iff modular | ✓ |
| B:1150–1154 | finite statistical dimension, finite direct sums, semisimple | ✓ |
| B:3323–3337 | B–B sectors = defects of B_2 ⊃ A⊗Ā; A⊗Ā on R×R light rays | ✓ |
| FRS:641–646 | bimodules ↔ defect lines; A itself trivial defect | ✓ |
| FRS:8238–8241 | A=1 ↔ charge-conjugation invariant | ✓ |
| ZW:1133–1135 | bounded (Kaplansky) density in a scaling-limit argument | ✓ (precedent only) |
| SOURCES.md anchors | KLM, Bischoff, FRS registrations | ✓ |
| CA80:153–159, 168–212, 184–185, 206–212 | Prop. 80.8; Thm 80.9; gap; Lemma 80.10 | ✓ |
| D5 NOTE:346–515, 525–577; REVIEW:70–80, 144–178; INTEGRATION:111–134 | D5-D…D5-V; D5-M; KLM mismatch; D5-F/D5-A verdicts; headline/first lemma | ✓ |
| CONVENTIONS:773–792, 1431–1448 | (u) fidelity/Lamport; (al) annular index | ✓ |

Mismatches: only the loose KLM:2758–2770 "same method" attribution. The second item is a
minor imprecision. Line 358 writes `mu_A=q(N⊂M)` with q defined as an infimum over **normal**
expectations, while KLM's minimal index is an infimum over all expectations. Only
`mu_A<=K(E)` is used, and it holds either way. For this irreducible finite-index factor inclusion
the two infima coincide anyway, because the expectation is unique.

## 2. Step-by-step verdicts

### E5-G (positive-graph passage)

<1>1 valid. <1>2 valid. Bounded sequences, scalar factors converging, closed uw positive cone.
<1>3 valid. **G valid.**

### E5-L (construction of the normal limit)

- <1>1.<2>1 valid. It uses only that the N_k increase; increasing M_k is not used.
- <2>2 valid. Bounded strong convergence implies uw convergence on bounded sets. Along a subnet
  of the sequence, eventually k≥r.
- <2>3 valid. The s* approximation of n gives `n_k^*→n^*` strongly.
- <1>2 valid.
- <1>3 valid. Products of bounded s*-convergent sequences converge s*. Matrix amplification is
  of fixed size. The positive cone of M_n(N) is closed entrywise in uw.
- <1>4 valid. This is the standard "positive map preserving a faithful normal state is normal"
  argument.
- <1>5 valid.
- <1>6 valid. Uniqueness does not even need F to be normal.
- <1>7 valid. <1>2 holds verbatim along a cofinal subsequence.
- <1>8 valid; it needs b<∞.
- *Implicit but harmless hypotheses:* `N_k⊂N`, `M_k⊂M`, and "bounded" meaning `sup_k‖x_k‖<∞`
  per x. Both are clear from "represented inside".

**L valid.** No constant depends on k beyond the liminf. There is no uniformity issue: the
approximant norm bounds may depend on x.

### E5-J

<1>1–<1>4 valid. The transfer of bounded s* exhaustion to π_ψ is valid because a normal
*-isomorphism is σ-strong* continuous, and on bounded sets σ-strong* equals strong*.
Ω is cyclic for M' by the separating argument. **J valid.** Jones convergence is a consequence
of L, not a hypothesis. That is correctly stated.

### E5-N

- <1>1 valid.
- <1>2 valid. ψ|N=φ by normality and density of N_0. ψ∘E_k=ψ follows from compatibility.
- <1>3 valid. Restriction monotonicity gives K(E_k)↑ and K(E)≥sup. L gives ≤.
- **Unstated hypothesis (minor):** "Fix any faithful normal state φ on N" presupposes that N is
  σ-finite. This is automatic on a separable Hilbert space, which is the setting of F.

**N valid**, and it is an exact iff for extending compatible maps.

### E5-X1 (verified independently)

- D_0 and D_1 are disjoint and each is dense in cylinders.
- The stage expectation is a state (t_w,1−t_w) on each cell, so q_k=2 (`review_check.py`, X1).
- The diagonal N_k separate any two atoms eventually, including atoms in different copies.
  Hence `N=M=ℓ^∞(D_0⊔D_1)`, with bounded pointwise, hence s*, convergence.
- E_0(P_0)=1/2≠P_0. In fact *no* expectation M→N=M extends E_0, normal or not.
- The witness (0,f_k)↓0 has E_k-images ↓p_d/2.

**X1 valid.** It is correctly labelled as not an index counterexample, since the limit has q=1≤2.

### E5-X2

Verified: q(C1⊂M_m)=m via λ_min(ρ)≤1/m (`review_check.py`, X2). **Valid**, but weak: it drops
exhaustion of the ambient M. The brief's own convergence notion already includes "approximants
converge to the actual inclusion". So X2 refutes a hypothesis the brief did not really propose.
The brief also asked for "a counterexample showing a weaker hypothesis fails". For the **index
inequality** itself with full exhaustion, no such counterexample is given. X1 refutes only the
extension of the maps. This request of the brief is only partly met (see §3, attempt 5).

### E5-F (headline)

- <1>1 valid. `mu_A<=K(E)<=liminf K(E_k)<=D`.
- <1>2 valid. The note's hypothesis "completely rational conformal net" supplies (F1) of
  Theorem 80.9: modular PCT by KLM:792, and the remaining items by KLM's definition. Twist
  preservation is derived correctly: a unitary tensor functor maps a standard solution to a
  normalized solution of the same norm, and equal dimension makes it standard by B:617–622.
  The internal counting argument of 80.9 is the one the D5 reviewer accepted (D5 REVIEW:144–150).
- <1>3 valid; it is only a scope remark.
- **F valid** under its stated hypotheses.

### E5-D (full corollary)

- <1>1–<1>3 valid. One caveat: KLM c18 classifies the sectors of KLM's **1D** net A⊗A^o.
  The note's "doubled chiral subnet" must be read as that net (the time-zero picture), or the
  standard 2D product statement must be sourced separately. A one-line clarification fixes this.
- <1>4–<1>5 valid. The double-cone/time-zero cofinality argument is correct.
- <1>6 valid. **D valid**, and the negative claim is verified against KLM p18/c23.
- *Rule-17 remark:* this is consistent with CA-88 Def. 88.1 (S_full: defects plus bulk
  Z(C)≃C⊠C̄). D sharpens that definition; it does not conflict with it.

### E5-EP / E5-AN / E5-ALL

These are conditional lemmas. Their proofs are routine passages to the limit of assumed
identities, and the steps are valid.

- EP item 3, the "fullness certificate", is close to a restatement of fullness. That is the same
  pattern as D5-A (D5 REVIEW:167–171). It is honest about it, but the lemma does not reduce
  the obligation.
- AN's "N_k⊂N, M_k⊂A(E')'" asks the lattice algebras to sit *literally* inside the continuum
  algebras. In a Wilson-triangle/OAR limit this has to be supplied by the inductive-limit
  embedding. It is an extra obligation, not a free reading.

## 3. Refutation attempts

1. **C = Vec.** D=1, so F gives μ_A=1, a holomorphic net. This is consistent. (The trivial net
   satisfies it vacuously; that is the D5 REVIEW §4 degeneracy and does not affect F.)
2. **Vec_G^ω, non-self-dual objects, multiplicities.** No step uses self-duality,
   multiplicity-freeness or a particular F/R gauge. The counting uses only Σd_i². EP handles
   general Hom bases. No leak.
3. **Non-braided C (L0).** F as written needs a braided Φ. However, the proof runs at L0 (§4),
   and for non-braidable C (e.g. Haagerup) hypothesis (i) is unsatisfiable, so the statement is
   vacuous there. No contradiction.
4. **Is L vacuous for genuine subfactors?** No. Take R⊗1⊂R⊗M_n with
   `N_k=M_{2^k}⊗1⊂M_{2^k}⊗M_n`, E_k=id⊗tr, and ψ the trace. These maps are compatible and
   trace-preserving. Their stage cost is n·min(2^k,n), which increases to n²=[R⊗M_n:R⊗1]
   (`review_check.py`, calibration). So the bound is sharp and attained.

   For the type III_1 four-interval inclusion, existence of such approximants is open. Because
   the limit expectation is unique, the finite costs must converge to exactly μ_A. That is a
   sharp lattice demand (Open problem 2).
5. **Breaking index semicontinuity with full exhaustion but no state (the brief's literal
   form).**
   - *Abelian:* no counterexample is possible. If each P_k-block is a union of at most 2
     Q_k-cells and the Q_k separate points, a limit block with 3 points would eventually need 3
     Q_k-cells. Hence q≤2 (illustrated in `review_check.py`).
   - *Non-commutative:* finite-stage cost depends on the size of N_k (`review_check.py`: C⊂M_n
     has cost n, while 1⊗M_n⊂M_n⊗M_n has cost n²). In the examples tried, cost **increases**
     towards the limit, which is the safe direction. No counterexample was found. **Failed
     attempt; the question remains open,** as the note says (Open problem 6).
6. **Uniformity in N/ε.** None is hidden. K(E_k) enters only through liminf, and the approximant
   bounds are per element.
7. **Vacuum.** The common state cannot be the vacuum (Lemma 80.10), and the note says so. No
   step silently uses the vacuum.

## 4. Rule 16 / Rule 17 audit

- **Rule 16:** clean. No model-specific identity is used. The examples table is generic, and the
  checks are toy operator algebras.
- **Rule 17, tags as stated:**
  - G/L/J/N/X: any, category-free. ✓
  - F: ch, L2+L4, R4-braided. Correct but **not maximal**:
    - (a) "Dimension-preserving" is redundant. A fully faithful unitary tensor functor maps the
      fusion ring of C isomorphically onto a fusion subcategory, and statistical dimension is the
      FP dimension (B:624–626). So d(Φ(i))=FPdim(i)=d_i automatically.
    - (b) The counting argument needs no braiding. At **L0+L4**, a fully faithful unitary tensor
      functor plus the L/N certificate gives a tensor equivalence C≃DHR_fin(A) and μ_A=Dim C.
    - (c) At **L1+L4** with Φ braided, the result is a braided equivalence. Modularity of C is then
      a **conclusion** (KLM c23), not a hypothesis.
  - D: full, L2+L4. ✓ (here modularity is needed for Z(C)≃C⊠C^rev).
  - EP/AN/ALL: ch, →R4 given R3. ✓

## 5. Grade

**PROOF-COMPLETE** for E5-F with the hypotheses the note states, together with lemmas
G/L/J/N, counterexamples X1/X2 and corollary D, all verified. What is *not* established:

- the minimal-constant form of the brief's (ii) without a selection certificate (O);
- any counterexample showing that the index inequality fails under full exhaustion without a
  normal state;
- non-vacuity for conformal-net inclusions.

The note claims none of these.
