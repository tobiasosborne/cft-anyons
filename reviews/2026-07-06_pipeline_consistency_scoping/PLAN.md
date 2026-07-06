# Pipeline consistency layer — scoping synthesis and action plan (2026-07-06)

Commission (Tobias): analytical phase — set up the consistency equations
between all definitions of the pipeline UFC/MTC -> lattice models -> continuum
limit -> CFT.  Stages (1) UFC->BU and (2) BU->GNS are "pretty clear"; frontier
(3) is discrete symmetries (action -> generators/kernels; discrete Ward <=>
Virasoro); frontier (4), the real one, is the continuum limit via refinement
maps — general k->l, every piece rock solid in isolation AND composable.

Inputs: internal consistency map; two independent framework designs (Claude
Opus; GPT-5.5/codex, xhigh) that converged on all load-bearing choices; two
literature surveys with 11 newly registered sources; one hostile review of
this plan (all blockers and majors incorporated).  Full record:
ORCHESTRATION.md in this directory.

## Part I — What the investigation established

### I.1 Four ill-posed seams (internal consistency map)

S1. GNS descent of theta_L(T) = V_L T V_L^dagger: no equation ties the
    algebra map to the GNS quotients.  Status after this scoping: the
    residual-FREE part is settled by a new lemma (I.3); the residual part
    stays open pending the categorical residual set (S3) and a null-ideal
    descent proof.
S2. No composition structure beyond the single 1->2 map.  Status: resolved
    in principle by the forest-functor formalism (I.2); to be instantiated.
S3. Two undefined objects in the only written symmetry square: the coupling
    g_L (no definition, no flow) and the categorical residual set R on
    A_L = End_C(O^{tensor L}) (only the qubit/Pauli calculus exists).
S4. Parity vs fidelity: dilute KS lives in the parity-even corner; the
    fusion vertex tau -> tau tau is parity-odd; the dilute route alone
    provably cannot realise "defects/excitations = C".  Needs a declared
    even-sector/Tier-2 split.

Plus tensions: T1 occupied-subset vs fusion-tree bases beyond L=2 (missing
endpoint-closing rule); T2 no bridge between CA-63 (exact null) and CA-64
(approximate residuals); T3 periodic KS vs open-chain refinement; T5 the
v^2 = -2 sign; T6 corner-vs-unital; heavy notation collisions (V/J/P/tau/e/v).

### I.2 Composability has a rigorous skeleton in the literature

- Jones/Brothier forest technology [references/refinement/
  BrothierStottmeister2019Gauge; Brothier2022ForestSkeinI]: a refinement
  tower IS a functor Phi: F -> D from a forest category; a tensor functor is
  determined by the single seed R = Phi(Y): A -> A tensor A; composition is
  exact by functoriality; Thompson's F/V is the built-in symmetry group.
  CA-68's V_L is precisely such a seed.  "Naive" = binary functor,
  vacuum-inclusion seed, no dressing.
- General k->l: n-ary carets give Higman-Thompson F_{n,1}; mixed radix via
  coloured forest-skein categories, BUT with >= 3 colours the Ore property
  fails — no fraction group, only a refinement groupoid.  Real dichotomy:
  group symmetry vs radix freedom.
- Fallbacks when exactness/Ore fail: divisibility-directed inductive systems
  (UHF pattern), and soft inductive systems with asymptotic transitivity
  [literature/md/2306.16063] — the home for dressed maps and corner slack.
- No-gos bracket everything: Jones no-go; Kliesch-Koenig generic
  discontinuity with a checkable necessary condition
  [references/lattice-symmetry/KlieschKoenig2020/source/ms.tex:407-432].
  CAVEAT (hostile review): the KK theorem is stated for homogeneous binary
  trees over a single qudit tensor power; its applicability to the
  charge-graded fusion carrier must be established, not assumed (W2.4).
- All proved wavelet/OAR continuum results are ratio-2 and free/Gaussian;
  no charge-graded refinement functor with a proved continuum statement
  exists.  That is our lane.

### I.3 The residual-free corner problem reduces to one scalar

