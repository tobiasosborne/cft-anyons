GRADE: COUNTEREXAMPLE

2026-10-25, independent round-3 referee. The grade is **to the brief's F1
equivalence**, not a counterexample to the replacement theorems in NOTE.md.
F1.1a–F1.6 withstand the audit at their stated scope. In particular, the
finite-block sufficient theorem, both counterexample families, and the
abelian p-group existence theorem are proved. No characterization of all
local lifts is proved. The 35 numbered steps below are individually audited;
no false numbered step or load-bearing proof gap was found.

Reviewed NOTE.md: 701 lines, SHA256
`fdd74095a2c9ea76651761dd1c2f4c535d09eca4f5585dfbe1ffffee79b27ed7`.
The initial skeleton was saved at 05:26 UTC after a 05:25 UTC start.
All writes are REVIEW.md, INTEGRATION.md and new `checks/review_r3_*` files.
NOTE.md, the earlier internal review, original outputs and manifest are
preserved. No network, commits, Julia suite or report edits.

## Principal findings and attempted refutations

The decisive result is a **sufficient condition on a tensor power**, with
the original algebras and original insertion unchanged. The general proof
uses the full category of interval morphisms; it never assumes that
single-site endomorphisms generate an interval algebra. Its incomplete
final block is handled explicitly. The support estimate is independent of
chain length; it may depend on the chosen finite block length.

For any finite nonabelian group G and noncentral g of order b, take
`O=R⊕g`, `R=⊕_(h∈G) h`, with the point in R's unit summand. Then
`[O][x]−[x][O]=[gx]−[xg]≠0` for some x, but
`[O]^b=[1]+K[R]`, `K=((|G|+1)^b−1)/|G|`. The displayed conjugation action
on block multiplicity spaces supplies pointed transport. Hence (a) holds
and (b),(c) fail. This is a family-level refutation, not an inference from
an S3 computation. CA-90 Proposition 90.2(b) remains valid.

The trilinear associator family separately refutes (b)⇒(c). Its missing
one-site half-braiding does **not** obstruct (a): F1.5 constructs transport
on a finite tensor power in that same family. Failure to solve the
one-site hexagons cannot be sold as a no-go for all algebra lifts.

## Per-step verdicts

Locations refer to NOTE.md. Each row is one numbered step, including both
substeps of F1.5.3. VALID is at the written hypotheses, not at a stronger
periodic, grading-preserving or canonically selected interpretation.

