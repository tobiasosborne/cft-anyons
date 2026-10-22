# D1 carrier theory: sceptical reconciliation review

Reviewer: Opus reconciler, 2026-10-22. Object of review:
`explorations/2026-10-22-astra/D1-carrier-theory/NOTE.md` (sha256 `3034c46a…`,
the same as `checks/manifest.json`), the brief `briefs/D1-carrier-theory.md`, and the
integration target `report/sections/75_integration_map.tex` (CA-75).
Lens: AGENTS.md Rule 16 (AGENTS.md:231–236) and "Models are examples, never
the subject" (AGENTS.md:78–94). No Julia or latexmk was run. Files outside this
directory were not edited.

**Bottom line.** The finite categorical results (D1-T1–T5b, D1-N1–N4, D1-T6)
are correct. They are stated for a general unitary fusion category, and several
correct live shards (CA-68, CA-71, CA-72, CA-73). The headline D1-C is an honestly
labelled, well-posed analytic conjecture. Three things limit it:
- Its categorical input has no analytic effect.
- Its collision physics depends on a tuned contact term.
- It is a nonrelativistic benchmark, not a step toward conformal fidelity.

## 0. Reproduction

- `python3 explorations/2026-10-22-astra/D1-carrier-theory/checks/carrier_checks.py`
  was rerun and its output matches `checks/raw_output.txt`: the producer SHA
  `a46b455c…` is the same, there are 4 GREEN groups and 4 RED mutations are rejected. The script checks only finite
  shadows (carrier_checks.py:22–129), as the note says (NOTE.md:574–581).
- Reviewer check: `checks/review_contact_check.py` with output
  `checks/review_contact_output.txt` (numpy, matrices of at most 1770×1770). See §2, R1.

## 1. Citation audit (every anchor opened)

| Note location | Cited target | Verdict |
|---|---|---|
| NOTE.md:73,138,173,233,265 | Penneys:219–237 (orthogonal sums), :233 (unitary iso), :358–362 (Add/Idem/Cauchy completion), :394–398 (graphical coherence) | Matches. |
| NOTE.md:74 | Penneys:534 "displayed graphical vertex normalization" | **Off by one.** :534 is an HTML anchor. The normalization (3.5.14) is at Penneys:535–537. Trivial. |
| NOTE.md:265 | Penneys:427–487 for `N^1_(a,b̄)=δab` | **Over-wide but supportive.** The fact is (FR2)/(FR4) at Penneys:484–487, with Frobenius reciprocity at :427–430. |
| NOTE.md:657 | Penneys:423 for the Hilb_fd row | **Weak.** :423 (Example 3.4.5) only says that finite-dimensional spaces are dualizable. The Morita and End statements rest on the FRS anchors and on arithmetic. |
| NOTE.md:658 | Penneys:277–288, :522 | Matches: Vec(G) at :277, and the complete fusion graph of C[G] at :522. |
| NOTE.md:110,673–675 | Penneys:1010–1019; EGNO:1700–1706 | Matches. EGNO Prop. 8.23 is at :1704–1706, which gives d = FPdim for pseudo-unitary categories. This agrees with CONVENTIONS.md:663–670. |
| NOTE.md:676–677 | GaugingDefects:174–221 | Matches (maybe-spin `C⊕C^d`, kinematic status at :218–221). |
| NOTE.md:291 | FRS hep.tex:2272–2284 | Matches (Definition of algebra object). |
| NOTE.md:294 | FRS:2331–2336 | Matches (`U⊗U^∨`, `m=id⊗d⊗id`, `η=b_U`). |
| NOTE.md:307–308 | FRS:2913–2920 | Matches. The source says that all `U⊗U^∨` are Morita equivalent "for different (not necessarily simple) U", which includes U=1, so the Morita class is constant (see D1-N2 below). |
| NOTE.md:678 | FRS:4471–4480 | Matches (bimodule definition). |
| NOTE.md:371 | Hollands:1193–1204 | Matches: basic construction from a finite-index inclusion with a faithful normal state. |
| NOTE.md:680–681 | Hollands:1240–1271 | Matches: cup-derived Jones projections `e=d⁻¹ r r*` on the alternating ı, ı̄ word. The note does **not use** this anchor to answer brief Q3 for the unital tower (§2, R3). |
| NOTE.md:349–352 | Brothier–Stottmeister main.tex:500–511, :522–541 | Matches: covariant functor gives Jones's F-action (:500–511); a tensor functor with Φ(n)=⊗Φ(1) gives the V extension (:522–538). |
| NOTE.md:394–395, 684–686 | 2306.16063.md:568–575 | Matches: eq. (29) is an **operator-norm** asymptotic-homomorphism condition. |
| NOTE.md:684 | 2010.11121.md:126–180 | Matches (unital injective scaling maps, inductive limit). |
| NOTE.md:691–697 | CA-65:46–137, CA-66:54–161, CA-68:51–153, CA-69:46–67, CA-71:49–180, CA-72:44–195, CA-73:166–200 | Matches, and the claims about them are accurate: CA-71:157–174 (right caret and "indeed V"), CA-72:184–193 (Cor. 72.8 "precisely when ω(1−P)→0 in GNS seminorms"), CA-73:159–172 (polynomial transport and three-site support). |
| NOTE.md:698–700 | CA-87 on branch commit `1f402aa`, :55–69 | **Stale, not wrong.** CA-87 is merged: `report/sections/87_dilute_fibonacci_is_blocked_golden.tex:55–69` has identical lemma text (the diff only relabels (ad) as (aj)). CA-75:53 cites the merged path. |
| NOTE.md:702–705 | wilson_triangle.md:1–38; virasoro_routes.md:52–80,165–183; reconstruction/04_cutoff_oar.md:16–31,84–160; reconstruction/README.md:19–39 | Matches (WT-1 A1–A3 at :20–33; VR-1 A1 at :56–58; LC-4 sections 1 and 3). |
| NOTE.md:76–77 (convention 2) | CONVENTIONS (r), CONVENTIONS.md:635–637 | **Silent extension.** (r) takes X to be the species object, implicitly with no unit summand. The note allows unit summands in X. The note does list this under "Conventions proposed", but (r) must be amended before it is adopted. |
| NOTE.md:583–589 | "independent skeptical collaborator" | **Unverifiable.** No transcript or file. |

