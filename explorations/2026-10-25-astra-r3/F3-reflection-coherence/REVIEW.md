GRADE: WEAKER-RESULT-PROVED

# F3 reflection-coherence — independent referee report

2026-10-25. Review started 05:33 UTC; skeleton saved 05:37 UTC.
The canonical **individual algebraic seam** is proved. F3(b), and the
unitary-crossing clause of F3(c), have verified counterexamples. The
unconditional whole-history RP assertion is still unproved. This grade
accepts the note's finite replacements without promoting the missing
reflection certificate. One small proof gap in the post-OS version of §I
is identified and repaired below for explicitly specified forms.

All paths below are repository-relative. `N` denotes this directory's
`NOTE.md`, `[P]` denotes `references/text/PenneysUnitaryFusionCategories.md`,
and `E3/` denotes `explorations/2026-10-22-astra-r2/E3-reflection-positivity/`.
I read AGENTS.md whole, the brief and N whole, CONVENTIONS (a)–(aw), the
entry-point maps/worklog, the four cited report shards whole, the cited E3
notes/review/integration, and the cited primary-source passages. I did not
use the author's claimed prior reviewers as evidence.

## 1. What survived the attempted refutations

The crucial distinction is between three objects: a cup-normalized morphism
`s`, a conjugate-dual reflection between oriented cuts, and the involution
`sharp_s=K_s^{-1} dagger K_s` on a tile vector space. They are not
interchangeable. N keeps that distinction in its proved statements.

- §A survives multiplicities, non-self-dual objects and complex dual gauges.
  The cup correction is the positive pivotal twist in the stated convention.
- §§B,D refute an arbitrary unitary self-duality having a scalar square.
  The exact condition is centrality of its defect in the **named** observable
  algebra. On charge Hom spaces the source-charge factor must also be kept.
- §B's two self-adjoint witnesses disprove both implications between
  conjugate-dual invariance and canonical-seam Hermiticity. The connected
  non-pointed example is a genuine categorical morphism, not an arbitrary
  ambient matrix accidentally outside the category.
- §F's braided example excludes either ordinary composition variance for
  `sharp_s_can`. This stronger obstruction assumes the fixed-point iff for
  **all complex tiles**; it is not a theorem about an arbitrary restricted
  physical tile grammar.
- §G remains precisely a conditional application of CA-92. Neither §A nor
  §C proves (G1) or (G2). §H is a valid finite-dimensional improvement, but
  it still needs a positive compatible translated form.
- §I refutes universal unitary conjugacy even with `h=0`, hence even when
  all one-tile Schur conditions hold. Equality of closed contractions survives.

## 2. Per-step verdicts

Repeated step numbers are distinguished by their proof heading. VALID means
valid under that proof's explicit assumptions; it does not discharge those
assumptions for the categorical history.