| Step; lines | Verdict | Referee justification |
|---|---|---|
| F1.1a `<1>1`; 65–72 | VALID | T has initial projection Q_10, final projection Q_01; the point is isometric and p1 eta=0. Types use only unitors. |
| F1.1a `<1>2`; 74–77 | VALID | T²=(T†)²=0; Q_00,Q_11 annihilate T,T†. The square is the sum of four orthogonal projections. The two insertion identities follow on p0 and p1 separately. |
| F1.1a `<1>3`; 79–89 | VALID | A fixed adjacent schedule is enough: on the inserted subobject every moved new strand is eta. No braid relation for S off that subobject is used. Unitary-equivalence covariance is proved in F1.6.3. |
| F1.1b `<1>1`; 105–112 | VALID | Replacing the ancillary O by P in CA-90:89–105 is well typed. Full-D naturality handles arbitrary suffix morphisms; splitting t_(R C) cancels the exterior C factor. |
| F1.1b `<1>2`; 114–124 | VALID | Before insertion i, prefix length is (2i−1)b; earlier new blocks lie in that prefix. The old suffix includes Q. Appending Q has injectivity by compression with eta^q. Includes m=0 and q=0. |
| F1.1b `<1>3`; 126–133 | VALID | Tensoring the exact cell identities gives U_L v_block=V_L, with no scalar ambiguity. Conjugation preserves all algebra-map properties. |
| F1.1b `<1>4`; 135–144 | VALID | A cut after ib contributes iff ib is strictly before the endpoint. Consequently f(s)=s+b floor((s−1)/b); the endpoint-after-k case correctly contributes nothing. |
| F1.1b `<1>5`; 146–157 | VALID | Disjoint cell factors outside the cell hull cancel. The displayed endpoint differences are at most 2b−2 and 2b−1; clipping the last cell only improves them. This proves membership, not just outside commutation. |
| F1.1b `<1>6`; 159–164 | VALID | All operations preserve dagger and tensor structure under the explicitly stipulated equivalences. Choices b,t and the fixed schedule are transported. See the detailed F1.6 proof. |
| F1.1b `<1>7`; 166–168 | VALID | Adjacent maps and their composites satisfy WT-1 A1 by associativity. Neither spatial boundary-extension consistency nor arbitrary-placement coherence follows or is claimed. |
| F1.2 `<1>1`; 186–193 | VALID | O contains every simple, so D=C. The regular sum commutes with every group basis element, leaving the nonzero simple-basis commutator of g. |
| F1.2 `<1>2`; 195–203 | VALID | R^k=N^(k−1)R and g^b=1 give the stated binomial expansion. K is integral by its displayed sum; no ring-root cancellation is legitimate. |
| F1.2 `<1>3`; 205–217 | VALID | Equal multiplicities on conjugacy classes make rho a well-defined unitary action. `(khk⁻¹)k=kh` proves grading; rho(k l)=rho(k)rho(l) proves the tensor identity in the untwisted category. The entire unit-grade space, including xi, is fixed. |
| F1.2 `<1>4`; 219–221 | VALID | F1.1b applies for every L. Absence of one-site transport follows from the already-proved noncentrality, not from a finite test. |
| F1.3 `<1>1`; 235–239 | VALID | CA-90:197–204 uses unchanged left/right algebras. Intertwining and its precise support pattern force equality there; dyadic interval containment alone does not. |
| F1.3 `<1>2`; 241–254 | VALID | Restricting finite matrix representations along End(J)⊗End(R') yields N Lambda=T. Unit rows give the two formulas only for x present in both J and R', exactly as stated. |
| F1.3 `<1>3`; 256–268 | VALID | The two indices x⁻¹c' and c'x⁻¹ are conjugate. For P=1+KR, Lambda_(c,c')=K+delta_(c,c') satisfies the entire identity, not just its unit rows. |
| F1.4 `<1>1`; 291–293 | VALID | For abelian grades, equality g+x=h+x forces g=h; each simple crossing is therefore a matrix on M_g. |
| F1.4 `<1>2`; 295–306 | VALID | Both typed paths end at x⊗(y⊗g). Their phases give the stated beta and the reversed product rho(y)rho(x), with no missing inverse. |
| F1.4 `<1>3`; 308–314 | VALID | Orthogonal sums extend the simple crossings naturally; arbitrary morphisms act within each grade multiplicity space. Tensoriality reduces to the preceding path equation. |
| F1.4D `<1>1`; 320–325 | VALID | Swapping x,y gives AB=kappa BA. Determinants give kappa^m_g=1. This is necessary only; the note does not assert sufficiency. |
| F1.4T `<1>1`; 339–350 | VALID | Expanding the displayed trilinear exponent cancels every term. Normalization and unit modulus hold for every prime p. |
| F1.4T `<1>2`; 352–354 | VALID | The basis grades generate all A; its group ring is commutative independently of omega. |
| F1.4T `<1>3`; 356–365 | VALID | Substitution gives kappa=zeta of exact order p at (e1,e2,e3), while the relevant multiplicity is one. This excludes even an invertible nonunitary half-braiding. |
| F1.5 `<1>1`; 376–393 | VALID | The four pentagon quotients expand to exactly the twelve beta-defect factors. Abelianness is used in the cancellations and is explicitly assumed. |
| F1.5 `<1>2`; 395–410 | VALID | Reversing arguments gives a cocycle on the abelian group. The regular matrices are phased permutations whose dimension is the group order, with the required opposite product law. |
| F1.5 `<1>3`; 412–419 | VALID | Frobenius is used in the commutative group ring modulo p; the exponent p^e kills every grade. Coefficients reduce to their original values modulo p. |
| F1.5.3 `<2>1`; 421–428 | VALID | For k≥2, every nonconstant term in `(C+p^(k−1)T)^p` is divisible by p^k. The endpoint p=2,k=2 also works. The scalar exponent advances from n^(p^(k−2)) to n^(p^(k−1)). |
| F1.5.3 `<2>2`; 430–432 | VALID | Taking k=d gives divisibility by the group order of each nonzero-grade coefficient. Zero multiplicity causes no problem; the grade-zero coefficient need not be divisible. |
| F1.5 `<1>4`; 434–438 | VALID | Copies of the regular representation fill every nonzero-grade space exactly. beta_0=1 permits the identity action on the whole zero-grade space, fixing the actual xi. |
| F1.6 `<1>1`; 463–472 | VALID | J has the correct direction F(W_L)→W'_L. Induction using tensorator associativity gives comparison for contiguous splittings and hence interval-algebra transport. |
| F1.6 `<1>2`; 474–485 | VALID | F1.6a has domain F(Y)⊗P' and codomain P'⊗F(Y). Full faithfulness and unitary presentations make extension independent of choices. Here target objects mean those of D'=⟨O'⟩; F restricts to an equivalence D→D' because u identifies their generators. |
| F1.6 `<1>3`; 487–497 | VALID | The defining sum for S and each fixed circuit factor transport termwise. Substitution yields both alpha and V covariance squares. |
| F1.6 `<1>4`; 499–508 | VALID | The composite tensorator gives J_L^(GF)=J_L^G G(J_L^F), including the unit case. Identity requires the identity pointed identification, as the note expressly says. |
| F1.6 `<1>5`; 510–517 | VALID | Monoidal naturality inductively gives J_L^G lambda_(W_L)=J_L^F. Ordinary naturality on a and t then identifies the transported algebra maps and lift. |

The proof's most vulnerable locality calculation can be stated without a
diagram. For `a=1_A⊗a_(J R)⊗1_C`, inserting P between J and R gives

```
beta(a)=1_A ⊗ [(1_J⊗t_R)(a_(J R)⊗1_P)(1_J⊗t_R†)] ⊗ 1_C.
```

This follows by factoring the suffix transport across R C and cancelling
the C factor. J and R may end inside an old block. Iteration, followed by
cellwise conjugation, proves the claimed all-interval support statement.
This direct identity defeats the proposed hidden-Hilbert-factorization
objection; the proof works in C itself.

## Corrections and limits before integration

1. NOTE:579 labels symmetry-preserving, periodic and canonically selected
   versions **conditional**, but states no conditional theorem establishing
   them. Carry these as **open / conjectural**, not as proved conditional
   results. Read as a positive theorem, that ledger line is NOT A PROOF.
   The surrounding disclaimers correctly say these properties are absent.
2. In F1.6.2 write “every object of D'” explicitly. The generator argument
   in the table justifies this restriction; there is no transport claim on
   objects outside the generated subcategory in the general theorem.
3. Keep “pointed” attached to transport, including on P; keep “all of D”.
   A ring-central class alone supplies neither these morphisms nor their
   associator equations. F1.5 is bare-L0 **existence within its stated
   category class**, not a canonical selector of multiplicity bases.
4. R1–R5, periodic seams, grading and spatial net consistency are not
   consequences established here. The elementary compatible vacancy state
   from CA-90:162–164 can be inherited, but gives no new nontrivial Wilson
   convergence or conformal conclusion. Do not describe R0^u as CFT progress
   at any higher rung without the missing state and analytic certificates.

No F/R gauge, dual-versus-dagger, vacuum normalization or bracketing drift
was found. The additive label 0 is the unit grade, not the zero object.
All new equations precede their use in note-local conventions; this is
permitted by the explicit prohibition on canonical-file edits. Rule 16 is
satisfied: arbitrary fusion input first, then broad graded-category
families, with individual categories used as finite calibrations.

## Corrected statement and honest layer tags

**Derived sufficient theorem.** For a unitary fusion C, pointed `(O,eta)`,
full `D=⟨O⟩`, and fixed b≥1, suppose `(O^b,eta^b)` has a specified pointed
unitary relative half-braiding on D. Then every original
`A_L=End_C(O^L)` admits a unital injective *-map to A_(2L), intertwining
the exact odd-site vacuum insertion, with interval slack r=2b−1.
Their dyadic composites are coherent. The construction is covariant under
unitary tensor equivalences transporting the point and blocked datum.
Tags: **(S=any; L=L0+declared blocked H; R reached=R0^u)**, open ordered
chain, fixed block origin. For b=1 the prior CA-90 theorem improves r to 0.

**Derived bare-L0 families.** This holds for the noncentral regular-plus-g
family above and for every pointed object in `Vec_A^omega` when A is a
finite abelian p-group, omega is normalized unitary, |A|=p^d and its
exponent is p^e, with b=p^(e+d−1); the trivial group uses b=1.
Tags: **(any; L0 with the stated class restriction; R0^u)**. The general
existence theorem does not silently move to L1; the nonabelian family
has no braiding on its generated category.

**Negative statements.** In the brief, (a)⇒(b), (a)⇒(c), (b)⇒(c) are
false. Pointed (c)⇒(a) and (c)⇒(b) survive; general (b)⇒(a) remains open.
Tags: **(any; L0; finite feasibility/→R0^u)**, with actual R0^u witnesses
for the counterexamples. The general characterization is not recovered.

## What the brief itself got wrong

- Brief:78–80 says “O any object” but V requires a chosen isometry
  eta:1→O. Objects without a unit summand have no such V.
- Brief:73,80 points to (ar), which is Ward-to-KS notation. The relevant
  entries are (am),(t),(as); the note corrects this accurately.
- Brief:86–88 omits the central-point condition needed by CA-90's specific
  intertwining construction. An arbitrary half-braiding on O is not that
  supplied pointed datum; E1 NOTE:284 already records a failure.
- Brief:89–95 asks to prove a false implication. Unchanged-side one-gap
  inclusion matrices cannot be substituted for refined side algebras.
  Noncentral roots can have tensor powers with pointed transport.
- Brief:94–95 incorrectly treats centrality as necessarily still necessary
  if its proposed sufficiency fails. F1.2 directly refutes necessity.
- Brief:100–101's “characterization or needs L1” dichotomy is false. These
  bare-L0 families reach R0^u while general classification stays open.
  The specified three-summand S3 carrier is still undecided; neither the
  four-letter nor seven-letter calibration decides that different input.

## Independent checks and raw outputs

Run from this note directory:

```bash
python3 -I checks/review_r3_rerun.py > checks/review_r3_rerun_output.txt 2>&1
python3 -I checks/review_r3_multiblock.py --mutate-tail-transport > checks/review_r3_multiblock_red.txt 2>&1
python3 -I checks/review_r3_multiblock.py > checks/review_r3_multiblock_output.txt 2>&1
```

The second command must exit 1; the others exit 0. It was executed before
the restored multiblock baseline. The rerun wrapper replaces the author's
output-writing runner solely to preserve the original bundle; it runs all
four original mathematical scripts, each mutation first, and verifies
expected exit codes **and the named failing invariant**. Individual raw
outputs, exact commands, durations and script hashes are in
`checks/review_r3_rerun_manifest.json`. The slowest rerun took 92.936 s;
each subprocess was capped at 180 s. No dense matrices were constructed.

Fresh results:

- Existing four-letter lift: 4/54/798 interval matrix units at L=1/2/3;
  exact V, unit, dagger, representative products and membership pass.
- Existing seven-letter independent lift: 20,866 interval matrix units
  and 9,131,164 entries pass. Both shuffle-omission mutations fail exact V.
- Both associator scripts pass, including the symbolic monomial identity,
  nonbilinear cocycle, regular products and p-group coefficient checks.
  Phase erasure and sign-error mutations fail their intended invariants.
- **New independent code**, importing none of the author's implementation:
  b=3, L=1,…,7, signed nontrivial block transport in Vec_(Z/2), including
  two complete blocks, both tail sizes and L<b. It checks 832 interval
  units and 803,076 entries, with every exterior context present and
  identical coefficients. All intervals are tested for L≤4; lengths ≤3
  are tested for L=5,6,7. This is an explicit finite cutoff.
- Skipping one tail crossing's transport while retaining the geometric
  move preserves categorical unitarity and exact V, but fails interval
  membership at L=5 on coarse sites [4,5], matrix unit |00><11|. This
  discriminates the full-suffix locality obligation, beyond insertion.

The checks assert invariants and known values; none is a “nothing crashed”
test. They calibrate the written proofs and do not prove the all-L or
all-category quantifiers. Bundle hashes are in `checks/review_r3_manifest.json`.

## Single sharpest next lemma

**Finite-power transport extraction — open conjectural target.** For
arbitrary unitary fusion C and pointed O, assume exactly F1(a): for every
L, a unital injective *-lift of V_L with one uniform finite interval slack.
Must there exist some finite b such that `(O^b,eta^b)` has pointed unitary
transport on full `⟨O⟩`? Prove this or give a counterexample, without adding
unchanged-side, grading or translation hypotheses. Tags:
**(any; L0; →R0^u)**. Together with F1.1b this would yield a genuine
replacement characterization. It is not licensed by the old cut argument;
the unknown side inclusions and associator coherence must actually be
reconstructed. NOTE:626–628 states exactly this remaining question.

## Sources checked

Repository-relative paths; ranges were checked for the uses made in this
note. Prior repository derivations are explicitly allowed by the brief.

- `AGENTS.md` whole; `README.md`; `CONVENTIONS.md` (a)–(aw), especially
  `:631–688,740–761,1450–1470,1524–1543,1564–1576`: pointed object,
  left bracketing, support, dyadic placement and layer tags all match.
- `report/README.md`, `report/SHARD_CATALOG.md`, `report.tex`:
  shard identities and include map; `worklog/022_2026-10-25_round3_sprint.md`.
- `report/sections/76_corner_to_wilson_bridge.tex:90–149`: strict drift,
  representation multiplicities and global unital extension; correctly
  kept separate from locality.
- `report/sections/77_pointed_carrier_invariants.tex:44–82`: actual pointed
  carrier and trailing/corner distinction; no Hilbert tensor-factor claim.
- `report/sections/88_layered_targets.tex:54–56,81–125,149,235,260`:
  declaration/data distinction and exact grid positions; no higher rung.
- `report/sections/90_local_unital_lift.tex:57–141,170–211,245–250`
  (shard read whole): the hypotheses, locality proof, finite equations,
  one-gap quantifiers and still-proposed transport-extraction target match.
- `explorations/2026-10-22-astra-r2/E1-local-unital-lift/NOTE.md:11–26,30–117,151–191,284`;
  `REVIEW.md:12–21,148–168`; `INTEGRATION.md:85–91` in that directory:
  prior proof and exact converse boundary checked, not taken on trust.
- `references/text/PenneysUnitaryFusionCategories.md:5–20,117–135,195–237`:
  linear/unitary categories, semisimplicity, polar decomposition and unitary
  splittings. `:277–288,319–321`: graded tensor product, omega and dagger.
  `:325–348`: tensorators and monoidal naturality. `:395–398`: coherence.
  `:1015–1019`: positive/spherical setting. All support their actual use;
  the older “unitary functor not defined” issue is repaired by NOTE:454–458's
  explicit definition. The extraction's g/q typo at :280 is resolved by
  the independent unambiguous ENO tensor rule below.
- `references/text/EtingofNikshychOstrikFusionCategories.md:39–51,1221–1225`:
  graded fusion category, associator pentagon, central forgetful image.
  Rational surjectivity at :1223 is not used as an object-lifting theorem.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:806–819`:
  associators/unitors and coherence, with equality/isomorphism warning.
- `references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex:897–920`:
  finite restriction multiplicities and Bratteli convention. It supplies
  terminology, not an AF classification theorem; matrix restriction is
  derived locally in F1.3/CA-90.
- `literature/md/1704.04221/1704.04221.md:298–307`: center objects and
  half-braiding direction. It only says “natural conditions”; the full
  axioms used are expressly supplied in CA-90 (H),(90.5).
- `literature/md/1511.08090/1511.08090.md:743–761`: projective centralizer
  multiplication, inverse multiplier and coboundary convention. This is
  contextual support, not a citation for the note's precise orientation;
  the latter is independently derived by its two typed paths.
- Manifests: `references/manifest/SOURCES.md:34–35,56–57`;
  `references/categorical-reconstruction/SOURCES.md:87–106`;
  `references/lattice-symmetry/SOURCES.md:877–910`: source identities match.
- Additional interface cross-checks: `cft_machine/research/wilson_triangle.md:18–42`;
  `literature/md/2010.11121/2010.11121.md:164–180`; CA-68:51–93 and
  CA-75:149–159 at their full paths recorded in INTEGRATION.md.
- All original `checks/*.py`, `checks/README.md`, `checks/manifest.json`,
  `checks/AUDIT-BLOCKING.md`, `checks/associator_proof.md`,
  `checks/associator_general.md`, `checks/REVIEW.md`: checked as prior
  derivations/evidence, not as authority for the verdict. All executable
  mathematical checks were freshly rerun as documented above.
