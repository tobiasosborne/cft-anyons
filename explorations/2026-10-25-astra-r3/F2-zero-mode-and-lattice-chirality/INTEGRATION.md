# F2 integration recommendation — 2026-10-25

Review grade: **WEAKER-RESULT-PROVED**. This is a recommendation for later
integration, not an edit to the report. The authoritative review is
`REVIEW.md` in this directory. Preserve its qualifications D1–D4.
The original zero-mode conjecture F2(a), unrestricted lattice-chirality
no-go and sharp F2(c) remain open.

## (a) Statements safe to lift, with grades

Use the following general statement before any categorical example.

**Conditional KS theorem.** On a **nonzero** common Hilbert tower with
standard nearest-neighbour KS modes and both VR-1 certificates, let
`S_n=Tbar_-n`, `C_mn=[L_m,S_n]`, `X_q=C_q0` and

    gamma_m = (m^3(c_R*-c_L*)-m(c_R-c_L))/12.

Then `c_L*=c_R*` without parity or current conservation. Finite ZC,
limiting `X_0=0`, and all limiting mixed commutators zero are equivalent;
when they hold, also `c_L=c_R`. Exact total-current conservation is a
sufficient certificate. Once a mixed limit is zero, its finite `(s,2)`
norm is bounded by the four-term A3 tail in NOTE:77–80. The theorem does
not establish automatic ZC or a local conformal net.

Tags: **(full/periodic; category-free with declared KS realization and
analytic certificates; R2 conditional)**. L0 suffices for the categorical
finite ingredients, with the periodic representation explicitly declared.
No braiding, modular data, central-charge lift, characters or particular
fusion rule is used in the proof.

| Statement / provenance | Grade to carry | Honest setting, data and rung |
|---|---|---|
| F2-G: uniform finite/core commutator equivalence and explicit tail, NOTE:63–100 | **derived implication** from A1–A3 | (any; category-free; transport ingredient ->R2). A4 is unnecessary here. |
| F2-B: remove equal-ledger and parity hypotheses from the zero-mode reduction, NOTE:149–269 | **conditional** | (full; category-free; R2 given both certificates and X_0=0). |
| F2-B0: exact current conservation supplies X_0=0, NOTE:271–277 | **conditional** | Same cell; standard nearest-neighbour prescription. |
| F2-Cubic: cubic balance without parity or ZC, NOTE:279–354 | **conditional**, with H!=0 stated | (full; category-free; R2 restriction). Equality of the two linear ledgers without ZC additionally follows if each c=c* normalization is declared. |
| F2-absent: scalar right stress excludes a nonzero left cubic anomaly, NOTE:356–363 | **conditional** | (full, delineating a one-family target; category-free; R2 restriction). Do not infer scalar left stress without parity. |
| F2-N: every logarithm branch can fail current identification, NOTE:102–147 | **negative, derived** | (full; L0 unit multiplicities; trivial R2 tower). It is not a counterexample to ZC. |
| F2-Aalg: formal Jacobi/dagger/parity/grading do not force X_0=0, NOTE:365–453 | **negative, derived at formal algebra level** | (formal Fourier grading; category-free; no Hilbert R2). |
| F2-R(i),(ii): cut-current, continuity and Fourier identities, NOTE:455–504 | **derived** | (periodic; category-free; finite identities). Commutation range suffices algebraically; bounded density support is needed for spatial locality. |
| F2-R(iii): component bounds imply the needed Fourier remainder vanishes, NOTE:506–536 | **conditional** | (full; category-free; ->R2/R2 restriction). The component bounds are added analytic data, not consequences of finite range. |
| F2-Spec: inverse target compression with p>1, NOTE:540–611 | **conditional** on the supplied target, projections and S1 | (declared chiral target, no local spatial tower; L4-type target input; abstract mode R2). Not a category-to-CFT construction. |
| F2-Kernel: AP spectral derivative and fixed-separation nonsummable tail, NOTE:613–641 | **derived** | (periodic Fourier regulator; category-free; finite identity/asymptotic). |
| F2(a): automatic ZC under its original hypotheses | **conjectural** | (full; category-free; R2 target, no new certificate). |
| General finite-range finite-site physical no-go | **conjectural in this record** | A prospective R3-level statement requiring an applicable microscopic theorem and a limit identification. |
| Sharp F2(c), changing only range or only site dimension | **conjectural** | No such retained-hypotheses example is supplied. |
| Review D1: commutation range does not imply spatial support | **negative, derived** | (periodic; category-free, L0 unit-multiplicity instance; finite support diagnostic). |

