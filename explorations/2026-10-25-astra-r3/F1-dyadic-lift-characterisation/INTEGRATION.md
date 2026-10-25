# F1 integration package — finite-block local unital lifts

2026-10-25. Review grade: **COUNTEREXAMPLE to the proposed F1 equivalence**;
the positive sufficient theorem and stated family results are accepted as
proved. Source of the verdict: `REVIEW.md`, auditing all 35 numbered steps
of the current `NOTE.md`. This file proposes integration; no report,
canonical convention, worklog or index file was changed.

## (a) Statements safe to lift, with grades

Use a new shard, or two short shards separating the block construction
from the associator calculation. Do not reserve a CA number here: other
round-3 results are being integrated concurrently. Keep the general
construction first and individual categories in the examples/checks table.
All claims below retain their explicit quantifiers and data restrictions.

| Statement and source | Grade | Honest tags and boundary |
|---|---|---|
| Universal vacancy swap: `T=(eta⊗1)p1(1⊗eta†)`, `S=p0⊗p0+p1⊗p1+T+T†` is a self-adjoint unitary exchanging the two insertion maps; a fixed schedule gives U_s. NOTE:59–89. | **derived** | any; pointed object in a unitary monoidal category (hence L0); finite ingredient →R0^u. No braid relation off the vacancy subobject. |
| A pointed unitary half-braiding of `(O^b,eta^b)` on full D=⟨O⟩ gives all-L lifts on the unchanged A_L, exact V_L, slack 2b−1, and dyadic composition. NOTE:91–176. | **derived** | any; L0 + declared blocked H, open chain and block origin; R0^u. A theorem under a supplied datum, not unconditional existence of that datum. |
| For every finite nonabelian G and noncentral g of order b, `O=R⊕g` is noncentral but `O^b=1⊕KR` has explicit pointed transport. NOTE:178–225. | **derived** existence; **negative** to (a)⇒(b),(c) | any; bare L0 within the untwisted group-graded family; R0^u. D=C, so this is not the old ambient-versus-relative-center example. |
| The one-gap restriction matrices concern the inserted object P; for the family, `Lambda_(c,c')=K+delta_(c,c')` satisfies the complete matrix equation. NOTE:227–276. | **derived** scope/arithmetic; **negative** to the proposed cut extrapolation | any; L0; finite →R0^u. CA-90's unchanged-side theorem is retained. |
| In Vec_A^omega for finite abelian A, pointed unitary half-braidings are exactly matrices satisfying H1,H2; a commutator phase of order d requires d dividing the relevant multiplicity. NOTE:278–325. | **derived** | any; L0 including omega and dagger; finite →R0^u feasibility. Divisibility is necessary only; not a complete multiplicity criterion. |
| For A=(F_p)^3, trilinear omega and O=0⊕e1⊕e2⊕e3, centrality holds and one-site transport fails. The same O admits a local lift after blocking. NOTE:327–365,447–450. | **negative** to (b)⇒(c); **derived** R0^u witness | any; bare L0 within the declared family. Lack of one-site transport is not a finite-slack obstruction. |
| For every pointed O in every normalized unitary Vec_A^omega, A a nontrivial finite abelian p-group of order p^d and exponent p^e, b=p^(e+d−1) supplies pointed transport on the entire ambient category. NOTE:367–445. | **derived** | any; bare L0 within this class; R0^u by the block theorem. The trivial group uses b=1. Not extended to all finite abelian groups or all fusion categories. |
| Covariance, composition, and compatibility with pointed unitary monoidal natural isomorphisms for the chosen construction. NOTE:452–517. | **derived** | any; L0 + transported point, b and blocked H; R0^u covariance, not R5. Explicitly use D'=⟨O'⟩ in F1.6.2. |
| The CA-76 strict-lift estimate applies to these alpha and V; a prescribed state sequence needs summable drift. NOTE:600–605; CA-76:90–108. | **conditional** state consequence of an existing theorem | any; the same R0^u data + declared states and the actual analytic bound; →R1. No new critical-state estimate. |
| Central-class sufficiency (b)⇒(a) for arbitrary fusion input; necessity of transport on some finite tensor power. NOTE:622–628. | **conjectural / open** | any; L0; →R0^u. Neither is part of the proved theorem. |
| Periodic/seam, occupation-degree, translation/reflection, boundary-extension consistency and canonical-selection variants. NOTE:170–176,579,639–641. | **conjectural / open**, not a proved conditional result | No corresponding new rung certificate. Replace the misleading “conditional” ledger label at NOTE:579 in any lifted summary. |

Core statement suitable for the new shard:

> Let C be unitary fusion, `(O,eta)` pointed, and D=⟨O⟩ full. Suppose a
> fixed tensor power `P=O^b`, with point `xi=eta^b`, has a specified unitary
> family `t_Y:Y⊗P→P⊗Y` on D satisfying the unit, naturality, tensor and
> point axioms (H). Then for every L≥1 there is a unital injective
> *-homomorphism `alpha_L:End_C(O^L)→End_C(O^(2L))` with
> `alpha_L(a)V_L=V_La` and
> `alpha_L(A_[j,k])⊂A_[2j−1−r,2k−1+r]`, r=2b−1, endpoints clipped.
> Their dyadic composites satisfy WT-1 A1. The construction commutes with
> pointed unitary tensor equivalences transporting b and t. Tags:
> **(any; L0+blocked H; R0^u)**, microscopic open ordered chain.

The proof must include the heterogeneous one-gap formula, the q-tail and
the cell-hull endpoint bounds. “Apply CA-90 after blocking” alone loses
the all-L and exact-original-V requirements and is not an adequate proof.
For b=1, cite CA-90 directly for the sharper r=0.

## (b) Exact CA-88 cells that move and do not

Grid locators are in `report/sections/88_layered_targets.tex`.

| Cell / locator | Change licensed by this review |
|---|---|
| `(any, L0+blocked H, R0^u)`, Definition 88.3 row :103, prose :117–118, CA-90 row :149 | Broaden the sufficient datum from pointed transport on O to pointed transport on a fixed O^b **on full ⟨O⟩**. The result remains derived, on the original algebras. |
| `(any, bare L0, R0^u)`, same row and open-status sentence :260 | Add derived existence for the untwisted regular-plus-g family and for every pointed object in twisted finite abelian p-group categories. Mark the universal centrality obstruction false. General existence/classification remains open. |
| `(any, L1, R0^u)` and its higher-data specializations | No new prerequisite or rung: CA-90 already gives the stronger r=0 result from a braiding. Do not replace that bound by 2b−1. |
| `(any, L0, R0^c)`, :102 and CA-77 row :141 | Unchanged. A new unital lift does not identify it with the trailing tower or alter the corner map's unit P_L. |
| R1 row :104, CA-76 rows :138–140, D3-C :190–196 | No new nontrivial state convergence. The local-lift input to the existing drift/local-witness interfaces is available for more classes; all state estimates remain required. The elementary compatible vacuum-state observation is inherited, not a new critical result. |
| `(full, any L, R0^u)` requiring a periodic seam; LC-4 row :155 | Unchanged. S=any means independence of a target chirality, not a periodic-chain theorem. |
| All R2, R3, R4 cells, :105–107 | Unchanged: no modes, common domain, positive-energy/local-net theorem, or target fidelity. |
| R5 row :108; D6-C :218–228 | Unchanged. Naturality of supplied microscopic data is not coherent selection of a realizing CFT from bare categorical input. |
| D1-C dressed/occupation-compatible target :167–176 | Still open at the additional compatibilities. Blocked H need not preserve the original site occupation grading. |

Amend the round-2 target pointer at :235 with a dated note: its requested
single-site centrality deduction is refuted; the new target is finite-power
transport extraction below. This does not regrade the original round-2
positive theorem or its one-gap obstruction.

## (c) Dated amendment pointers for existing shards

These are proposed pointer texts, not authorization to edit outside this
directory. Replace `<new F1 shard>` by the eventual assigned identifier.
CA-90 and CA-88 are already close to the shard cap; integrate by a short
pointer/replacement, not by appending the entire proof.

- `report/sections/90_local_unital_lift.tex:245–250`, Target 90.T:
  **“Amendment (2026-10-25, F1): the proposed finite-slack deduction of
  [O]-centrality is false. Pointed transport on O^b suffices, with
  r=2b−1 on the original carrier; the regular-plus-g family is a
  counterexample (<new F1 shard>, F1.1b–F1.3). General characterization
  and the original three-summand S3 carrier remain open.”**
- Same shard :193–211, converse boundary:
  **“Amendment (2026-10-25): Proposition 90.2(b) retains its exact
  unchanged-side one-gap scope. Its obstruction does not extend to all
  finite-slack dyadic lifts; see <new F1 shard>.”** Keep (90.5),(90.6),
  Theorem 90.1, its grading theorem and its r=0 bound intact.
- `report/sections/88_layered_targets.tex:103,117–118,149,235,260`:
  **“Amendment (2026-10-25): finite-power pointed transport broadens the
  R0^u certificate; bare-L0 existence is proved for the specified
  group-graded classes, and single-site centrality is not necessary
  (<new F1 shard>). No general characterization or higher rung follows.”**
