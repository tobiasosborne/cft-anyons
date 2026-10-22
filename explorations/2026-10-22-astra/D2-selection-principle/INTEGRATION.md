# D2 — Integration into CA-75

Companion to `REVIEW.md` (same directory). Section numbers "§n" and labels
"D2-Ln" refer to `NOTE.md`.

## (a) Replacement for the CA-75 placeholder

This replaces `report/sections/75_integration_map.tex:216–217`. It is prose
for a general unitary fusion category; no model appears in it.

```latex
\item[D2 selection principle.] Reconciled (\path{explorations/2026-10-22-astra/D2-selection-principle/REVIEW.md}).
\emph{No selection theorem.}  For general \((\Cc,O)\): finite equations on the tile
coordinates of \(h\in\operatorname{End}_\Cc(O\otimes O)\) with \(\operatorname{Ev}_\Cc\) constants and
exact exponential gates refining Lemma~86.1 (\S1.1--2.2) [scaffold]; no lossless
fixed-carrier blocking unless \(d_O=1\), and metric independence kills stress
(D2-L1, D2-L2) [proved].  Analytic regular YBE forces
\([h_{12}+h_{23},[h_{12},h_{23}]]=K_{23}-K_{12}\) (D2-L3) [proved; rejection test only];
YBE and brick-sweep commutativity imply neither the other (D2-L5) [proved; converse
as repaired in REVIEW], qualifying Proposition~86.3 and row~(2); a braiding
spectralises linearly only under a quadratic relation (\S3.4) [proved].  Endpoint
rank-drop and metric-derivative stress equations (\S4) [scaffold]; categorical
defects constrain no coupling and survive limits as a faithful, not full, action
(\S5, D2-L7) [conditional].  Bridges: normalised drift toward Link~(b2) (D2-L8), Gram
amplification (D2-L9), one-sided collar to VR-1 graph bounds (D2-L10) [conditional].
Headline D2-C [conjecture]: certificate C1--C6 (\S6.2) suffices for a local
positive-energy CFT with standard KS stress; it selects no coupling, has no
verified instance, and leaves fidelity to D5.
```

There are two companion edits for the CA-75 integrator. Both stay within the
shard's "map" status.
- Row (2), "Already general" (`75_integration_map.tex:73`): change
  "commuting-family exactness on integrable lines (Prop. 86.3)" to
  "Prop. 86.3 conditional on its commutativity hypothesis. The brick sweep is
  KS's non-commuting row-to-row transfer (KS :603, :717), and the ground-state
  claim needs nondegeneracy (D2 §3.3)". In "Missing", add "computable
  selectors: D2 eqs. (5), (8), (12)–(13)".
- Link (a3) (`:131–135`): D2 eq. (13) together with condition C1 is a precise
  form of this question. The metric derivative of the gates must equal the
  physical density k=−h plus a continuity current, up to residuals that are
  summable in graph norm.

## (b) Promote to shard

**Promote one shard.** Its number is provisional and is assigned at integration,
because other reconcilers may also claim CA-88.

`CA-88-CATEGORICAL-SELECTION-EQUATIONS`: *Finite selection equations for
categorical nearest-neighbour Hamiltonians*. Status: derived (finite algebra), with checks.
1. Sources and dependencies: CA-65, CA-86 (Lemma 86.1, Prop 86.3), CA-87; KS :603,
   :717–725; AFM-S :499–552; AFM-F :175–184; Penneys :1010–1019; CONVENTIONS (r),(ak).
2. Coefficient compiler: dual bases, Gram G>0, multiplication and placement
   constants (NOTE eq. (1)). Multiplicity and orientation bookkeeping, with no self-duality assumed.
3. Exact gate ODE (eq. (2)): the exact history sum for a finite circuit, upgrading Lemma 86.1.
4. Blocking map with leakage (eqs. (3)–(6)); D2-L1 (no universal fixed-carrier
   compression); D2-L2 (metric independence annihilates stress).
5. Additive YBE as a coefficient system (eq. (7)); D2-L3, the cubic cokernel
   rejection test, with proof by general partial traces. Cite it as the
   Reshetikhin condition once a source is acquired.
6. Loop-quotient reduction D2-L4, stated with the self-dual-summand hypothesis.
7. Non-equivalences D2-L5: the brick sweep versus YBE, both directions, with the repaired converse
   (REVIEW §2.2). **Erratum to Prop 86.3**: transfer attribution and ground-state nondegeneracy.
8. The braided linear ansatz (eq. (11)) and its quadratic obstruction; pointer to
   the local BMW precedent (1408.1282:217–235) for non-linear Baxterisation.
9. Defect naturality (eq. (14)) imposes no equation on c. YBE does not imply criticality (R=1).
10. Checks: port `checks/exact_checks.py` and `review_checks.py` into
    `scripts/python/` with a run bundle. Examples table: TL/RSOS and dilute rows only.