The strongest algebraic formulation needs only the two opposite internal
brackets and the scalar antisymmetry identity B1 on a common invariant
domain. State it at that category-free layer; explain separately how the
nearest-neighbour KS identity and VR-1 supply its hypotheses. The real
mathematical content is B1–B5 and C1–C3, not any example-specific matrix.

A useful shard split is one shard for G/B/Cubic and their corollaries,
and, only if wanted, a second for the logarithm/formal-algebra obstructions
and finite-range extension. Keep the inverse spectral example subordinate
or in the exploration; it is not needed to state the main theorem.
Do not preallocate a CA number while other sessions are adding shards.

## (b) Exact CA-88 grid changes and non-changes

“Moves” below means strengthened information **within** a cell, not promotion
to a higher rung. The source of the grid is
`report/sections/88_layered_targets.tex:58-125,129-155`.

| Exact location / cell | Change allowed | What does not move |
|---|---|---|
| Definition 88.3, R2 row (:105): `(S_full; category-free; R2 conditional)` | Add parity-free cubic balance and the G/B equivalence to the two-family certificate entry. | No new categorical realization or automatic A2–A4/ZC certificate. |
| Existing-results CA-91 row (:150), same cell | Replace “parity ledger balance” as the only supplier by: cubic balance unconditionally within certified standard KS; both ledgers and all mixed brackets under one zero-mode certificate. | The rung remains R2 conditional. The old parity theorem remains correct. |
| WT-1/VR-1 row (:137), `(any; category-free; ->R2 analytic interface)` | Add the finite/core equivalence and explicit loss-two tail as an annotation to the mode contract. | No WT-1 state construction, no R1 upgrade. |
| CA-79 row (:143), `(S_full; L0; ->R2)` | Its mixed-bracket certificate may be reduced to ZC once **both** families satisfy common VR-1; equal ledgers need not be an independent input. | P0–P3 are not verified for any new local categorical chain. The ->R4 character/fidelity entry is untouched. |
| CA-89 row (:148), `(S_full; category-free; ->R2)` | Its transfer conclusion may use G/B for mixed contacts after both family certificates and ZC have been supplied on the same system. | W2, admissible A2 and differentiated refinement matching remain obligations. |
| LC-4 row (:155), `(S_full; L0; ->R1, ->R2)` | Replace an independent all-mixed-residual obligation by one ZC certificate under the exact G/B assumptions. | Local unital maps, state compatibility, and the geometric anomaly match remain separate. |
| Formal obstruction F2-Aalg | An off-ladder negative annotation is allowed. | It occupies no Hilbert-space R2 cell. |
| Target-first F2-Spec | Record an additional **abstract mode** R2 construction with supplied target data. Its regulator has no claimed local R0. | Do not insert it as a new `(S_ch open-chain; L4; local R0–R4)` success: the example is periodic and nonlocal, while Definition 88.1 defines S_ch using an open chain. Name that different regulator explicitly. |
| All R0^c/R0^u, R1, R3, R4 and R5 cells | No new completed rung. Finite support/current formulas may be listed as ingredients. | No new local refinement, Wilson state, net, sector fidelity or functoriality theorem. |

By CA-88:122–125, the category-free implications can be reused at every
categorical data layer when their microscopic/analytic hypotheses are
supplied. This does not certify bare `(L0; R2)` existence. Likewise the
inverse target cutoff does not import a compatible local observable or
Wilson-state tower.