Both designers converged; hostile review verified the mathematics:
- Bare placements compose exactly: for order-preserving injections
  phi: [k] -> [l] (content sites into fine slots, vacuum elsewhere),
  V_psi o V_phi = V_{psi o phi}; bracketing is neutralized by the
  trivial-label F-symbols of CONVENTIONS (b).  Dressed W = U V satisfies
  only an asymptotic (soft) cocycle condition.
- GNS-descent lemma [derived; review-verified]: with
  omega_L := omega_2L o theta_L (a state iff omega_2L(P_L) = 1, otherwise a
  sub-normalized positive functional), the map
  [T]_{omega_L} |-> [theta_L T]_{omega_2L} is a well-defined isometric
  intertwiner of GNS representations (theta(S)*theta(T) = theta(S*T) from
  V^dagger V = 1); vacuum-preserving iff omega_2L(P_L) = 1, with defect
  || pi(P_L) Omega - Omega ||^2 = 1 - omega_2L(P_L).
- Corner-vs-unital menu: (i) corner-state route omega(P) = 1 (exact);
  (ii) unital CP completion Phi_chi(A) = WAW* + chi(A)(1-P) with
  multiplicativity defect controlled by omega(1-P) — a soft C*-system.
  NOT settled by defaulting: a dressed W_L can in principle achieve exact
  omega(P^W) = 1 on a nontrivial state (what wavelet/MERA constructions do);
  test before adopting the soft route as default (W2.1).
- STILL OPEN (S1 residual part): theta_L must also map R_L-null relations
  into R_2L-null relations; the sufficient Gram-domination condition is
  provable abstractly (W1.2) but its instantiation needs the categorical R
  (W1.3).

### I.4 Filling: where 1->2 is quantitatively naive

- Collapse lemma [verified]: bare V_L halves site-filling nu -> nu/2;
  N-preserving dressings cap filling at 1/2 after one step; iteration
  drives every state toward the empty vacuum.
- Correction (orchestrator, review-confirmed): charge-preserving is NOT
  N-preserving — local vacuum-block pair creation (the CA-66 birth channel)
  lives inside bounded-depth charge-preserving circuits.  Content creation
  belongs INSIDE the dressing U_L.  Right formulation: a filling-flow
  equation nu' = nu/2 + (pair-creation rate of U_L), with schedules chosen
  so the flow has a fixed point at the target filling.
- nu_* = 1/phi [verified as flat-trace/dimension-maximizing filling]: a
  heuristic target only; the sourced anyonic t-J criticality sits at
  model-specific fillings (c = 7/10, 4/5).  The refinement target filling is
  therefore a FREE PARAMETER, to be set from ED data (D3) — do not
  hard-code 1/phi.
- k->l freedom = density control: mixed-radix schedules can hold a target
  filling where dyadic cannot; golden-ratio schedules likely live in the
  groupoid-only (non-Ore) regime.

### I.5 Symmetry stage: state of the art

- Only proved KS convergence: free fermions (Osborne-Stottmeister; strong,
  c = 1/2, 1, + u(D)_1 currents).  HKV [1307.4104, acquired]: EXACT lattice
  Virasoro for dGFF and Ising via lattice Sugawara + discrete
  holomorphicity.  CGS [1604.06339, acquired]: proved correlation-level
  convergence of a discrete stress tensor for Ising.  Everything
  interacting: scaling-weak + numerical.
- GSJS anomaly [Linnea11.5.tex:3194]: limit-of-commutators vs
  commutator-of-limits differ by a modified central term
  (m^3 c* - m c)/12, c* != c.  CONSEQUENCE: every lattice closure equation
  carries TWO constants (c_L, c*_L), each with its own estimator;
  c* = c is a theorem target, never an assumption.
- Kernel dictionary: Read-Saleur build the enlarged lattice symmetry as the
  TL commutant from Jones-Wenzl projections; GRS: open TL -> U(Vir)
  exactly; periodic JTL -> the INTERCHIRAL algebra, strictly bigger than
  Vir x Vir.  No explicit JW <-> null-vector operator theorem exists; the
  proposed dictionary (parity = superselection, not a null vector; JW
  kernels <-> degenerate-module data via descendant-Gram-rank convergence)
  would be new.