| Proof and step (N lines) | Verdict | Reason / exact boundary |
|---|---|---|
| A <1>1 (72–85) | VALID | Rigidity gives the one-dimensional vacuum channel. Both vectors have squared norm `d_a`; applying ev gives precisely lambda. Braiding naturality transports it under unitary representatives/dual comparisons. |
| A <1>2 (87–90) | VALID | Isotypic projections are canonical; distinct-simple matrix entries vanish. Centrality/naturality is for `t_O`, not an unproved tensor law for s. |
| A <1>3 (92–101) | VALID | Duality preserves dagger. The mate identity turns each `(i tensor (i^vee)^dagger)coev_a` into `(ii^dagger tensor 1)coev_O`; summing proves A3. This includes repeated simple copies. |
| A <2>1 (103–105) | VALID | Naturality moves i and its dual inclusion through c; the lambda factor cancels on each simple copy. |
| A <2>2 (106) | VALID | Product of unitaries. |
| A <1>4 (108–112) | VALID | Currying is a linear isomorphism by snakes. It proves uniqueness of the correction t, not uniqueness of all seams. |
| A <1>5 (114–119) | VALID | A unitary braided equivalence transports the spherical dual solution and its positive dimension; uniqueness of the unitary spherical comparison is [P]:1019. No full lattice functor is constructed. |
| A4 <1>1 (136–139) | VALID | The displayed inverse of currying is correctly typed. |
| A4 <1>2 (140–142) | VALID | Taking the dagger gives t; solving [P] (3.8.3) by the dagger snake gives `coev_DO=(1 tensor j)ev^dagger`. Independent complex-gauge test passes. |
| A4 <1>3 (143–152) | VALID | The Drinfeld morphism is exactly the one at 2201.00192:266. Substitution gives `u=j t^dagger`; unitarity of t gives `t=u^{-1}j`. |
| B square <1>1 (166–171) | VALID | Exact multiplication gives `[[-7,24],[-24,-7]]/25`; it is unitary and noncentral, not a sign. |
| B square <1>2 (172–180) | VALID | Conjugating Z detects the defect. The three-copy variant also fixes the declared vacuum; (am) permits it. |
| B Hermiticity <1>1 (195–197) | VALID | `h^dagger=h`, conjugation and factor flip each negate h, so their composition fixes it. |
| B Hermiticity <1>2 (198–203) | VALID | CA-92:158–159 gives the displayed antisymmetric outer product. Y,Z are nonzero orthogonal vectors, so the kernel is nonzero anti-Hermitian. |
| B Hermiticity <1>3 (204–212) | VALID | g supplies the converse failure. Dual plus dagger is covariant, whereas the flip-seam adjoint reverses multiplication. |
| C <1>1 (227–230) | VALID | The two arrow reversals cancel; tensor order reverses once. The tensorator's unitarity follows from the assumed unitary dual functor. |
| C <1>2 (232–239) | VALID | C1 is the isometry inner-product computation; dual equivalence gives surjectivity. Target charge is Da, not a silently identified a. |
| C <1>3 (241–247) | VALID | Inverse Gram transforms by conjugation and the sewn leg-cut identity is preserved. This is CA-80 leg sewing, not spatial (RH). |
| C <1>4 (249–259) | VALID | Pivotal naturality gives C2. Both external labels must be compared back by j; braiding supplies no O-to-DO identification. |
| D <1>1 (273–280) | VALID | Substitution gives Ad(z). The center/commutant qualification is exactly necessary and sufficient. |
| D <1>2 (282–292) | VALID | Direct substitution gives `z_W f z_a^dagger`; all comparison maps are typed and unitary. Non-self-dual charges cannot be assigned r_a. |
| D <1>3 (294–301) | VALID | The pivotal transpose sign is scalar only for a simple self-dual object. The two signs divide on Hom(a,W); Hom(a,a) has square +1. |
| D <1>4 (303–308) | VALID | A necessary warning, not a claim that site centrality proves word-level coherence. |
| E <1>1 (319) | VALID | Unitarity of psi, D and j. |
| E <1>2 (320–322) | VALID | The mate identity uses the inverse dual map; since psi is unitary this equals D(psi). |
| E <1>3 (323–329) | VALID | The same pivotal cup identity as A4 closes the calculation. `s_psi` differs from `s_can`, even in the unit-multiplicity corner. |
| F <1>1 (343–353) | VALID | Both inverse composites reduce by the dagger snakes with the stated bracketings. Independent checks verify both directions, not just a matrix rank. |
| F <1>2 (354–363) | VALID | Transporting dagger across a linear bijection gives an involution and exactly F1. This alone is not a geometric reflection theorem. |
| F extension <1>1 (372–374) | VALID | Standard real-form decomposition for a conjugate-linear involution; no multiplicativity assumed. |
| F extension <1>2 (375–377) | VALID | Equality of fixed real forms forces equality of conjugate-linear involutions on the whole complex space. |
| F extension <1>3 (378–384) | VALID | The pair A,B violates both variances. The theorem does not exclude changing graph/composition/ports or restricting the grammar. |
| G <1>1 (409–410) | VALID, conditional | CA-92's algebraic Schur certificate and scalar bound give positive crossing kernels. Uniformity needs the fixed data/common bound in G3. |
| G <1>2 (411–422) | VALID, conditional | G1–G3 supply CA-92:113–118's reflected compression. Automatic G1/G2 is a GAP in the original conjecture, expressly left open here. |
| H <1>1 (436–438) | VALID | Hermiticity of q1 and its compatibility with q0 force radical invariance; no upper bound is used. |
| H <1>2 (439–441) | VALID | The descended form is precisely `<f,Tg>`; positivity makes T positive self-adjoint on the finite quotient. |
| H <1>3 (442–454) | VALID | Divide by a finite norm bound; a whole-space logarithm still requires injectivity. No uniform bound or zero-energy vacuum follows. |
| I <1>1 (468–471) | VALID | Identity strands enforce constancy in time, independently at each site; temporal transfer is identity. |
| I <1>2 (473–486) | VALID | For the specified symmetric column convention, weights factor and `T_x=vv^dagger`, `v^dagger v=d`. This specifies more than equality of a single partition sum. |
| I <1>3, raw transfers (488–490) | VALID | Rank rules out a unitary, also when N=M. Nonzero scalar normalization cannot change rank. |
| I <1>3, OS addendum (491–494) | GAP in N | “Natural spatial OS support quotient” is not defined by a q0 in this proof. Transfer rank alone does not determine an OS radical. The explicit even-torus repair below validates the needed counterexample. |

