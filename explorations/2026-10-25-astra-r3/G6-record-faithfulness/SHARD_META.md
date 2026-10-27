# CA-102 registration package — 2026-10-27, round 4

Prepared for the integrator; the registrations and amendments below are proposals,
not edits to their destination files. Pillar **P1**: carry the vacancy point along
the indefinite-number tower. **P4 / R4**: record the resulting fidelity
insufficiency, without claiming a continuum certificate. Binding review grade:
**COUNTEREXAMPLE** to the positive form of Target 97.16.

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-102-RECORD-FORGETS-THE-POINT`

- Source: `report/sections/102_record_forgets_the_point.tex`
- Title: The Interval/Dilation Record Forgets the Point
- Summary: The interval/dilation record does not determine the pointed input: charge translation in an abelian graded family preserves every interval and the fixed-H refinement while changing the site class, refuting the positive form of Target 97.16.
- Summary: Cut commutants are intrinsic, but vacancy projections must be carried; even named points do not make placement maps natural. Pointed records separate the tested counterexamples, while general pointed-record faithfulness remains open.
- Keywords: vacancy, pointed record, interval algebra, dyadic refinement, relative commutant, charge translation, half-braiding, naturality, fidelity, P1, G6
```

## 2. `report/README.md` include-order row

```markdown
| 102 | `CA-102-RECORD-FORGETS-THE-POINT` | `report/sections/102_record_forgets_the_point.tex` | The Interval/Dilation Record Forgets the Point |
```

## 3. `report.tex` include

```latex
\include{report/sections/102_record_forgets_the_point}
```

## 4. Proposed `CONVENTIONS.md` additions

The registered entries (a)–(aw) were checked for overlapping notation. Reuse
(r), (am), (aq), (as), and the shard-scoped CA-97 notation admitted by (ax).
In particular, do not register the point, trailing tower, dyadic shuffle,
`H`, `delta`, `kappa_L`, or the typed `r,l,h,i,j` again. The first proposal
below extends F6's pending “Retained records” entry
(`explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/SHARD_META.md:84-100`);
merge it there when registering that package. Letters (ay) onward are provisional
until the integrator resolves the cross-package collisions recorded in (ax).
No `R^(tensor)` notation is proposed: CA-102 does not use it.

```markdown
## (ay) Pointed records and natural recovery of marks (2026-10-27)
**Scope:** CA-102 and the pointed-record replacement of CA-97 Target 97.16;
an extension of F6's pending retained-record convention, not a second definition of R.
**Choice:** With R = (A_infinity, {A_[j,k]}, delta) as in CA-97 Target 97.16,
R^p = (R, {p_j}_{j>=1}), where p_j = kappa_j(1_{W_(j-1)} tensor eta eta^dagger)
is a named element of A_[j,j]. An R^p-isomorphism preserves every named interval,
intertwines delta, and transports each p_j. A mark is naturally recovered if every
record isomorphism transports it. Recovery up to a coherent choice permits
composition with a record automorphism; equivalence-class faithfulness asks only
whether record isomorphism forces a pointed unitary tensor equivalence transporting H.
Use m_L(1) for CA-97's m_L[1], the size of the unit matrix block containing the
rank-one all-vacancy projection p_1 ... p_L.
**Known clash:** p_j is the site-j placement of (am)'s p0, not its occupation p1;
it is unrelated to the current p_j in (n). These projections do not by definition
include the phase or typed compression/placement identifications of CA-97 97.13.
**Source:** `explorations/2026-10-25-astra-r3/G6-record-faithfulness/NOTE.md:17-35,271-296`;
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/REVIEW.md:138-163,208-219`.
**Sweep status:** proposed for CA-102; merge with F6's retained-record proposal under (ax).