- Confirmed absent from the literature (our lane): dilute-TL KS; symmetry
  generators on variable-N/vacancy chains; categorical-symmetry ->
  generator recipe; a general discrete-Ward <=> Virasoro equivalence.

## Part II — Action plan (hostile-review-corrected)

Shard IDs below are proposals; fix at writing time.  Wave 1 is committed to
the OPEN-CHAIN default of CONVENTIONS (r); all periodic/interchiral content
is deferred to Wave 2 behind decision D1.  Every cup/birth-based item is
conditional on the unsourced kappa_tau = +1 / spherical-structure flag
(CONVENTIONS (r)) until A1 lands, and must fail loudly if kappa_tau = -1.

### Wave 0 — unblockers (small, immediate)

A1  Acquire and register a source for "unitary UFC => canonical spherical
    structure" and the Frobenius-Schur indicator kappa_tau (already on the
    worklog-011 open queue).  Unblocks unconditional cup/birth statements.
C1  CONVENTIONS batch: (i) g_L — register the symbol, its role, and the
    explicit statement that the flow equation is an OPEN problem; (ii) the
    two-constant closure (c, c*) with estimator conventions; (iii) status
    of v_L (T5: is lambda = v^2 a squared speed or an unconstrained
    multiplier; reconcile with CA-70's positive v); (iv) site-position /
    cell-centering convention for refined lattices (positions drift under
    j -> 2j-1; first-moment generators are position-sensitive).

### Wave 1 — the consistency layer (analytical core; open chain)

W1.1  CA-71 REFINEMENT-PLACEMENT-CATEGORY.  Placement injections
      phi: [k] -> [l]; bare refinements V_phi; charge-graded forest functor;
      exact functoriality V_psi o V_phi = V_{psi o phi} (citing
      CONVENTIONS (b) for the bracketing step); cell-shift translation
      compatibility; the Ore dichotomy and the divisibility/soft fallbacks,
      anchored in the acquired Brothier sources.
      Julia: functoriality on Fibonacci blocks L <= 4 (1->2 then 2->4 =
      1->4); occupation covariance.

W1.2  CA-72 GNS-DESCENT-AND-CORNER-CALCULUS.  The descent lemma
      (sub-normalized wording; defect = 1 - omega(P)); unital CP completion
      + multiplicativity-defect bound; the BU-level square
      (Rhat(J_fus,k) subset J_fus,l); the abstract Gram-domination lemma
      for null-ideal descent (conditional on a residual set — instantiated
      in W1.3).  Honest scope note: this settles the residual-free part of
      seam S1 only.
      Julia/SDP: regression check omega_2L(P_L) = 1 for the CA-66
      charge-diagonal states (0 by construction — labelled as regression,
      not probe); mutation test on the defect inequality.

W1.3  CA-73 CATEGORICAL-RESIDUAL-SET (open chain).  Port the CA-38/42
      coboundary and Ward calculus from Pauli coefficients to
      A_L = End_C(O^{tensor L}): conservation, boost, and Witt/Virasoro
      residual densities as algebra elements, with the (c, c*) two-constant
      closure equations and finite-size estimators (C1 conventions).
      Instantiate the W1.2 null-ideal descent condition for this R.
      Julia: dilute Tier-1 residual densities assembled and cross-checked
      against the CA-70 generator set at small L.

W1.4  CA-74 JW-KERNEL-DECISION.  The decisive, basis-independent finite
      computation: rank of rho_4 and of the JW-type kernel elements at
      L = 4 (M_8 = 323 vs parity-even dimension; settles the CA-69
      conjecture).  Nothing basis-dependent enters (rank is invariant).
      Julia: the L = 4 rank computation.  (Folds in part of the queued
      "CA-71 numerics" of worklog 011 — label re-homed, noted there.)

W1.5  CA-75 ENDPOINT-CLOSING-AND-BASIS-LEDGER (T1, pulled forward).  The
      rule mapping occupied-subset paths to a fusion-tree ONB inside each
      fixed-S sector; makes every matrix representation beyond L = 2
      well-defined; prerequisite for Gram-rank work (W2.3) and for CA-68's
      13x2/21x3 matrices to be canonical.

W1.6  CA-76 SOFT-NULL-BRIDGE (qubit level first).  Quantified CA-63: from
      all-level eps-feasibility, existence of a translation-invariant omega
      with || pi_omega(R) Omega || <= eps (weak-* compactness, soft null
      ideals); preserves exclusion semantics.  Categorical corollary
      deferred until after W1.3.
      Check: proof audit + a two-level toy SDP witness.

### Wave 2 — frontier constructions (need D1, D3, and Wave 1)

W2.1  CA-77 CONTENT-CREATING-DRESSINGS.  Filling-flow equation with the
      target filling as a free parameter (gated on D3/W2.2 data, NOT
      hard-coded to 1/phi); the corrected no-go (N-preserving dressings cap
      at 1/2); birth-dressed refinement family (V0+V2 re-derivation in
      CA-66 raw-cup language — kappa_tau-conditional); the dressed-exact-
      corner test: can a MERA-style W_L achieve omega(P^W) = 1 on a
      nontrivial state (decides D2 empirically).
W2.2  CA-78 DILUTE-KS-ON-WORD-SECTORS [needs D1].  Periodic dilute
      evaluation map (T3 resolution recorded); dilute KS modes on the CA-66
      sectors; discrete Ward identities in the W1.3 calculus; ED of the
      anyonic t-J (c = 7/10) as the first numerical anchor — also
      determines the critical filling for W2.1.
W2.3  CA-79 GRAM-RANK-KERNEL-DICTIONARY [needs W1.3 + W1.5].  Descendant
      Gram matrices G_L^{a}; the shadow rank G_L -> rank G^{Vir}_{c,h_a};
      parity-superselection reading; interchiral caveat recorded.
W2.4  CA-80 KLIESCH-KOENIG-PORT-AND-NO-GO-AUDIT.  Port + applicability
      first: what plays the role of C^d for the charge-graded carrier;
      whether the KK necessary-condition proof transfers off tensor-power
      spaces; only then the finite check for bare V and W2.1 seeds, plus
      the NG1-NG5 audit table.  Pass/fail recorded as data, never as
      continuum evidence.

### Wave 3

W3.1  Tube/defect refinement covariance W T_k(x) = T_l(x) W + fusion
      fidelity shadow; the declared even-sector/Tier-2 split resolving S4.
W3.2  Cofinal-independence criterion (common refinements intertwining
      states + KS modes) — the "same continuum limit" equation.
W3.3  Notation sweep for the V/J/P/tau/e/v collisions — a Core-tier
      cross-shard restructure (Rule 12), scheduled as its own task with a
      sweep checklist, opt-in.

### Decision points for Tobias

D1  (pre-W2.2) Chiral vs full CFT target + open vs periodic lattice algebra
    for the symmetry stage.  Substantive: the periodic scaling limit is the
    interchiral algebra, not Vir x Vir.  Wave 1 proceeds on the open-chain
    default regardless.
D2  Corner route default (soft corner vs unital completion vs dressed-exact)
    — deferred until the W2.1 dressed-exact-corner test reports.
D3  Working target filling for refinement schedules — set from W2.2 ED
    data, not from the 1/phi heuristic.
D4  TIB acquisitions: the 1992 journal-only dilute O(n)/Izergin-Korepin
    chain papers (Warnaar-Batchelor-Nienhuis line) — needed at W2.2.

## Status honesty

Nothing here claims a continuum theorem.  Wave 1 is finite-L mathematics
with exact or SDP-checkable content; Wave 2 constructs candidate families
and gates; every convergence statement remains a conjecture target in the
CA-67/CA-68 sense.  The Jones no-go is engaged by refusing exact
implementers; Kliesch-Koenig enters as a port-then-check gate (W2.4); the
corner problem is tracked by the scalar 1 - omega(P) wherever it appears;
kappa_tau/spherical-structure remains a flagged source gap until A1.
