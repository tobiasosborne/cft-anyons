# G6 integration — 2026-10-27

Review grade: **COUNTEREXAMPLE** ([REVIEW.md](REVIEW.md)). The positive form of
CA-97 Target 97.16 is false. The interval/dilation record R does not see the
point (vacancy) of the site. This file proposes integration only. No report,
convention, worklog or index file was edited. NOTE.md is unchanged.

Pillars: **P1** (indefinite particle number). The vacancy summand of
O = 1 (+) X is the datum R forgets, so it must be carried. **P4/R4**: fidelity
marks are transported along the tower, not reconstructed from it.

## (a) Statements safe to lift, with grades

All statements are about the general record construction. The finite groups
are counterexample instances, not the domain.

| ID | Safe statement | Grade | (S; L; R) / evidence |
|---|---|---|---|
| T1 (G6-A) | For unitary fusion D, nonzero O and cut m|n: A_(m+n) = ⊕_z End(⊕_(x,y) V_m^x (x) V_n^y (x) F_xy^z), and the joint relative commutant of A_[1,m], A_[m+1,m+n] is ⊕_(z,x,y) 1 (x) End(F_xy^z). Record isomorphisms preserve these commutants and the delta-moved variants. | derived | any/open; L0 (L0+H for delta-moved cuts); R0 finite information. NOTE:43-84. |
| T2 (G6-B) | Let G be finite abelian, D = Hilb_fd(G) with trivial associator, and O' = sO with both pointed and generating. H is the flip, or more generally any bicharacter transport for which s is transparent (reviewer R-1). Then Ad U^{(x)L} is a record isomorphism. It is exact on A_infinity, maps every A_[j,k] onto A'_[j,k], intertwines delta, and also preserves concatenation and interval translations. | negative, derived | any/open; L0+declared H; R0^u information. NOTE:101-184; REVIEW §3. |
| T3 (G6-B1/B2) | O = R_G(+)1 versus R_G(+)s (unit multiplicity 2 vs 1). Also connected O = R_G(+)a versus R_G(+)b with a, b in distinct Aut(G)-orbits (e.g. different orders). No tensor equivalence carries O to O'. | negative, derived | same. NOTE:186-200; checks Z_2, Z_4, Z_6. |
| T4 | **Target 97.16 (positive form) is refuted** by T2-T3. | negative | any/open; L0+H; R0. |
| T5 (G6-C1) | For any (D,O,eta,H) with a noncentral unitary u fixing eta and satisfying (G6.5), R plus all p_j has an automorphism moving T, theta, h and concatenation while fixing their range projections. Such u exist for O(+)1 for every input. | derived, *naturality* obstruction only | any/open; L0+H+(G6.5); R0 marks. NOTE:202-269. Not a non-recoverability result. |
| T6 (R-3) | With the points p_j named, the tested T3 instances have no R^p-isomorphism: the unit-block size of p_1...p_L differs (Z_2 at L=1, Z_4 at L=2, Z_6 at L=3). | derived for these instances only | any/open; L0+H; R0. REVIEW §4. |

**Do not lift.**
- "General mechanism" (NOTE:40-41). Write "counterexample family for every
  nontrivial finite abelian G" instead.
- The G6-C2 row at NOTE:280 ("identifications along j->2j-1"). These are
  embeddings, not identifications.
- The G6-C2 row at NOTE:286, which cites a nonexistent G6-D.
- Reviewer R-2 (the E (x) Hilb(G) extension). It is a sketch with a Law-1 gap.
- Any claim that R forgets F or H. G6-B uses the same D and the same kind of H
  on both sides.

## (b) CA-88 grid cells

Anchors: `report/sections/88_layered_targets.tex:96-125` (Definition 88.3),
`:134-154` (results table).

| Cell / locator | Change | Unchanged |
|---|---|---|
| (any/open; L0+H; R0^u), dyadic geometry; :103, :149 | Information annotation. The interval/dilation record R does not determine the pointed input (T4). The point must be retained. | No existence or attainment change. CA-90 row :149 keeps its derived/negative entries. |
| R4 insufficiency annotation; :107, :112-116 | Extend the 80.8/97.10 negative to R, the full interval filtration plus delta. Name the first mark proved necessary: the point/vacancy. | No R4 attainment. 93.8 stays conditional on R3 and its certificates. |
| New results row "G6 (CA-97 successor or 97 amendment)" | any/open; L0+H; R0 info; T1 [derived], T2-T4 [negative], T5 [derived, naturality]. | — |
| (any; L0; R0^u) trailing; (any; L0; R0^c); R1, R2, R3, R5; full/periodic; L3 | **No change.** | — |

## (c) Amendments other shards need (dated pointer form)

