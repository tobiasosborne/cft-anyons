# REVIEW: D5 fidelity and lattice sewing (sceptical reconciliation)

Reviewer: Opus reconciler, 2026-10-22. Scope: `NOTE.md` (778 lines) and `checks/`.
Lens: AGENTS.md Rule 16 (`AGENTS.md:231-236`) and the paragraph "Models are examples, never the
subject" (`AGENTS.md:78-94`). I did not edit anything outside this directory and did not commit.
I added one reviewer check: `checks/review_pp_constant.py`, with its output in
`checks/review_pp_constant_output.txt`.

Reproduction. `PYTHONDONTWRITEBYTECODE=1 python3 .../checks/check_cells.py` reproduces
`checks/raw_output.txt`: 6 GREEN groups and 5 mutations rejected. The SHA256 of `NOTE.md` and of
`check_cells.py` both match `checks/provenance.json`.

## 1. Verdict in one paragraph

The finite lattice-cell results (D5-S/P/R/G/W) are correct and general. They are also modest:
mostly standard transfer-matrix and tensor-network facts, and two of them restate results already
in the repository. The fidelity part is the real contribution. It has two pieces:

- the scalar falsifier D_a = d_a·1 (D5-D);
- the two-sided certificate D5-F: a fully faithful endpoint functor gives the lower bound, and an
  annular index bound gives the upper bound.

D5-F is sound when its hypothesis F3 is read as a statement about factors, or about a normal
expectation on the actual M. In the finite-dimensional form that the note advertises
(NOTE.md:422-423), the cited KLM monotonicity does **not** apply. Step <1>1 is overstated as
written (§3). The headline D5-C is correctly labelled as a conjecture. As stated, though, it is the
open UMTC reconstruction problem plus a lattice/OAR layer. It is not an attackable target, and it
nearly duplicates D6-C. Rule 16 is respected throughout the body.

## 2. Citation audit

Every citation listed below was opened and read.

**Matches (the source says what the note claims):**

| Citation | What the note uses it for |
|---|---|
| `KawahigashiLongoMuger1999/source.tex:430-443` | PP definition of index, for general von Neumann algebras |
| KLM `:688-702` | Definition of complete rationality, including Haag duality (a); for conformal nets (a)⇔(b) at `:699-701` |
| KLM `:782-792` | Modular PCT |
| KLM `:1719-1729` | Theorem c21, μ = Σ d(ρ_i)^2 |
| KLM `:1899-1900` | Every sector is a direct sum of finite sectors |
| `Bischoff2018/source.tex:364-392` | Reconstruction problem and non-uniqueness |
| Bischoff2018 `:660-664` | Z(C) ≅ C⊠C^rev iff modular |
| `EvansGannon2018/source.tex:334` | c fixed only mod 8 |
| EvansGannon2018 `:338-347` | Local modules |
| EvansGannon2018 `:473-480` | T carries e^{-2πic/24} |
| `MignardSchauenburg2017/.../paper.tex:121-130,175-179` | |
| FRS `hep.tex:487-502` | Modular invariants that are not CFTs |
| FRS `hep.tex:6443-6455` | |
| FRS `hep.tex:8033-8046` | NIM-rep conditions |
| FRS `hep.tex:8237-8253` | Charge-conjugation convention; m(a) = Z_{aā} |
| AFM-F `:85-88,175-183` | Self-duality, multiplicity-free, FS = +1 simplifications |
| AFM-D `:163-212` | Commutation with transfer matrix; non-unitarity; D_A D_B = Σ N D_C |
| AFM-J `:108-128` | "the fusion categories of the lattice model and the CFT typically are not the same" |
| AFM-J `:708-711` | |
| `literature/md/2305.14068/2305.14068.md:507-518` | Rep(Tube) ≃ Z |
| `PenneysUnitaryFusionCategories.md:1012-1019` | |
| `reconstruction/02_obstructions.md:215-224` | Prop. 5: a finite-matrix scalar defect is a coboundary (note cites 210-224) |
| `04_cutoff_oar.md:28-44` | LC-4 has h = -G'(0) and δ(J) = -Dq+r, q-h = Du+s; with LC-4's h equal to the note's e, P2 is consistent |
| `12_fibonacci_four_port.md:169-203` | |
| `13_semion_multiplicity.md:65-115,140-153` | |
| `reviews/.../PLAN.md:244-247` | |
| `HollandsAnyonicChainsAlphaInduction.txt:4399-4402` | |
| `BrehmRunkel2024/source/main.tex:728-744,799-809` | |
| CA-86 at commit 1f402aa, lines 61-110 | Lemma 86.1, Cor. 86.2 |

**Mismatches and caveats:**