- `report/sections/76_corner_to_wilson_bridge.tex:140–149,236–247`:
  **“Amendment (2026-10-25): <new F1 shard> supplies local strict lifts
  under blocked H and in its bare-L0 families. Proposition 76.1 applies
  unchanged; the state/witness conditions of Question 76.12 remain open.”**
- `report/sections/75_integration_map.tex:149–155`, Link (b1):
  **“Amendment (2026-10-25): local unital typing also holds with pointed
  transport on a fixed tensor power, including bare-L0 non-braided
  families (<new F1 shard>); this does not close Link (b3).”**
- `report/sections/68_variable_n_refinement_maps.tex:87–93`:
  **“Amendment (2026-10-25): <new F1 shard> extends the local unital
  completion certificate to blocked H; it preserves this literal V_L.”**
- `report/sections/77_pointed_carrier_invariants.tex:253–256`:
  **“Amendment (2026-10-25): blocked transport gives additional unital
  lifts of bare V (<new F1 shard>), but does not solve the
  number-changing field-algebra/state-compatible refinement problem.”**

No mathematical amendments to CA-91–CA-94 are licensed by this proof:
reflection, seam and occupation compatibility must be checked before
combining systems. No fidelity or conformal-sewing equation is changed.

## (d) CONVENTIONS entries needed when integrating

Keep existing (a),(b),(r),(t),(am),(aq),(as). Fix the following locally
scoped additions before a report proof uses them:

1. **Blocked transport:** b≥1 fixed independently of L; P=O^b,
   xi=eta^b; t_Y:Y⊗P→P⊗Y for **Y∈full D=⟨O⟩**, with every (H) axiom.
   Do not abbreviate this to centrality of [P] or transport only on ⟨P⟩.
   This block P is not CA-77's dual-pair root Y.
2. **Block and tail geometry:** origin at old site 1; L=mb+q,
   0≤q<b; insert full P blocks after each old P, append Q=O^q, then
   use one fixed vacancy-swap schedule in every 2b/2q output cell.
   Old content is exactly on odd fine sites. Retain left bracketing.
3. **Locality and coherence:** support is tensor-interval membership;
   clip `[2j−1−r,2k−1+r]` to `[1,2L]`; sufficient symmetric slack is
   r=2b−1. Coherence here is dyadic composition, not a claim of
   compatibility under arbitrary spatial boundary extensions or placements.
4. **Twisted abelian coordinates:** additive grade 0 is the unit simple;
   normalized omega:A³→U(1); associator `(g⊗x)⊗y→g⊗(x⊗y)` multiplies
   by omega(g,x,y); z_x:O⊗x→x⊗O=t_x^−1; matrix products act right first.
   Define `beta_g(x,y)=omega(g,x,y)omega(x,y,g)/omega(x,g,y)` and use
   `rho_g(y)rho_g(x)=beta_g(x,y)rho_g(x+y)`. Distinguish this beta_g
   from the one-gap algebra map beta_(M,s).
5. **Choice and grading boundary:** equivalences transport b,t and all
   pointed identifications; multiplicity-basis choices are not canonical.
   No site occupation-degree preservation is part of blocked H. A periodic
   seam or reflection/translation requirement is additional data/theorem.

No global R-symbol gauge, central-charge convention, cup normalization or
continuum Hilbert-factorization convention is introduced. The current
brief's (ar) reference should be (as), with (am),(t) for the point/placement.

## (e) The single next lemma

**Finite-power transport extraction (conjectural; any; L0; →R0^u).**
Let C be arbitrary unitary fusion, `(O,eta)` pointed, D=⟨O⟩ full. Suppose
for every L there is a unital injective *-map A_L→A_(2L) intertwining V_L
and obeying the F1(a) interval bound with one finite r. Prove or refute
the existence of b≥1 and a pointed unitary relative half-braiding of
`(O^b,eta^b)` on D. No unchanged-side, occupation or translation hypothesis
may be inserted silently. A positive result plus F1.1b would be the new
characterization; a counterexample would identify algebra lifts beyond
finite-power transport. The existing cut calculation proves neither.

## Evidence handoff

Use NOTE.md F1.1a–F1.6 and REVIEW.md's source audit. The task-local run
bundle contains four freshly rerun baseline/mutation pairs plus the new
b=3 multiblock check: 832 interval units and 803,076 exact matrix entries,
with a tail-transport mutation rejected by locality despite exact V.
Commands, cutoffs, raw outputs and hashes are recorded in REVIEW.md and
`checks/review_r3_rerun_manifest.json`, `checks/review_r3_manifest.json`.
No Julia suite or report build was run because this review changes neither
the package nor the report. Future shard integration must carry these
grades, register its pointers, and run the repository's report gates.