D2-L8 to D2-L10 are general OAR bridge lemmas. They fit better as an addendum to CA-81
(or to whichever shard absorbs D3/D4's analytic results) than as a separate
shard. The certificate C1–C6 should enter CA-75's acceptance contract as a
cross-reference, not as a new shard. **No shard for D2-C itself.**

## (c) Links

- **Depends on CA-86/CA-87, not on another D-note.** It uses the history-sum
  setting and CA-87's blocking caveat (NOTE:337–339).
- **D1 (carrier theory).** D2-L1 says that RG blocking cannot close on a fixed site
  object unless d_O=1. Any D1 blocking or refinement criterion that keeps O fixed
  must be an isometric non-unitary embedding with leakage, as in D2 eq. (4). No contradiction.
- **D3 (refinement meets dynamics).** D3 supplies C5 (local unital refinements,
  vacuum repair) and the d_n contraction of C2. D2-L8 consumes D3's drift
  bounds. D3-C's polar refinement of a Euclidean strip uses the exact gates of D2
  eq. (2). D2 adds that C5 requires *unital* maps, so CA-72 corner maps must first
  be completed (NOTE:683–684).
- **D4 (KS beyond free).** D2-L10 is the interface from microscopic collar
  estimates to VR-1 A2/A4 weight losses. D2 C1 fixes the KS density as the
  time-derivative of the gates with the (af) sign. Any D4 tile-form KS mode must
  match it, including improvements, up to graph-summable residuals.
- **D5 (fidelity).** §5/D2-L7 feeds D5: defect relations survive as a faithful
  action, but fullness, simple images and sector completeness are D5's job.
  D5's "exact exponential tiles / reflected-positive cells" is D2 eq. (2). D5's
  "nuclear collar bounds" must not be used for graph norms (D2-L10
  counterexample). Add to D5's fidelity caveats the AFM :775 fact that the lattice category need not
  embed in the CFT's MTC.
- **D6 (functor/obstructions).** D2's C1–C6 are a subset of D6's K0–K12 contract
  (dynamics, state, Ward and KS items). The cokernel test (8) is a finite local
  obstruction of the type D6 tabulates (D6 NOTE:508–514) and should be entered in its
  layered obstruction list.
- **Contradicts:** none among D1–D6. It does contradict the reading in CA-86
  :55–57 and :116, :120–122, as in REVIEW §2.3.

## (d) Headline verdict

**Needs reformulation.** As stated, D2-C is a sufficiency conjecture about any
local chain carrying a geometric stress certificate. Its hypotheses form an open-ended
analytic list with no verified instance. It answers "when does a chosen c give a
CFT", not "which c to choose", and nothing categorical enters its
conclusion. It is a real research target only after it is split. The sharp
form is a *Ward-to-KS transfer lemma*: under C1 (gate derivatives equal k and the
continuity current) and C3 (one-sided collar bounds, D2-L10), the discrete contour
identity (19) with summable residuals implies VR-1 A3/A4 for the standard KS
modes of k on the same GNS core. This is the first attackable lemma. It is finite
in form and general in C, and it is the implication NOTE:695–701 says is missing.

The highest-value step is to **check C1–C6 on the one sourced calibration with a
proven lattice stress tensor**: the free-fermion benchmark already in
`cft_machine/benchmarks/fermion/` (PROOF.md, WILSON_PROOF.md), or the CGS n=1
point. In particular, test whether C3's one-sided collar bounds (18) hold with uniform
constants. If they fail there, the certificate is mis-specified. If they hold, D2-C has its first instance.
This uses local material only and stays within the laptop budget. A cheap second step is to compute
the cokernel test (8) for the generic dilute tile space `O=1⊕X` of a small
non-self-dual or multiplicity category. This measures how much of coefficient space
(8) actually rejects.

## (e) Hypotheses still to be synthesised from category data

1. A blocking prescription: the patch P, retained-boundary isometries I_n, a stationary
   Banach space X, the contraction ρ<1 and a summable leakage ℓ_n (C2).
2. Reflection positivity of the glued reflected patches for the chosen c (C1, §2.1).
3. Analytic gate families G_n(t,g;c) under local shape and metric deformation, whose
   metric derivative Q satisfies (12)–(13) and whose time and mixed responses
   are k=−h and the (af) current (C1).
4. The Ward contact equations (19), including the central term, with a single positive
   velocity and with the barred and zero-mixed-residue identities (C4).
5. Separating positive boundary probes, invariant null spaces and collar trace
   bounds `sup_n Tr e^{-tE_n}<∞` (C3).
6. One-sided collar bounds (18) for first-insertion and transported-difference words,
   uniform or summable as appropriate, with two-loss bounds for contact words (C3, D2-L10).
7. Gram conditioning γ_n, Λ_n, with `ε_n ≤ C·2^{-(2+κ/2+η)n}` (D2-L9).
8. Coherent unital injective local *-refinements (unital completion of the CA-72
   corners) whose pulled-back states give the relative drift needed by D2-L8 (C5).
9. A cyclic vacuum preparation with E_nΩ_n=0 converging under C5 (C1).
10. Non-collapse: a nonzero limiting connected TT kernel (C6).
11. For integrable selection: a spectral family R(u), its transfer construction
    with auxiliary closure or boundary, its physical branch, and ground-state
    nondegeneracy (§3.3).
12. For defect fidelity: an annular or module realisation with natural crossings,
    uniform strong convergence of defect and junction operators, and junction Gram
    lower bounds η>0 (D2-L7). Fullness and sector completeness pass to D5.
13. Declared enrichment: the central-charge lift (an MTC fixes c only mod 8,
    [EG]:333–335) and the target type (NOTE:777–780).