1. **KLM:507-556 (monotone exhaustion), as used in D5-F <1>1 (NOTE.md:429-431).**
   - KLM Proposition p3 is proved in the *decreasing* case (b) by weak limit points of
     expectations.
   - The *increasing* case (a), which D5-F needs, "will follow after taking commutants"
     (KLM source.tex:530-531). That step uses [M_i:N_i] = [N_i':M_i'].
   - This identity holds for infinite factors. It fails for the Pimsner–Popa constant of
     finite-dimensional (type I) inclusions. Reviewer check: for C ⊂ M_n the PP index is n, but
     the commutant inclusion 1⊗M_n ⊂ M_n⊗M_n has PP index n^2
     (`checks/review_pp_constant_output.txt`).
   - So the citation does not support the finite-dimensional F3 that NOTE.md:422-423 proposes as
     the checkable version. See §3, D5-F.
2. **CONVENTIONS range.** NOTE.md:68 says the note was read against (a)-(ai). It cites
   `CONVENTIONS.md:1072-1370`, but (aj) starts at :1359 and (ak) at :1397.
   - (ak), the spacetime tile dictionary that governs CA-86, defines `e_j = b_j d_j`, the cup-cap
     tile (CONVENTIONS.md:1403).
   - P2 (NOTE.md:76-78) reuses e_j for the energy density. It flags the clash with (af)'s scalar
     e_n but not the clash with (ak)'s e_j.
   - Result: e_j now has three meanings. The note must rename its density, for example to ε_j or
     k_j (D2 uses k_j).
3. **CA-86 pin.** The note reads CA-86 at commit 1f402aa. Merged main
   `report/sections/86_spacetime_trotter_dictionary.tex` differs only in convention tags:
   (ac)→(ak) at lines 21, 61 and 154. The content of lines 61-110 is identical.
   - The pinned snapshot's "(ac)" points at the wrong convention entry on main, where (ac) is
     "Fresh sewing programme".
   - Integration should cite main CA-86:80-128, as CA-75 does.
4. **SC:6664-6666** is the PBW basis theorem for U(g). It is not a Verma-module spanning or
   character bound. The bound in D5-H follows from it by the standard corollary, which the note
   does not spell out. Minor; LC-12 uses the same anchor.
5. **ZW:1129-1135** is Kaplansky density inside a scaling-limit argument. It is cited as precedent
   for "bounded density" in D5-A <1>1. That is acceptable, but the operative fact is Kaplansky's
   theorem, which is not locally sourced as such. Minor.
6. **Duplications** that are cited but presented as new "proven" results:
   - D5-S <1>4 restates LC-9 Lemma FP-D (`reconstruction/09_four_port_equations.md:102-123`,
     U = F^{-T}).
   - D5-W's continuity identity restates CONVENTIONS (af) (`CONVENTIONS.md:1203`) and LC-4 (`reconstruction/04_cutoff_oar.md:39`).
   - D5-H strengthens LC-12 §5 rather than being new: LC-12's bound Σ1/k^2 < 2 gives
     c > 12/π^2; D5-H's π^2/6 is sharp and gives c > 1.
7. **Not cited:** CA-82 (`report/sections/82_ising_modular_compiler.tex:25-26,113-120`) already
   imports KLM sector completeness, for one instance via a classified net. D5-F is the general
   mechanism that CA-82 bypasses. Not a contradiction.

## 3. Ledger grades

| Ledger line (NOTE.md) | Grade | Reason |
|---|---|---|
| D5-C :643 | **unverifiable** (label "conjectural" is correct) | See §4 and headline verdict. |
| P1–P7 / E1–E7 :644 | **conditional-ok** | Sound proposals. Fix the e_j clash with CONVENTIONS (ak) (§2.2). E1–E7 is a good declared-data list. |
| D5-S :645 | **confirmed** | See notes (a)–(b) below. |
| D5-P :646 | **confirmed** | See notes (c)–(d) below. |
| D5-R :647 | **confirmed** | See note (e) below. |
| D5-G :648 | **confirmed** | Witness checked: det = -(a-b)^2/2, and -1/8 at (1, 1/2). |
| D5-W :649 | **confirmed** (finite identities) | Duhamel formula and product rule are correct. Assumes nearest-neighbour density; range r needs the obvious extension. Conformality is correctly left conditional. |
| D5-D :650 | **conditional-ok** | Telescoping and product convergence are correct. The scalar falsifier D_a = d_a·1 is a correct algebraic refutation of fusion-operator-only fidelity, and fully general. The body labels it "[proven ...]" (NOTE.md:346); the ledger correctly says conditional. |
| D5-F :651 | **overstated** as "conditional proven" | See the D5-F paragraph below. |
| D5-A :652 | **conditional-ok** | See the D5-A paragraph below. |
| D5-V :653 | **confirmed** | Standard. Its hypotheses hold for the four-interval inclusion by Reeh–Schlieder, so it correctly forbids vacuum-preserving annular expectations unless μ = 1. |
| D5-M :654 | **conditional-ok** | See the D5-M paragraph below. |
| D5-H :655 | **confirmed** (conditional) | Re-derived: log χ_1(i/t) ≤ πt/12 + O(1) against ≥ πct/12 + log S_11. Sharp threshold c > 1. Hypotheses explicit. |
| Check bundle :656 | **confirmed** | Re-run reproduces. Checks are synthetic finite invariants, correctly not claimed as instances. `fusion_idempotents` uses the Z_2 fusion ring as a calibration only (Rule 16 fine). |

