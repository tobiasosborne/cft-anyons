# F4 integration package — 2026-10-25

Basis: `REVIEW.md`, **GRADE: WEAKER-RESULT-PROVED**, for the 767-line
`NOTE.md` identified by its hash there. These are proposed report changes;
no report, convention, index or worklog file was edited. Grades below
preserve the distinction between a proved conditional implication and a
constructed instance. No general categorical R2 certificate is obtained.

## (a) Statements safe to lift

| Statement and exact source | Grade | Honest tags and boundary |
|---|---|---|
| **Physical probe-form lifting**, F4.1, NOTE:49–111. Finite positive quotient, K>=1, quotient-descending forms, dense linear probe span and the uniform F1 bound imply `|R|_(s,2)<=C_(s,alpha)b`, with `C=1/((s+1)!(1-alpha))+sum_(j=0)^(s+1)1/j!`. | derived finite inequality, conditional on the stated analytic bound for an application | S=any; L=category-free; finite ->R2. This is D2-L10's two-loss mechanism with explicit constants and probe/Gram semantics. |
| **Finite contour-sweep interface**, F4.2–F4.2a, NOTE:115–183. G1 endpoint realization, G2 cylinder contact comparison and G3 uniform accumulated F1 error imply W2; A2 and KS discrepancy then transfer A4. | conditional; implication proved, geometric hypotheses unverified | S=full per family; L=category-free plus declared microscopic geometry/state/control; ->R2. Do not shorten the assumptions to “D2 (19) and density.” |
| **Fixed-word decay is insufficient**, F4.3, NOTE:185–201: moving rank-one projection, K=I, dense finite-support probes, norm constantly one. | negative, derived | S=any; L=category-free; ->R2 obstruction. Does not refute an already uniform operator bound. |
| **A1–A4 do not imply subcritical collars**, F4.4, NOTE:205–340: actual local KS qutrit density, exactly transported auxiliary K and divergent collar constants. | negative, derived and checked | S=full; L=category-free, Vec as an instance; zero limiting modes only. A stronger physical-control/noncollapse converse is not refuted. |
| **Precise analytic converse**, F4.5, NOTE:344–388: W2 iff the uniform weighted pairing estimate; W2 implies critical heat exponent s+2; a uniform subcritical envelope plus interpolation gives vanishing constants for any slightly worse subcritical exponent. | derived; interpolation conditional on F13 | S=any; L=category-free; ->R2. No spatial Ward reconstruction, no growing-mode uniformity. |
| **Modified-fermion diagonal bounds**, F4.6–F4.6a, NOTE:430–504: complex CAR, even M>=8, n=1,2,3, K=1+Q; full finite-Fock two-loss residual O(M^-1), subcritical collar majorant O(M^-1/2). | derived calibration; finite evaluations checked | S=one chiral family on an AP circle, not an open-chain construction; L=category-free with declared CAR representation; ->R2 only. Not all brackets, not standard two-family local KS, not geometric Ward residuals. |
| **Wrong energy obstructs graph closure**, F4.7, NOTE:506–524: the neutral even UV particle-hole vector gives liminf two-loss norm >=1 for K=1+E_chiral. | negative, derived and checked | Same calibration setting/data; ->R2 obstruction. Fixed-core strong convergence survives. |
| **Spectral central normalization**, NOTE:568–586 and backend PROOF:96–115: complex c*=c=1; self-dual half-cocycle gives 1/2 with that separate prescription. | derived/source-local calibration, inherited | Same setting; no geometric kappa_1,kappa_3 measured and no category identified. |
| **First categorical compiler input**, F4.8, NOTE:595–627: full End_C(O tensor O) basis, k=-h/v, current i[k_j,k_(j+1)], exact gate expansion; all charge/multiplicity matrix units retained. | derived, inherited from CA-78/79 | S=any locally, full only with declared closure; L0 plus microscopic choices; finite ->R2. No selected h or Ward certificate. |
| **Actual endpoint/cylinder realization and arbitrary-category synthesis**, NOTE:711–735. | conjectural/open | Full per family; category-free geometric lemma, then L0 application with declared data; ->R2 target. No existence theorem. |

For the counterexample retain the quantitative separation. With
`N=8*2^r`, `a=exp(N^2)`, `lambda=a^2 N^3`, the active qutrit block has
`k_j=a(P_j P_(j+1)+X_j Z_(j+1))` and current `-2a^2 X_jY_(j+1)Z_(j+2)`.
The supported block of K is scalar lambda, while the vacuum is anchored
at one and coarse controls are transported exactly. Thus A2 is bounded
by `1/(pi N)` and W2 by F8, but the five-site coefficient is
`c_N=N^2 a^4 sin(4*pi/N)/pi^2`. At each fixed s,alpha<1, for sufficiently
large N, `t=(s+1+alpha)/lambda<=1` forces
`b_N>=const_(s,alpha) exp(2(1-alpha)N^2) N^(-2-3alpha)`.
The arbitrary large K is the mechanism, so do not describe it as a
physical-energy or nonzero-stress counterexample.