No numbered proof is merely an unlabelled sketch. G is openly conditional.
The original brief's automatic coherence is **not** proved by this ledger.

**Non-numbered assertions.** The FS audit (N:121–128) is VALID with the
identified oriented cups and cited ribbon convention. [P]:933's
square-one matrix concerns the pivotal-transpose operation on a morphism
space; it must not be substituted for the arbitrary-psi defect z_X.
The pointed and non-pointed example claims are verified exact instances.
The author's non-braiding test compares phases after asserting a hexagon
elimination in its docstring; the independent elimination below supplies
that calculation without restricting unknown braiding phases to roots of unity.

## 3. Repair of the OS addendum; no grade inflation

Use even N,M and the exact unnormalised torus weight
`w(sigma)=product_(x,r) delta_(sigma[x,r],sigma[x,r+1])`.
Declare half-insertion spaces to be **all indicator functions of half
histories**, with reflections `x -> N-1-x` and `r -> M-1-r`. These are
explicit conventions for this reviewer repair, not changes to CONVENTIONS.

For a spatial half history a, let `c(a)` be one when each column is constant
in time, zero otherwise. Direct contraction gives
`q0_x(a,b)=c(a)c(b)`: all columns are independent, so each admissible pair
has weight one. Thus rank(q0_x)=1. For temporal half histories, let b be
read in reflected time order. The same vertical deltas give
`q0_t(a,b)=delta_(a,b) c_t(a)`, where c_t enforces constant columns within
the half. Exactly `d^N` half histories survive. Hence rank(q0_t)=d^N.
Both forms are PSD by their displayed factorizations, so their OS quotients
have dimensions 1 and d^N. This proves the post-quotient obstruction for
these specified all-insertion forms, already for d=N=M=2.

This is a local derivation from CA-86:61–93 and CA-80:70–95, checked by
independent enumeration up to 2^16 histories. Do not promote it to a
statement about arbitrary OS forms, fixed-plane insertions, boundaries or
odd circumferences. For example, restricting the temporal insertions to a
single vector would change its quotient dimension. The uncompressed
counterexample and the brief's refutation need none of these extensions.

## 4. Corrected statement with honest tags

For any unitary fusion C with its specified unitary spherical dual functor:

1. **(S:any; L1; finite →R3, no rung reached)** For every nonzero O the
   formula A1 gives a unitary, cup-normalized algebraic seam, natural under
   unitary braided equivalences. A4 identifies its correction as `u_O^{-1}j_O`.
   Uniqueness is restricted to that cup-correction construction.