**Definition 88.1 source gap (:73–80): narrowed in scope, not closed.**
The certified standard-KS obstruction to a nonzero *net cubic anomaly*
now needs neither parity nor current conservation. It does not exclude
chiral subnets, open-chain constructions, modified stresses or nonlocal
regulators. The broad primary microscopic theorem is still missing from
the verified evidence chain. The local Li–Lin–McGreevy–Shi–Kim passage
states the broader anomaly objection, but does not prove the needed
lattice theorem with hypotheses there. Replace “nearest source” with the
precise new pointer, while retaining the source-gap warning.

## (c) Dated amendments other shards need

These are proposed **pointer additions**, not silent rewrites of historical
claims. Replace “reviewed F2 result” by the eventual shard reference when
integrated. No files outside this directory were edited by this review.

- **CA-91, Two Corrections Recorded First (:58–62):**
  “Amendment (2026-10-25, reviewed F2-B): on a nonzero common standard-KS
  VR-1 system, equal anomaly ledgers no longer need be assumed for the
  zero-mode reduction. The limiting zero-mode equation implies both ledger
  equalities and all mixed brackets. The original automatic-zero-mode
  question remains open.”
- **CA-91, Theorem 91.5 (:124–139):**
  “Amendment (2026-10-25, reviewed F2-G/F2-B): finite loss-two ZC is also
  necessary for limiting zero-mode commutation under common A1–A3, with
  the explicit word-tail bound. With both standard-KS certificates, omit
  the separate equal-ledger hypothesis. No automatic ZC is asserted.”
- **CA-91, Theorem 91.6 (:141–150):**
  “Amendment (2026-10-25, reviewed F2-G): after mixed commutation is
  established, summable A3 tails give a loss-two finite bound. The older
  loss-four MW bound is a different quantitative certificate using its
  listed local constants; it is not invalidated.”
- **CA-91, Proposition 91.7 / next lemma (:152–163,233–237):**
  “Amendment (2026-10-25, reviewed F2-N): (12) is not automatic for any
  choice of logarithm branch. The zero-density unit-multiplicity tower
  has ZC=0 but every logarithm stays at distance at least N/2 from D.
  Retain (12) only as an additional sufficient hypothesis; pursue the
  fixed-coarse-vector zero-mode lemma.”
- **CA-91, Corollary 91.10 and delineation (:176–188,223–231):**
  “Amendment (2026-10-25, reviewed F2-Cubic/F2-absent): absent right stress
  implies zero left cubic anomaly even without parity. The conclusion
  that the entire left stress is scalar still uses parity in 91.10.”
- **CA-91, range qualification (:70–71 and further-open paragraph :238–240):**
  “Amendment (2026-10-25, reviewed F2-R): explicit cut currents and a
  finite-range Fourier remainder are available. Passing that remainder
  to zero requires component graph bounds or a direct substitute;
  spatial locality additionally requires bounded-support densities.”
- **CA-79 (:94–96):**
  “Amendment (2026-10-25, reviewed F2-G/F2-B): under common two-family
  VR-1, all mixed residuals reduce to finite loss-two ZC with an A3-tail
  bound; equal ledgers/parity are not separate inputs.”
- **CA-89 (:113–115):**
  “Amendment (2026-10-25, reviewed F2-G/F2-B): use the single zero-mode
  certificate for the two-family conclusion on the same system. This
  does not prove the Ward-to-operator or differentiated matching bounds.”
- **CA-81 (:95–114):**
  “Amendment (2026-10-25, reviewed F2-G): a zero limiting mixed word
  difference has a uniform finite graph bound given by its summable
  transport tail. The distinction between a mode representation and
  compatible local OAR/state data remains.”
- **CA-88 (:73–80,105,137,143,148,150,155):** use the exact cell changes
  in (b), with the parity-free cubic statement and the source gap retained.
- **LC-4, `reconstruction/04_cutoff_oar.md:75-82,117-132`:**
  “Amendment (2026-10-25, reviewed F2-G/F2-B): for the stated standard
  nearest-neighbour tier with both common VR-1 certificates, a single
  loss-two zero-mode certificate supplies every mixed residual through
  explicit A3 tails. Matching the geometric anomaly and physical
  normalization remains an independent demand.”