**Uncited overlap.** D1-T6 (NOTE.md:457–462: "No new particles are needed to
repair this particular isometry") is in tension with CA-68:160–162 ("fixed-N
wavelet refinement fails isometry exactly where indefinite anyon number can
repair it"). Neither cites the other. The two are reconciled as follows. The
CA-68 deficit comes from overlapping (D4) scaling functions under hard-core
exclusion. Non-overlapping (Haar/box) cells have no such deficit. CA-68's
"structural evidence" reading therefore holds only for overlapping smearing.

## 2. Adversarial pass

**Refutation attempts on D1-C (all failed to refute; caveats recorded).**

- *Degenerate inputs.*
  - X=0 forces b=v=0 and the carrier is C. Trivially consistent.
  - C=Vec with X=1 (so O=1⊕1, not connected) gives a scalar hard-core gas with
    contact Robin coupling and pair creation. Nothing in NOTE.md:9–62 breaks.
  - Vec_G^ω and other pointed C: the cocycle enters only through unitors and
    associators on fibres. The analytic form q (NOTE.md:21–24) does not see it.
  - Multiplicities and non-self-dual X: the fibres F_c,N=Hom(c,X^N) are arbitrary
    finite-dimensional spaces, and b and v are arbitrary morphisms. Nothing uses
    self-duality, multiplicity-freeness or braiding.
  - Non-braided C: ordered 1D configurations never exchange particles.

  No counterexample exists within the stated class.
- *R1, a hidden tuning (reviewer check, confirmed).*
  `D_hop†D_hop = n_j(1−n_{j+1}) + (1−n_j)n_{j+1} − hop_j`. It is therefore the standard
  hard-core hopping chain plus a contact **attraction** `−2ε⁻² n_j n_{j+1}`. The
  standard chain gives Dirichlet collisions: the free-fermion gap is π². The note's
  form gives Neumann collisions (E0=0).
  `review_contact_output.txt` shows note-form E0=0 and E1→9.867, and standard E0→9.867, against π²=9.8696 at L=60.
  With Dirichlet collisions every trace `T_iψ` vanishes. The fusion and pair-creation
  terms then reduce to the sector-diagonal potentials ‖Bψ_N‖² and ‖Vψ_N‖², and
  all number-changing coupling disappears. So D1-C's number-changing continuum
  exists only on a fine-tuned codimension-one family of lattice contact terms.
  This is **not** a refutation, because D1-C fixes H_ε exactly (NOTE.md:35–41). It does
  mean the limit is non-universal. "General rigorous continuum regularisation
  for local number-changing categorical fields" (NOTE.md:55–56) is therefore
  overstated as a framing.
- *R2, inert category.* q and H_ε depend on C only through the
  finite-dimensional spaces F_c,N and the linear maps B_α,i and V_β,i
  (NOTE.md:86–97). No F-move, dimension or braiding enters. D1-C is
  a vector-valued Mosco/Γ-convergence problem for 1D Schrödinger forms with
  sector-coupling contact terms. The note half-concedes this (Open problem 1,
  NOTE.md:634–636). Its techniques are standard analysis. Novelty and difficulty lie in
  uniform multi-collision corner trace estimates, not in category theory.
- *R3, Jones-tower question incompletely answered.* D1-N3 (NOTE.md:365–375) is
  correct: corner compression is a nonfaithful expectation. The note does not
  address the **unital** tower α. The normalized partial categorical trace gives a faithful,
  trace-compatible expectation A_{L+1}→A_L. Over the alternating word
  O Ō O Ō… the cup projections `d_O⁻¹ coev coev†` are exactly the Jones projections
  sourced at Hollands:1240–1271. In the blocked case of D1-T4 the vacancy
  projector satisfies `P_0 = u†(d_Y⁻¹ coev_Y coev_Y†)u`, because `uη=d_Y^{-1/2}coev_Y` (NOTE.md:275–277).
  It is therefore precisely a Jones projection of the dense Y-tower. CA-87:96
  (`e_{2j-1}=φP_0`) is an instance. The reviewer has **not checked** the general
  basic-construction identity `A_{L+1}=A_L e A_L`. It is recorded as a lead, not as a result.
- *D1-N2 understated.* By FRS:2915–2918 every `O⊗Ō`, O≠0, is Morita
  equivalent to `1⊗1^∨=1`. The Morita class (equivalently the module category)
  is therefore **constant**, not merely coarse. The counterfamily O versus O⊕O
  (NOTE.md:297–308) is correct but is a special case.
- *D1-T2 near-tautology.* Retaining "concatenation of operators" (NOTE.md:155–156)
  retains the monoidal structure of the full subcategory on powers of O.
  Reconstruction is then its Cauchy completion (Penneys:358–362). The statement is correct. Its content is
  the negative lesson that algebras plus θ are not enough.
- *D1-T4.* Checked the formula `o_c=Σ y_a y_b N^c_(a,b̄)` and `N^1_(a,b̄)=δ_ab`.
  The bound `y_a≤⌊√o_1⌋` makes the search finite. The transport of η to
  `d_Y^{-1/2}coev_Y` is possible because U(o_1) acts transitively on unit vectors of
  `Hom(1,YȲ)`. Self-duality of O and `FPdim O = FPdim(Y)²` are correctly called
  necessary only. This is a strict generalisation of CA-87 Lemma 87.1 (CA-87:55–69, simple Y)
  to non-simple Y with multiplicities. It does not depend on any particular model.
- *D1-T3.* Re-derived the two-site counts. A2^(+2)=Hom(1,X²) has dimension s. A2^(+1)=Hom(1,X⊕X)⊕Hom(X⊕X,X²) has dimension 2t,
  plus 2 dim Hom(1,X) when X contains the unit. The total is 2s+4t. The parity criterion is correct.
  "Complete two-site diagnostic" (NOTE.md:242) is vague but harmless.
- *D1-T5b.* `‖π(P)Ω/√p−Ω‖²=2−2√p` holds, and the two bounds hold for s=√p∈(0,1]. `τ_l(P_φ)=Tr(V†V)/d_O^l = d_O^{k−l}` holds. Since `Φ_χ(ST)−Φ_χ(S)Φ_χ(T)=cov·(1−P)`, the operator norm is |cov| whenever P≠1. This **contradicts the reading of CA-72 Cor. 72.8** (CA-72:184–193), which identifies GNS-seminorm smallness with the operator-norm condition of 2306.16063:572–575. D3 found the same independently (D3 NOTE.md:150–157). The note flags it only softly (NOTE.md:394–395).
- *Corrections to CA-71 and CA-73 (confirmed).*
  - The right caret `id_O⊗ι` cannot produce placements with φ(1)>1, so CA-71:167–169 ("every placement is a composite of single vacuum insertions" by that caret) is false as stated.
  - `⊕_c Hom(c,O^L)` is not `Φ(1)^{⊗L}` in Hilb, so the V-extension of B–S:530–538 is not available. CA-71:157–160,172–174 ("indeed V") is unsupported. The F-action survives (B–S:500–511).
  - CA-73:162–172 needs the corner-unit qualification `θ(F(a;1))=F(θ(a);P)`, because Virasoro residuals carry central constants. It also needs the global-support qualification, since θ pins every inserted site. D3 NOTE.md:135–148 and D4 NOTE.md:456–463 found the same independently.
- *D1-T6.*
  - Re-derived isometry, telescoping `√(|J|/|I|)` coherence, `K_σJ_σπ=K_π`, and density.
  - The adjacent-interval factorisation `F_c(I∪J)≅⊕F_a(I)⊗F_b(J)⊗Hom(c,a⊗b)` holds with isometry inner products.
  - Caveat: R is a non-unitary isometry, so `Ad R` is again a corner map. D1-T6 is a Hilbert-space carrier theorem and gives no unital observable refinement, which the note says itself (NOTE.md:611–613).
  - In the free-fermion case, second quantisation of a one-particle isometry gives a *unital* CAR map. For hard-core categorical sites the smeared site operators do not satisfy the site relations, which is the obstruction behind Open problem 3. D6 P1 (D6 NOTE.md:262–286) makes it an integer feasibility condition.
- *D1-T7.*
  - The recovery sequence, face scalings ε^{n+1} and the source bounds were checked by hand and by carrier_checks.py:109–129 (constant cores only).
  - The variational step (NOTE.md:549–557) is the standard Mosco argument on varying Hilbert spaces. It is done in-line correctly, and no external theorem is cited.
  - Conditional on the stated lower bound, which is correctly identified as the gap.

## 3. Rule 16 audit

- Model names appear only in the examples table (NOTE.md:654–658), checked by grep.
- The check script uses scalar (Hilb_fd) fibres as an explicitly labelled
  calibration (carrier_checks.py:6). That is allowed inside a check. The reviewer check does the same.
- No general proof uses a model fact: no TL quotient, no 1+τ=τ⊗τ, no self-duality, no
  multiplicity-freeness, no braiding. D1-T4 is a strict generalisation of the
  model-generated Lemma 87.1.
- Examples-table rows were checked:
  - The Vec_G regular row is correct: m_g(L)=r^{L−1} and the fusion graph is complete, so C4 and C2×C2 give identical unmarked towers.
  - The Hilb_fd row is correct: 2 is not a square.
  - The Fibonacci row is correct (Penneys:612).
- A non-model specialisation that deserves the same scrutiny is R1: the conjecture fixes one lattice
  contact discretisation. That is a regularisation choice, not a category model, so it is not a Rule 16
  violation. It should still be declared as such.

**Rule 16 violations: 0.**

## 4. Results-ledger grades (NOTE.md:593–606)

| Ledger line | Grade | Reason |
|---|---|---|
| D1-C conjectural | **conditional-ok** (label accurate); framing overstated | The label is honest and the analytic hypotheses are declared (NOTE.md:26–31). Non-universal: it depends on a tuned contact term (R1). Category inert (R2). Not CFT-directed (NOTE.md:59–62). |
| D1-T1 proved | **confirmed** | Elementary; checked. |
| D1-T2 proved | **confirmed** | Correct; near-tautological Cauchy completion. Its value is the negative lesson. |
| D1-N1 proved negative | **confirmed** | Standard corner-inductive-limit of matrix algebras equals K. |
| D1-T3 proved | **confirmed** | Counts re-derived. |
| D1-T4 proved | **confirmed** | Decidable; generalises Lemma 87.1; transport of η is correct. |
| D1-N2 proved negative | **confirmed (understated)** | The Morita class of O⊗Ō is constant (FRS:2915–2918). |
| D1-T5 proved | **confirmed** | Elementary representing property. The caret and Thompson-V qualification of CA-71 is correct. |
| D1-N3 proved negative | **confirmed (scope-limited)** | Correct for compression. Leaves out the unital-tower Jones structure and the identity P_0 = Jones projection under blocking (R3). |
| D1-T5b proved | **confirmed** | Corrects the reading of CA-72 Cor. 72.8; concurs with D3. |
| D1-T6 proved | **confirmed** | Hilbert carrier only; the observable map is still a corner. Qualifies CA-68:160–162 without citing it. |
| D1-N4 proved negative | **confirmed** | Orthogonal atomic vectors, so translations cannot be strongly continuous. |
| D1-T7 proved partial | **conditional-ok** | Recovery and source bounds hold; the resolvent conclusion is conditional on the lower bound, as stated. |
| Exact script | **confirmed** | Rerun; output identical. |
| "Independent collaborator audit" (NOTE.md:583–589) | **unverifiable** | No record. |

## 5. Contradictions with the repository

The note **correctly contradicts** four places:
- CA-71:157–174: the caret-generation claim and the Thompson-V claim.
- CA-72:184–193: the Cor. 72.8 softness reading.
- CA-73:159–172: three-site support, and transport of constants to 1.
- CA-68:160–162: the deficit reading, which holds only for overlapping smearing.

None of the four is an error in the note. All four belong in the CA-75 row-(3) "already general" column as
qualifications. The note duplicates no shard. Its configuration-space carrier is
new to the repo: grep finds no prior "ordered configuration" or collision-form text
in report/, cft_machine/ or reconstruction/.