2. **(S:any; L0; finite →R3)** D gives antiunitaries between dual-oriented
   charge cut spaces, compatible with leg sewing and double-dual comparison.
   Declared unitary identifications give the exact D2/D3 defects. A declared
   psi gives E1; it does not automatically give observable involutivity.
3. **(S:any; L0+declared s, or L1 for s_can; finite)** F1 is the intrinsic
   Hermiticity iff. Identifying it with conjugate-dual reflection is false
   in general. Neither ordinary composition variance is universally available.
4. **(S:full; L0+G1–G3; finite →R3, conditional)** The certified reflected
   linear history is RP. L1 supplies its individual seam, not G1/G2.
   A chiral variant requires an actual supplied twist/cut certificate.
5. **(S:any; category-free; finite →R3)** Compatible positive q0,q1 and a
   shift-closed finite insertion space yield a positive quotient transfer,
   normalizable to a contraction. This is no existence theorem for those data.
6. **(S:full finite torus; L0, already symmetric L1; negative)** Universal
   unitary directional crossing fails for identity histories, including the
   explicit all-insertion OS quotients just defined.

There is no R0 tower, R1 state limit, R2 mode representation, R3 conformal
net, R4 fidelity, or R5 construction functor here. The note's layer tags
respect this. Examples falsify general assertions; they do not replace the
general construction. No Fibonacci-specific fact is used.

## 5. What the brief itself got wrong

- It promotes the existence of a morphism s to coherent reflection data.
  CA-92:77 expressly warns against that promotion. Braiding exchanges
  `O tensor DO` and `DO tensor O`; it need not identify O with DO.
- “Any declared psi” is too weak: its square defect can be noncentral.
  An FS sign of one simple object is not the square on every charge cut.
- Its functor `(dual then dagger)` is covariant on morphisms. For the
  canonical flip seam the pulled-back adjoint is anti-multiplicative.
  The stronger braided witness can have neither variance.
- It asks for unitary crossing from local positivity. Identity histories
  already have incompatible directional transfer ranks.
- A nonzero H^3 class on Z3 is not a braided calibration. With
  `x=r(1,1)`, `q=zeta^p`, the two hexagons give
  `r(1,2)=r(2,1)=x^2`, then `1=q x^3` and `1=x^3/q`.
  For p=1,2 these contradict each other. A nonconstant **coboundary** is
  the correct nontrivial-associator braided test used by N.
- The brief points to (at) for the seam; the relevant entry is (au).

## 6. Single sharpest next lemma

**Real-self-duality two-tile reflection lemma (conjectural; any at the
algebraic level, full for RP; L0 plus declared psi; finite →R3).**
Assume `psi^vee j_O=psi` with psi unitary. Fix `s_psi` from E1, and construct
word identifications using psi and the unitary anti-monoidal tensorator,
with all associators and external-charge comparisons displayed. First prove
`K_(s_psi)(rho_2(h))=K_(s_psi)(h)^dagger` for every categorical two-site h.
Then prove that the induced cut identification is unchanged under the two
orders of sewing two adjacent bricks, using the actual inverse Gram and
reflected boundary maps. This is the first overlap needed for G1/G2;
state explicitly which remaining generating moves make induction possible.

This is a narrower, testable replacement for automatic canonical-seam
coherence. The real-structure assumption removes the arbitrary-psi square
obstruction; changing from s_can to s_psi avoids the known canonical-seam
composition obstruction. Neither change alone is asserted to prove the lemma.

## 7. Reproducibility and source audit

Run from the repository root with `PYTHONDONTWRITEBYTECODE=1 python3 -B`:

- `checks/review_rerun.py`: three author checks pass; all three author
  mutations fail at the required assertions. All six raw outputs are
  byte-identical to the author's retained files. Raw files are
  `checks/review_{core_output,pointed_output,nonpointed_output,mutation_dagger,mutation_cup,mutation_fs}.txt`.
- `checks/review_duality.py`: complex independent dual gauges, both snakes,
  A4, C2/D2, E1, both inverse bends and F1, plus the non-symmetric braided
  composition witness. Raw: `checks/review_duality_output.txt`.
  `--mutate-dual` remains unitary but fails the **cup equation**; raw:
  `checks/review_duality_mutation.txt`.