The eventual shard/catalog/README/include and run-index entries should
point to this review and its raw outputs; the current task expressly
forbids making those root edits now. Existing report builds and commits
are therefore outside this review's authorized write scope.

## (d) CONVENTIONS entries needed at integration

Do not modify (a)–(aw) retroactively or conflate the following symbols.
A new dated, shard-scoped entry can extend (at); allocate its letter when
integrating, since parallel sessions may add entries.

1. **Mixed-bracket bookkeeping:** `S_n=Tbar_-n` (reverses the index),
   `C_mn=[L_m,S_n]`, `X_q=C_q0`, and gamma with the exact **right-minus-left**
   ledger sign. The cubic coefficient c* and the linear coefficient c
   remain independent; c=c* is declared normalization or a proved equation.
   Say H!=0 whenever scalar coefficients are identified from an operator
   identity. Do not rename gamma an anomaly coefficient of a new theory.
2. **Transport tail:** fix graph loss d, nonnegative integer s, the A2/A3
   family superscripts, and the four terms in NOTE:77–80. Adjacent graph
   orders are essential; `review_mutation_shifted_tail.txt` catches their
   omission. This is a tail in refinement index, not an inferred power of N.
3. **Finite-range current:** fixed commutation radius rho, N>2rho, cyclic
   label convention, `C_(j,d)=i[k_j,k_(j+d)]`, `Jcut_j`, `B_n^(d)`,
   `h_d(w)`, `Qcut=sum d C_(j,d)`. The cut is between *density labels*.
   Define actual spatial support and its uniform bound separately.
   Keep Qcal/Qcut distinct from the auxiliary spectral grading Q_r.
4. **Formal countermodel:** if lifted, scope its polynomial variable t,
   conjugate-linear dagger and complex-linear R, and the derivation P.
   Neither t nor P is a self-adjoint Hilbert operator supplied by that
   construction. Its V is a finite-polynomial direct sum, not a completion.
5. **Inverse cutoff:** if lifted, distinguish the target energy E=L_0,
   its commuting finite-rank projections P_r, cutoff Lambda_r and
   `K=(1+E)^p`, p>1. These are target-compressed modes, not the source's
   finite sine KS matrices. Retain AP half-integer momenta and the sign
   in S4; explain that epsilon D, at fixed integer separation, has the
   nonsummable absolute 1/abs(d) tail. No new “quasi-local” convention is
   introduced by a decaying but nonsummable coefficient sequence.

No new F/R gauge, vacuum indexing, fusion bracketing, duality or categorical
normalization is needed for the main theorem. The support counterexample
uses the stated Pauli product XY=iZ and unit multiplicities only.

## (e) Single next lemma

**Fixed-coarse-vector KS zero-mode lemma — conjectural.**
Tags: **(full/periodic; category-free, L0 for finite categorical data;
conditional R2 target)**. Assume the original F2(a) system: standard
nearest-neighbour KS modes on one nonzero common A1–A4 tower, the specified
complex-linear parity, translated densities, both Fourier covariance laws,
and `[U_r,K_r]=0`. Put `Hcal_r=sum_j k_(r,j)` and let
`J_(r<-a)` denote the ordered refinement from a fixed scale a.
Prove, for every v in the finite coarse carrier H_a,

    || (N_r^2/(8 pi^2)) [Hcal_r,Qcal_r] J_(r<-a) v || -> 0.

Only the unweighted norm on each transported coarse vector appears here.
Mixed-word convergence identifies its limit with `[L_0,S_0]i_a v`;
coarse-vector graph density and A2 extend zero to D. F2-G then supplies
uniform finite `(s,2)` ZC for every s, and F2-B supplies all mixed brackets.
Alternatively, construct a genuine tower with a nonzero limiting
commutator on some transported coarse vector. That would refute automatic
ZC and the original F2(a), not the current-conserving F2-B0.

A proof must use positive-Hilbert/microscopic structure beyond the formal
relations of F2-Aalg. A branch-selection argument alone is ruled out by
F2-N. Do not assume current conservation or current–momentum identification
inside this lemma: either would replace the open problem by an already
proved sufficient condition.