For the fermion calibration retain the exact hypotheses and majorants
F17/F19, not a fitted exponent from M=8,16,32. Keep Q, E_D and E_chiral
separate. In particular E_D is only a dispersion proxy on the same chiral
sea, not the finite two-component Dirac GNS system. Off-diagonal finite
checks have restricted Q<=4 input and complete generated output; they
provide no full-Fock bound. The complex computation supplies no automatic
Majorana full-Fock graph estimate.

## (b) Exact CA-88 cells: annotations change, no general rung advances

All line numbers refer to `report/sections/88_layered_targets.tex`.

| Cell / location | Permitted change | What stays unchanged |
|---|---|---|
| Definition 88.3, **R2 / Certificate in repo**, :105 | Append: “F4: uniform probe-form lifting [derived]; W2 from G1–G3 [conditional]; converse to subcritical collars [false].” | Minimum data stays “none (Vir); L3 (extended)”; no claim that the contour identity alone proves W2; CA-89 transfer remains conditional. |
| Results table, **CA-89 / Comment**, :148 | Add the same conditional lifting and negative converse, pointing to the eventual F4 shard. | S=full per family, L=none, R=->R2. Do not replace ->R2 by R2. |
| D2-C **(i) transfer and first lemma**, :179–186 | Keep W2 as an assumption of transfer. Replace the ambiguous first test/lemma pointer by the two-ordering endpoint target below; distinguish the existing diagonal modified-fermion calibration from a standard-KS geometric test. | D2-C selection proper at :183–184 remains open; the overall declared C1–C6 target still reaches no R3. |
| Results table, **CA-78 / Comment**, :142 | Optional pointer to the explicit two-loss form constant and corrected probe interpretation. | Conditional interface status, L0 and ->R2/->R3 do not change. |
| Results table, **CA-79 / Comment**, :143; D4 first test :204–205 | Optional “modified-fermion diagonal residual/collar bounds available; all P0–P3 still unverified.” | The full shell certificate is not proved by three diagonal pairs; no R2 or R4 promotion. |
| Results table, **WT-1, VR-1**, :137 | No change. | They remain category-free contracts. F4 does not furnish a new nontrivial common-system instance. |
| Definition 88.3 **R0^c, R0^u**, :102–103 | No change. | No general new refinement construction is supplied. |
| Definition 88.3 **R1**, :104 | No change. | No new Wilson-state construction for the intended nonzero stress theory. |
| Definition 88.3 **R3, R4, R5**, :106–108 | No change. | No local conformal reconstruction, faithful category realization or functorial construction. |
| Setting axis **open/chiral versus periodic/full**, :58–80 | No inferential change; identify the AP chiral calibration in words. | A momentum-cutoff chiral CAR benchmark does not establish an open local chiral tower or settle the chirality problem. |
| Same-system requirement, **Remark 88.4**, :122–125 | No change; cite it in the new interface discussion. | Independent state, mode and geometric certificates cannot be composed without a common system. |

The qutrit example does meet abstract VR-1 with the trivial zero
representation. It may be recorded as a **negative-control instance**;
it must not be counted as progress in the nontrivial R2 certificate cell.
No L1, L2, L3 or L4 input is manufactured from the L0 compiler.

## (c) Dated amendment pointers for existing shards

Use the next free report shard identifier during actual integration;
`[F4 shard]` below is intentionally not a reserved CA number.

- **CA-89, after Lemma 89.L (:225–231):** “Amendment (2026-10-25): [F4
  shard] proves uniform physical probe-form lifting and its explicit
  two-loss constant. The application to D2 (19) still needs the contour
  endpoint/product identification and the cylinder contact comparison
  (G1–G2), with all accumulated errors uniformly controlled (G3). A1–A4
  do not imply subcritical one-sided collar bounds for an arbitrary
  admissible auxiliary control; the local KS counterexample has zero
  limiting stress. Lemma 89.L is not yet proved as stated.”
- **CA-89, after the contact discussion (:201–215):** “Amendment
  (2026-10-25): the F4 spectral central check supplies no lattice chart
  theorem or measured geometric contacts. Keep c*=12 kappa_3 and
  c=24b-12 kappa_1 with the declared zero-mode origin.”
- **CA-78, after Lemma 78.11 (:218–229):** “Amendment (2026-10-25): [F4
  shard] spells out the two-loss constant and the uniform bound on
  normalized physical probe combinations. Gram-corrected form matrices
  and operator-coordinate matrices have different transformation laws;
  wordwise decay alone is insufficient.”
- **CA-78, Target 78.13 (:248–253):** “Amendment (2026-10-25): the F4
  audit leaves the geometric operator lift open and isolates the
  two-ordering endpoint realization target. No geometric Ward certificate
  has been verified in the existing fermion backend.”