Notes on the confirmed finite lemmas:

- (a) D5-S is a finite tensor-network contraction with Gram resolution. <1>4 duplicates LC-9 FP-D.
- (b) D5-S is valid for cuts that run along tile legs, so zigzag cuts. It does **not** treat a
  straight spatial seam through plaquettes, which is CA-75 Link (a2). The anomaly-line limit is
  untouched.
- (c) D5-P is standard transfer-matrix positivity. The conclusion "no sign condition on c_α" is
  correct and useful against CA-86-style intuition.
- (d) D5-P does not derive *spatial* reflection positivity, and it says so (NOTE.md:230-233). The
  brief's question 4 is answered only for the temporal direction.
- (e) D5-R is Strang symmetrisation. The note omits a useful remark: R = A^{-1/2}(AB)A^{1/2}, so
  CA-86's AB is similar to a positive operator. Torus traces Tr(AB)^m are therefore unchanged and
  real-positive; non-Hermiticity of AB is harmless for partition functions.

**D5-F (overstated).** With F3 for factors (for example type III subalgebras), or with the
"normal expectation on the actual M" alternative (NOTE.md:424-425), the proof is correct:

- KLM :1719-1729 gives μ = Σd^2.
- F2 fully faithful and dimension-preserving gives the image contribution D_B.
- Any extra simple adds a positive d^2, so there is none. This is a clean argument.

The problem is the finite-dimensional F3. KLM p3(a) is proved via commutants (§2.1), and the PP
constant is not commutant-invariant for finite type I inclusions (reviewer check). The F3 bound
also does not assume compatible E_k (E_{k+1}|M_k = E_k) or a preserved faithful normal state, so a
normal limiting expectation on M is not constructed either. Step <1>1 is therefore unproved for the
advertised checkable version.

Repairs, any one of which suffices:

- (i) F3 for infinite-factor approximants;
- (ii) compatible, faithful-state-preserving E_k, so that a normal limit expectation E on M exists
  with E ≥ λ·id;
- (iii) a complete PP bound (E_k − λ·id completely positive), together with a sourced lemma that
  this passes to commutants. The source is not local; Law 1 gap.

No counterexample to the conclusion was found. The gap is in the proof route.

**D5-A (conditional-ok).** The proof is correct (strong-* density, weighted probe metric, tail
4·2^{-n}). It needs the reading that the probes b_r lie *exactly* in A(I_2)∨A(I_4). NOTE.md:462-463
is ambiguous about this; "from finite stages" must mean finite-stage elements that are exact members
of the continuum algebra. Note also that hypothesis (A) is close to a restatement of the conclusion.
Its value is in making the obligation explicit, not in reducing it.

**D5-M (conditional-ok).** The Verlinde algebra, the idempotents p_i and the reconstruction
D_a = Σλ_i(a)p_i are all verified. Self-adjointness of p_i silently uses S_{āi} = conj(S_{ai}) and
S_{1i} > 0, which hold for unitary modular B (P5). Applicability is narrow: M3 identifies the
lattice C-defects with **B's** fusion algebra, which is meaningful only for the D1 choice B = C.
For B = Z(C), or for non-braided fusion C, the defect spectrum is governed by tube-algebra
characters (Z(C) labels). That case is not treated.

## 4. Refutation attempts on D5-C and the lemmas

1. **C = Vec.** D_B = 1, so the conjecture asks for a holomorphic chiral net. Under the "some
   compatible enrichment" quantifier, c = 0 and a product-state chain with the trivial net appear
   to satisfy every item vacuously. "Full Diff(S^1) symmetry" is then trivial. Not a refutation,
   but D5-C should exclude the trivial net or require c > 0, otherwise the Vec case is degenerate.
   With c ∈ 8Z_{>0} it becomes a lattice construction of a holomorphic net, which is open.