## (az) Cut multiplicity spaces (2026-10-27)
**Scope:** CA-102 Lemma 102.1.
**Choice:** At a cut m|n, V_m^x = Hom(x,W_m), V_n^y = Hom(y,W_n),
F_xy^z = Hom(z,x tensor y). Orthogonal simple splittings identify the z-block
of A_(m+n) with End(direct-sum_(x,y) V_m^x tensor V_n^y tensor F_xy^z);
zero summands are omitted. The relative commutant is taken inside A_(m+n),
not inside all bounded operators on a Hilbert-space representation.
**Known clash:** F_xy^z is a multiplicity space, not an F-symbol or associator;
V_m^x is not (am)'s placement V_phi. Labels x,y,z in the displayed splitting
are chosen simple representatives, not names retained intrinsically by R.
**Source:** `explorations/2026-10-25-astra-r3/G6-record-faithfulness/NOTE.md:43-99`;
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/REVIEW.md:70-73`.
**Sweep status:** proposed for CA-102 only; the delta-moved claim has layer L0+H.

## (ba) Charge translation and transparent transport (2026-10-27)
**Scope:** CA-102 102.2–102.4 and its examples table; a proved subclass of the
general record construction, not a convention identifying every fusion category with it.
**Choice:** For finite abelian G with trivial associator, O has multiplicities m(a),
O' = sO translates each grade a to sa while retaining its multiplicity space, and
R_G = direct-sum_(a in G) a. U is the degree-s Hilbert unitary on the named bases,
U_L = U^tensor L, phi_L = Ad U_L, phi_0 = id, and Phi is their trailing-limit map.
U is not a categorical morphism when s != e. The optional transport is
t_Y(y_a tensor v_b) = chi(a,b) v_b tensor y_a for a unitary bicharacter chi;
s is transparent here iff chi(a,s) = chi(s,a) = 1 for every a in G.
Group notation in the proof is multiplicative (unit e); cyclic examples are
additive mod q (unit 0), and listed grades include multiplicities. A displayed
point is a unit basis vector, the first unit copy when there are several.
**Known clash:** R_G is an object, not a record or braiding matrix; U_L is a
charge-shifting Hilbert unitary, not CA-97 97.12's categorical diagram gauge.
Transparency refers to these two bicharacter equations, not an unstated modular assumption.
**Source:** `explorations/2026-10-25-astra-r3/G6-record-faithfulness/NOTE.md:101-200`;
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/REVIEW.md:99-136`;
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/checks/review_g6_checks.py:9-16,230-258`.
**Sweep status:** proposed for CA-102 only; no Deligne-product extension is registered as proved.

## (bb) Point-fixing automorphism and naturality test (2026-10-27)
**Scope:** CA-102 Proposition 102.5.
**Choice:** u is a noncentral unitary in End_C(O) with u eta = eta and the
additional ancillary-slot condition t_Y(1_Y tensor u) = (u tensor 1_Y)t_Y.
Set C_0 = C_1 = 1, C_L = 1_O tensor u^tensor(L-1) for L >= 2,
gamma_L = Ad C_L, and gamma the trailing-limit automorphism.
T: A_[1,1] -> A_[2,2] is the standard translation b -> 1 tensor b;
theta(b) = p0 tensor b is the left-insertion corner. The r,l,h of 97.13 are reused.
**Known clash:** C_L is an onsite unitary, not the category C or a continuum control;
T is an interval translation, not a modular matrix or KS mode; h is the placement
hop of 97.13, not a Hamiltonian density. The ancillary-slot condition is not
implied by H-naturality in Y. Fixed range projections do not fix the corner maps.
**Source:** `explorations/2026-10-25-astra-r3/G6-record-faithfulness/NOTE.md:202-269`;
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/REVIEW.md:82-85`.
**Sweep status:** proposed for CA-102 only; this tests naturality, not equivalence-class recovery.
```

## 5. Dated amendment pointers

All anchors below are literal text in the current files; ignore source line wrapping
when matching. The worklog already contains a partial correction, so its amendment
also narrows the surviving overgeneral statement. No destination is edited here.

**CA-97 status.** File: `report/sections/97_what_the_tower_remembers.tex:11-14`.
Append after: `all statement locators refer there.`

```latex
\emph{Amendment (2026-10-27, round 4):} G6's review grade is COUNTEREXAMPLE to the positive form of Target 97.16 (now negative, CA-102 102.4); the pointed replacement 97.16\('\), stated as Target 102.9, is conjectural, with (any/open; \(\mathsf L0+H\); \(\mathsf R0\) information only), serving pillar P1 by retaining the vacancy.
```

**CA-97 target.** File: `report/sections/97_what_the_tower_remembers.tex:265-272`.
Append after: `Neither 97.12 nor 97.13 answers this question.`

```latex
\emph{Amendment (2026-10-27, round 4):} The positive form is refuted: in the abelian graded family with trivial associator and flip or translation-transparent bicharacter transport, \(O'=sO\) yields an exact interval-and-dilation record isomorphism between inequivalent pointed inputs (CA-102 102.2--102.4, negative; any/open; \(\mathsf L0+H\); \(\mathsf R0\) information), whereas the replacement Target 97.16\('\) asks whether \(\mathcal R^p=(\mathcal R,\{p_j\})\) forces a unitary tensor equivalence transporting \(\eta,H\) (102.9, conjectural).
```

**CA-97 extraction.** File: `report/sections/97_what_the_tower_remembers.tex:206-218`.
Append after: `This recovers supplied \(H\), not \(H\) from arbitrary local lifts.`

```latex
\emph{Amendment (2026-10-27, round 4):} The point used by 97.13 is not recoverable in general from \(\mathcal R\), so it is a necessary carried mark (CA-102 102.4, negative; any/open; \(\mathsf L0+H\); \(\mathsf R0\) information), and even named points do not make the typed placement identifications natural (102.5, derived under (G6.5)).
```

Paired CA-97 metadata correction, required by INTEGRATION:59-61: replace the second
`SHARD-SUMMARY` line with the following and mirror its text in the catalog's second
Summary item when integrating; the title/include-order row does not change.

```latex
% SHARD-SUMMARY: Fixed-H dyadic shuffles descend with identity K_0 action; abstract diagrams forget H and named finite compressions recover it; interval/dilation reconstruction fails without the point, while with named points it remains open (CA-102).
```

**CA-77 sufficient record.** File: `report/sections/77_pointed_carrier_invariants.tex:75-81`.
Append after: `Braiding and twist must be marked separately.`

```latex
\emph{Amendment (2026-10-27, round 4):} The point-dependent placements cannot simply be discarded: even algebras with every named interval, fixed-H refinement, translations and endomorphism concatenation fail to determine the pointed input without the vacancy mark (CA-102 102.2--102.4, negative; any/open; \(\mathsf L0+H\); \(\mathsf R0\) information).
```

**CA-90 functoriality converse.** File: `report/sections/90_local_unital_lift.tex:121-123`.
Append after the theorem's complete statement, ending: `form a coherent directed system of unital injective \(*\)-maps (WT-1 A1).`
(This leaves the continuous (iv)/(v) sentence intact.)

```latex
\emph{Amendment (2026-10-27, round 4):} The converse to (iv) fails at the record level: the dyadic refinement and named interval filtration need not determine \((O,\eta,H)\) up to pointed unitary tensor equivalence (CA-102 102.4, negative; any/open; \(\mathsf L0+H\); \(\mathsf R0^u\) information), without changing this theorem's existence result.
```

**CA-88 information and fidelity annotations.** File: `report/sections/88_layered_targets.tex:112-116`.
Append after: `\(S,T\) agreement alone is the \emph{minimum} target, not categorical fidelity (\path{realisation_and_fidelity.md}:46--56).`

```latex
\emph{Amendment (2026-10-27, round 4):} CA-102 adds an information obstruction at (any/open; \(\mathsf L0+H\); \(\mathsf R0^u\)) in dyadic geometry: the interval/dilation record does not determine the pointed input (102.4, negative), so the \(\mathsf R4\) insufficiency annotation now names the vacancy as the first missing mark proved necessary; no existence or attainment cell changes and 93.8 still requires \(\mathsf R3\) and its certificates.
```

**Worklog 023 §4.4.** File: `worklog/023_2026-10-27_status_overview.md:179-188`.
Append after: `limit sectors (93.8), never a reconstruction from the limit.`
Use the following requested literal amendment text in the next worklog chunk's
correction to §4.4; do not silently rewrite the historical entry.

```latex
\emph{Amendment (2026-10-27, round 4):} G6-B, reviewed COUNTEREXAMPLE and lifted as CA-102 102.2--102.4 (negative; any/open; \(\mathsf L0+H\); \(\mathsf R0\) information), proves loss of the vacancy/point for abelian graded categories with trivial associator and translation-compatible transport, using the same category on both sides; the earlier phrase ``every C with a suitable invertible object'' exceeds the proved scope, and whether the record with named points forgets \(F\) or \(H\) remains open (Target 102.9 = 97.16\('\)), while the richer sufficient records are those of 77.2 and 97.13.
```

**Pipeline consequence for CA-88's successor.** No successor filename exists yet;
the concrete staging destination is `report/sections/88_layered_targets.tex:250-256`.
Append after: `data the next rung needs as part of the statement, as the restatements above do.`

```latex
\emph{Amendment (2026-10-27, round 4):} To serve P1 and subsequent fidelity, the pipeline's declared output must carry named vacancy projections at every tower stage, or richer coherent placement data determining them, because \(\mathcal R\) alone cannot universally certify the site class or identify its unit block (CA-102 102.4, negative; any/open; \(\mathsf L0+H\); \(\mathsf R0\) information); this does not assert sufficiency of \(\mathcal R^p\).
```

The CA-88 results-table row proposed by INTEGRATION:45 is:

```latex
CA-102 & any/open & \(\mathsf L0+H\) & \(\mathsf R0\) information & cut commutants 102.1 [derived]; pointed-input faithfulness 102.2--102.4 [negative]; 102.5 [derived, naturality only]; 102.6 [derived for tested instances]; pointed-record target 102.9 [conjectural] \\
```

## 6. One-line `INDEX.md` fragment

```markdown
| `explorations/2026-10-25-astra-r3/G6-record-faithfulness/checks/` | CA-102 / P1, reviewed COUNTEREXAMPLE to positive 97.16: run `python3 -I explorations/2026-10-25-astra-r3/G6-record-faithfulness/checks/check_translation.py` and the sibling `review_g6_checks.py`; `translation_output.txt` (exact matrix units), `review_g6_output.txt` (NumPy phase/point-block checks), `red_dilation.txt` and `review_g6_mutations.txt` record GREEN calibrations and rejected mutations; six mutations reproduced on 2026-10-27; these finite checks do not prove the all-length theorem. |
```

## 7. Worklog paragraph

**Verdict: COUNTEREXAMPLE to the positive form of CA-97 Target 97.16; CA-102 draft and registration package prepared.** **Context / pillars:** P1 requires carrying the vacancy in `O = 1 (+) X`; P4/R4 receives an insufficiency annotation only. **What changed:** lifted the reviewed G6 note into `report/sections/102_record_forgets_the_point.tex`: 102.1 cut commutants [derived; any/open; L0+H; R0 finite information]; 102.2/102.4 exact simultaneous interval/dilation counterexamples and inequivalence, including connected sites [negative; any/open; L0+H; R0 information, inherited R0^u]; 102.3 transparent-bicharacter extension [derived; same tags]; 102.5 point-fixing automorphisms moving corners/h/concatenation [derived; any/open; L0+H+(G6.5); R0 marks, naturality only]; 102.6 point-block separation of the three tested instances [derived; any/open; L0+H; R0 information]; 102.7 corrected inventory [derived; same tags]. The Deligne-product sketch is conditional and unused (102.8, Law-1 gap); the single next target is pointed-record faithfulness, 102.9 = 97.16' [conjectural; any/open; L0+H; R0 information only]. **Why these choices / corrections to the brief:** the decisive ambiguity translates the site within the same category, rather than changing its associator; the positive intuition that intervals plus delta recover all marks is false; non-natural marks and recovery up to a coherent choice are separate questions. **Frictions / dead ends:** G6-A's delta-moved assertion needs L0+H, its dimension argument needs the unitary/FP bridge ENO:1700-1706, the commutant labels are not intrinsic, the mechanism is proved only in the abelian trivial-associator family with compatible H, B2 requires distinct automorphism orbits (different orders suffice), and the challenged inventory row gives embeddings only, not identifications. Removed the nonexistent G6-D citation; different-associator/different-H tests remain open. Worklog 023 §4.4 already says “the point” but still overgeneralises to every C with a suitable invertible object; the package supplies the narrower dated correction. **Acceptance:** standalone wrapper copies the root preamble verbatim and compiles with `latexmk -pdf -interaction=nonstopmode -halt-on-error`; shard is under 280 lines; author output matches its stored bundle byte-for-byte, reviewer output matches excluding timings, and all six intended mutations fail at their expected assertions. **Pointers:** G6 `NOTE.md`, `REVIEW.md`, `INTEGRATION.md`, `checks/`; CA-77/88/90/97; local Penneys and ENO anchors are in CA-102. Global registration, amendments and main-report build remain for the integrator under the two-file scope of this task; no commits or network operations were performed.

## Local verification commands

From the repository root, run the two commands in the INDEX fragment. The author
mutations are `--mutation grade`, `--mutation interval`, `--mutation dilation`;
the reviewer mutations are `--mutation chi_both_s1`, `--mutation chi_target_only`,
`--mutation shift_per_site`. Each must fail with the documented `AssertionError`.
The reviewer script uses NumPy `allclose` with `atol=1e-12` and its default relative
tolerance (`checks/review_g6_checks.py:31,180`); it is not an exact-symbolic proof.

The standalone compile used `/tmp/ca102-wrapper-h95hxg9s/wrapper.tex`, containing
the exact `report.tex` preamble followed by `\begin{document}`, an absolute
`\input` of CA-102, and `\end{document}`. Build from that directory:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error wrapper.tex
```

Final local acceptance: 246 shard lines, nine sequential statements with grades,
setting/data/rung tags and NOTE/REVIEW locators, one next target, five-page wrapper
PDF, no undefined commands or references, and no overfull/underfull boxes. The two
header summaries, title, keywords, table row and include line were checked against
this registration package; all eight amendment anchors match the current files.

The root structural guard is an integration-stage check: its include/catalog/map
requirements cannot pass for this deliberately unregistered shard without the
global edits expressly excluded from this task.