- **CA-79, first calibration target (:249–261):** “Amendment
  (2026-10-25): for the source-modified no-wrap CAR modes, F4 proves
  diagonal (n,-n), n=1,2,3, full-Fock residual and collar bounds relative
  to 1+Q. This does not establish P0–P3 for all brackets or adopt that
  modified prescription as standard local KS. Replacing Q by the actual
  modified chiral zero-mode energy fails the two-loss test.”
- **CA-81, generator-contract boundary (:95–120):** optional concise
  “Amendment (2026-10-25): F4 separates graph residual convergence from
  subcritical collar regularity; both remain distinct from a local
  geometric Ward realization.” No theorem statement needs correction.
- **CA-88:** apply only the annotated cells in (b); preserve the old
  round-2 grade and date at :240 and add the new review as a dated pointer.

No amendment to category fidelity or reflection-positivity theorems follows
from this review. They may be future dependencies of the endpoint lemma,
but their hypotheses have not been discharged by F4.

## (d) CONVENTIONS entries needed before report integration

The review's restricted write scope forbids changing `CONVENTIONS.md`.
The following are integration requirements, not already completed edits.

1. **Extend (ar)/(v) with the probe-form convention.** Use finite positive
   quotients, Hermitian pairing linear in the second slot, and forms
   descending through both null spaces. Bounds hold on arbitrary normalized
   linear combinations of reflected probes on both sides. State alpha_s<1
   fixed independently of scale and the F1 time interval 0<t<=1. Define
   the accumulated error constant after Gram, port, Fourier and counting
   factors. If B is a sesquilinear-form matrix, its physical norm is
   `||G^(-1/2) B G^(-1/2)||`; do not replace D2-L9's operator-coordinate
   formula by that expression. Sources: NOTE:53–111,125–146; REVIEW table.
2. **Extend (w) for this calibration's control and numerical scope.**
   `Q=sum_exc |r|`, `K=1+Q`; distinguish it from (ap)'s positive auxiliary
   Q_r, from `E_D=sum_exc 2|sin(eps*r/2)|/eps` on the same sea (proxy),
   and from `E_chiral=sum_exc |sin(eps*r)|/eps`. Keep the complex versus
   self-dual cocycle factor, no-wrap convention, and AP setting. Record
   n=1,2,3 diagonal full-Fock scope versus Q<=4-input off-diagonal scope.
   The CAR run uses absolute tolerance 1e-10; the author's sparse KS check
   uses 2e-9, its qutrit reviewer 1e-10. These are numerical verification
   tolerances, not analytic hypotheses. The independent review uses 1e-9.
3. **Record counterexample-specific microscopic choices.** Three-dimensional
   site with distinguished vacancy and two active states; Pauli matrices
   zero off that active block; periodic forward current of (ap); no density
   or zero-mode subtraction, v=1; dyadic insertion on even zero-based
   sites. State the indexing convention to avoid confusing this with
   (t)'s odd one-based placement. The recursively transported K is
   nonphysical; do not redefine “admissible” globally to include an energy
   comparison that VR-1 does not assume. Source: NOTE:212–263.
4. **Repair the source locator**, not the mathematics: NOTE:758's
   convention range should cover `CONVENTIONS.md:1545–1562`, including
   beta_N and the contact dictionary at :1551–1556.

No new F/R gauge, cup normalization, central-charge lift, or modular data
is needed for the category-free lemmas. F4.8 uses the existing full-basis
compiler of (ao); it does not normalize an unspecified split/merge tile.

## (e) Single sharpest next lemma

**Quantitative two-ordering endpoint realization** [conjectural target;
S=full per family; L=category-free; ->R2].

ASSUME a specified finite, metric-dependent local gate construction, its
positive reflected boundary quotient, coherent port transports, and the
actual metric-insertion operators S. Specify the contour sweep as a finite
sequence of those cells. From these microscopic data, PROVE that its two
endpoint forms are respectively the pairings with S_m S_n and S_n S_m,
up to quotient-descending errors e_r^+,e_r^- such that, for every fixed
m,n,s and some fixed alpha_s<1,

    |e_r^+(K^s u,exp(-tK)v)| + |e_r^-(K^s u,exp(-tK)v)|
      <= b_(r,m,n,s) t^(-s-1-alpha_s) ||u|| ||v||,
    0<t<=1,   b_(r,m,n,s)->0,

uniformly on the physical probe spans, after all counts and transports.
The endpoint forms must be evaluated from the cells, not defined to equal
the desired products. Proving this supplies G1 without assuming W2.
G2's cylinder contact comparison and G3's Ward-error accumulation remain
separate requirements. The same geometric fields must subsequently match
the prescribed standard KS modes; an unrelated continuum realization
cannot fill this gap.

## Reproducibility pointers

`REVIEW.md` records all commands and source anchors. New evidence is in
`checks/review_independent.py`, its green output and two rejected mutations;
`checks/review_rerun.py` executes the unchanged author entrypoints and their
three negative controls while preserving original artifacts. The existing
source manifest and the note hash were checked. A future report lift should
register this review bundle in INDEX/worklog and run its normal local report
gates; none was authorized or attempted during this directory-only review.