2. **Pointed modular categories** (metric groups, Vec_A with quadratic form). Lattice-type chiral
   realisations are expected, but no local source was checked; B:376-381 only mentions lattice
   holomorphic nets. D5-H requires infinitely many Virasoro primaries when c > 1, which such
   realisations have. No contradiction.
3. **Non-self-dual objects and fusion multiplicities.**
   - P1 (NOTE.md:70-74) keeps arrows and dual labels.
   - D5-P works in multiplicity matrix units.
   - D5-M needs S_{āi} = conj S_{ai}, which holds for any UMTC.
   No hidden self-duality or multiplicity-freeness was found. Contrast the AFM simplifications
   (AFM-F:175-183), which the note explicitly refuses to import.
4. **Non-braided fusion C, e.g. Vec_G^ω with G non-abelian.**
   - D5-C is stated only for modular C. Fusion-only input gets a declared target B or a defect
     target (NOTE.md:52-55, 391-396), consistent with `realisation_and_fidelity.md:23-31`.
   - D5-S/P/R/G/W/D need no braiding and survive.
   - D5-M does not apply to the tube-algebra spectrum of such C (§3).
5. **Braided-inequivalent categories with equal modular data** (MS:175-179). D5-F concludes
   braided equivalence from a braided F2 and never infers it from S,T. Immune.
6. **Holomorphic tensoring non-uniqueness** (B:376-381). D5-C is existential, so this is immune.
7. **AFM-J:123-128** ("lattice and CFT fusion categories typically differ"). D5-C needs a chiral
   category *exactly* C. That is a strong selection demand on (O_n, h_n), which D2 must supply.
   It is not a contradiction, because D5-C quantifies over all lattice choices.
8. **"Single uniform procedure."** Suppose each UMTC admits a realisation whose certificates are
   formal proofs. Then enumerating (presentation, model, proof) triples gives a uniform procedure.
   The uniformity clause therefore adds almost nothing beyond per-instance provable existence. The
   same applies to D6-C.
9. **Finite PP constants versus limit index.** This attempt found the D5-F gap (§2.1, §3). I could
   not build a sequence whose finite PP indices stay ≤ D while the limit μ is larger, so the gap
   is in the proof, not a refutation.
10. **D5-H at c ≤ 1** is consistent: finite Virasoro content is allowed for c < 1.
11. **Contradiction with repo.**
    - No contradiction found.
    - The D1 proposal (full theory, chiral subnet tested) is compatible with PLAN.md:244-247 (the
      periodic limit is not Vir×Vir) and with CA-75's fidelity tiers.
    - The note's "AB not Hermitian" is correct; see the similarity remark above.

## 5. Rule 16 audit

- Model names appear only in the examples table (NOTE.md:703-711) and in source-path citations
  (`12_fibonacci_four_port.md`, `13_semion_multiplicity.md`). There are none in the body, as
  confirmed by grep.
- Places that lean on structure stated as general, and whether each survives:
  - **O_n ∋ 1, tensor-generating** (NOTE.md:17-18). This is a framework choice from CA-65/(r), not
    a model. It survives.
  - **Nearest-neighbour two-site densities and a two-layer brick** (D5-R, D5-W, NOTE.md:241-252,
    289-303). Specific to range 2. The general bounded-range statement in D5-C item 1 needs an
    r-layer palindromic schedule and a range-r current. Both are routine, but neither is written.
    It survives with a one-line extension.
  - **Modular S with S_{1i} > 0 and S_{āi} = conj S_{ai}** (D5-M, D5-H). General for unitary
    modular B. It does not cover fusion-only C (§3).
  - **`check_cells.py` fusion_idempotents** uses the Z_2 fusion ring and an S of the form
    [[1,1],[1,-1]]/√2. This is a calibration only and is labelled "synthetic". OK.
  - **Examples table rows 4-5** (LC-13, LC-12) are correctly confined there and only calibrate
    D5-G and D5-H.
- Verdict: **0 Rule 16 violations.**

## 6. Required fixes before promotion

1. D5-F: restate F3 so the limit step is valid (factor approximants, compatible state-preserving
   E_k, or complete-PP plus a sourced commutant lemma). Drop "finite-algebra positive-map problem"
   as a sufficient check until then.
2. Rename the energy density in P2 to avoid CONVENTIONS (ak)'s e_j = b_j d_j. Read (aj) and (ak).
3. D5-A: state that b_r ∈ A(I_2)∨A(I_4) exactly.
4. D5-M: restrict to B = C with C-defects, or add the tube-algebra version for B = Z(C) or fusion C.
5. Cite LC-9 FP-D in D5-S <1>4 as a restatement, and cite (af)/LC-4:39 for the continuity identity.
6. D5-C: exclude the trivial net (require c > 0), and drop or justify the uniformity clause (§4.8).