- **CA-97**, `report/sections/97_what_the_tower_remembers.tex:11-14,263-272`.
  Replace Target 97.16's status with: *"Amendment (2026-10-27, G6 REVIEW grade
  COUNTEREXAMPLE): the positive form of 97.16 is false. For abelian
  Hilb_fd(G), translating the site's charge origin, O' = sO with s
  H-transparent, gives an exact record isomorphism on every interval and on
  delta between inputs with no tensor equivalence O -> O' (e.g. unit
  multiplicity 2 vs 1; connected sites with a, b of different orders). The
  record forgets the point. Restated Target 97.16': does R^p = (R, {p_j})
  force a unitary tensor equivalence transporting eta and H?"* Also update the
  status line: "97.16 negative; 97.16' conjectural". Update SHARD-SUMMARY line
  2: "interval/dilation reconstruction fails without the point; with named
  points it remains open".
- **CA-97 §What the Refinement Record Adds**, after 97.13 (:218). Pointer:
  "97.13 needs eta. G6 shows eta is not recoverable from R. The point is a
  necessary carried mark (2026-10-27, G6)."
- **CA-77**, `report/sections/77_pointed_carrier_invariants.tex:75-81`
  (Prop. 77.2). Pointer: *"Amendment (2026-10-27, G6): the placements
  theta_phi (which need eta) are not dispensable. Algebras plus intervals plus
  refinement plus concatenation, without eta, do not determine the pointed
  input (G6-B preserves concatenation)."*
- **CA-90**, `report/sections/90_local_unital_lift.tex:121-122` (Theorem
  90.1(iv)). Pointer: "the converse fails at the record level: the dyadic
  tower plus interval filtration does not determine (O,eta,t) up to the
  equivalences of (iv) (G6-B, 2026-10-27)."
- **CA-88** (cells above). Add to Remark/annotation near :112: "R0 records
  certify at most the data they carry. The first carried mark proved
  necessary is the point (G6, 2026-10-27)."
- **worklog 023 §4.4** (`worklog/023_2026-10-27_status_overview.md:179-183`).
  The next worklog chunk should correct the sentence "G6-B show the algebraic
  record ... forgets the input" to: *"G6-B (reviewed COUNTEREXAMPLE) shows the
  interval/dilation record forgets the vacancy/point (charge origin) of O; it
  uses the same D on both sides. Whether the record with named points forgets
  F or H is open (Target 97.16')."* The conclusion of §4.4, that marks must be
  carried, stands. The minimal list proved so far is {point}. Sufficient lists
  are 97.13's (point, tensor structure, h, i, j) and CA-77 Prop. 77.2's.
- **Pipeline consequence (for CA-88's successor).** The pipeline's declared
  output must include the named vacancy projections p_j, or equivalently the
  corner/placement maps, along every tower stage. No R0 certificate built
  from R alone can witness the site class [O] or the unit block.

## (d) CONVENTIONS entries needed

(ax) is taken. The F6 proposals await re-lettering from (ay) (CONVENTIONS
(ax), lines 1644-1665). Register this together with F6's proposed "(ba)
Retained records" rather than separately.

**(ay) [or next free] Retained tower records and mark recovery (2026-10-27).**
- **Scope:** CA-97 and its G6 amendment; later fidelity statements.
- **Choice:**
  - R = (A_infinity, {A_[j,k]}, delta) is the interval/dilation record.
  - R^p = R plus the named elements p_j = kappa_j(1_{W_{j-1}} (x) eta eta^dagger).
  - R^(x) = R plus endomorphism concatenation and translations.
  - The fully marked record is that of CA-77 Prop. 77.2 / 97.13.
  - An isomorphism of a record preserves exactly the listed marks.
  - A mark is *naturally recovered* if every record isomorphism transports it.
    It is *recovered up to choice* if some isomorphism does after composing
    with a record automorphism. *Equivalence-class faithfulness* means record
    isomorphism implies a unitary tensor equivalence transporting (O,eta,H)
    as in Theorem 90.1(iv).
  - "Charge translation" O' = sO by an invertible s is the G6-B operation.
- **Known clash:** p_j here is a single-site point projection, not the
  occupation projections p_0/p_1 of (am) placed globally. delta is the 97.11
  endomorphism, not a Kronecker symbol.
- **Source:** G6 NOTE:17-35, :271-296; REVIEW §§1, 4.

## (e) The next lemma

**Target 97.16' — pointed-record faithfulness (open; any/open; L0+fixed
pointed H; R0 information only).** For arbitrary pointed tensor-generating
(D,O,eta,H), does an R^p-isomorphism force a unitary tensor equivalence
transporting eta and H?

- *Positive route:* show that every R^p-isomorphism can be corrected by an
  R^p-automorphism (the G6-C1 type) so that it fixes the hop h = r l^dagger
  and the compressions i, j up to a unitary gauge. Then 97.13 gives t_O, and
  CA-77 Prop. 77.2 gives the equivalence.
- *Negative route:* give an explicit R^p-intertwiner for F6's E-H (H+ vs H-)
  or E-F (different associators) as instances. The obvious diagonal sign gauge
  does **not** intertwine alpha^+ with alpha^- (REVIEW §8).
- A weaker, independent alternative: show that R-isomorphism classes are
  exactly orbits of charge translation by H-transparent invertible objects of
  Z(D). In particular, test whether R is already faithful when D has no
  nontrivial invertible objects.