- `checks/review_history.py`: direct sums over full torus configurations
  derive both PSD forms and actual quotient dimensions. Raw:
  `checks/review_history_output.txt`. `--mutate-history` fails the temporal
  form invariant; raw: `checks/review_history_mutation.txt`.
- `checks/review_hexagons.py`: symbolic elimination for an unrestricted
  complex x and telescoping for arbitrary normalized coboundaries; raw:
  `checks/review_hexagons_output.txt`.

All independent scripts avoid imports from author code. Assertions test
identities, morphism membership, ranks via exact factorizations or explicit
negative witnesses. The author's `check(True,...)` lines follow substantive
assertion loops; they are not merely “nothing crashed” evidence. None of
these finite computations proves a universal categorical or continuum claim.

**Sources checked (each supports the stated use unless qualified):**

- `[P]:118–135,145–148,219–237`: semisimplicity, dagger, orthogonal sums.
- `[P]:259–288,290–294,319–323`: associator arrow, cocycles, graded Hilbert
  and unitary representation categories. The pointed check declares the
  opposite arrow to some older code rather than mixing the two conventions.
- `[P]:398–430`: oriented duality, graphical bracketing convention, snakes
  and Frobenius reciprocity. Supports A, E, F, not an unsupplied reflection.
- `[P]:682–708,897–905,917–941`: dual mate/tensorator, pivotal comparisons,
  and simple self-duality sign. No arbitrary-psi scalar-square theorem.
- `[P]:992–1030,1032–1047`: dagger-compatible duality, explicit pivotal
  formula, positive spherical traces, unique unitary comparison, direct
  sums, and FS convention. Several are exercises; N uses them as such.
- `literature/md/2201.00192/2201.00192.md:264–268`: exact Drinfeld formula;
  supports A4, without supplying graph reflection or a full R5 theorem.
- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2296–2314`:
  braiding convention and `R_1^{aa}=nu_a theta_a^{-1}`. Used only in its
  self-dual ribbon setting; N's general seam proof is independent of it.
- `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:175–190,251–265,353–380`:
  confirms the self-dual, multiplicity-free, FS=+1 and trivial-bending
  restrictions, dagger gluing and gauge-dependent bending phases. It does
  **not** prove the general reflection conjecture, and N does not claim it does.
- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:70–125`:
  leg-cut sewing, positive seam criterion, temporal rows and finite collars.
- `report/sections/86_spacetime_trotter_dictionary.tex:61–110`:
  linear history grammar. At h=0 its exponential remainder vanishes exactly.
- `report/sections/88_layered_targets.tex:54–56,82–120,129–155,233–254`:
  microscopic declarations, layers/rungs, CA-92 row and round-2 placement.
- `report/sections/92_spatial_seams_and_reflection_positivity.tex:53–79,81–149,157–177,181–205,226–240`:
  s, rot, RH, disjoint-seam compression, Schur certificate, flip formula,
  finite OS and the old unproved coherence proposal. Uses in A–I match.
- `CONVENTIONS.md:48–106,631–694,1397–1469,1524–1543,1577–1605`:
  unit/gauge/bracketing, raw cups, linear history, allowed unit multiplicity,
  layer tags, parity distinction and the spatial seam.
- `E3/NOTE.md:14–55,122–214,286–362`; `E3/REVIEW.md:67–147,166–184,236–254`;
  `E3/INTEGRATION.md:47–136`: conditional pairing and prior open target.
  The older claim that a **coherent** seam is automatic at L1 is superseded,
  not evidence for G1/G2. N corrects this distinction.
- Registration: `references/manifest/SOURCES.md:35,57`,
  `references/category-theory/SOURCES.md:27–147`, `references/cft/SOURCES.md:74–122`.

No unsupported external citation was found in the finite seam/defect proofs.
The primary defect is the missing universal graph-reflection theorem; the
post-OS sentence additionally needs the explicit form repair above.
