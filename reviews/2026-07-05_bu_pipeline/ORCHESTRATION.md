# Orchestration record — categorical Borchers–Uhlmann pipeline block (CA-62–CA-68)

Date: 2026-07-05.  Orchestrator: Claude (Fable 5) main session; heavy cognition
delegated to GPT-5.5 via `codex exec` (xhigh reasoning) and Claude Opus
subagents, per Tobias's instruction to use both model families liberally.
Status: **completed and closed** (see worklog 011).

## The commissioning vision (Tobias, 2026-07-05)

A recipe, as functorial as possible, that given e.g. a modular tensor category
produces a family of lattice models whose continuum limit realises a chiral/full
CFT with defects and excitations given by the input category.  Key
reinterpretation: the indefinite-particle "Fock" construction (CA-02/CA-03) is
an observable *-algebra (Borchers–Uhlmann style), not primarily a Hilbert
space; reference state + approximate discrete Virasoro + quotient by relations
(GNS null ideal) is what produces candidate lattice models.

## Fan-out and verdicts

**Context surveys (3 parallel subagents, read-only):**
1. Local-source map (Sonnet/Explore): produced the reference map used for all
   anchors; found the Fock-as-tensor-algebra note in CA-03, the maybe-spin
   construction in GaugingDefects, and listed acquisition gaps.
2. Web state-of-the-art (Sonnet): established that the Jones no-go
   (arXiv:1607.08769) is a proved theorem; OAR is the only rigorous
   lattice-to-CFT line; Hollands 2205.15243 and Zini–Wang 1706.08497 are the
   closest prior art; nobody has posed MTC-to-lattice as a functor; nobody has
   turned moment-SDP feasibility into QFT state existence.
3. Project survey/review digest (Sonnet/Explore): confirmed the qubit SDP block
   already implements GNS-style relation bookkeeping ω(X*RY)=0, and that the
   reviewers' own recommendation was a state-level relaxation of the boost gate.

**Source acquisition (Sonnet, network):** 8 arXiv papers registered
(Jones no-go, Zini–Wang, AFM I+II, Fewster–Rejzner, OS 2109.14214 / 2304.03224,
Osborne–Stiegemann 1903.00318) with SHA256s, e-print sources, extractions, and
append-only SOURCES.md entries.  Fewster–Rejzner verified to contain the free
*-algebra-modulo-relations construction (:1901–1920) without using the name
Borchers–Uhlmann; recorded as such.

**CA-62 vision shard:** drafted by GPT-5.5 with self-verified anchors;
orchestrator re-verified every anchor against the files and swapped both GAP
markers for the newly acquired Jones/Fewster–Rejzner anchors before integration.

**CA-63 state-existence theorem:** GPT-5.5 audit of the orchestrator's proposed
compactness argument.  Verdict: correct after one repair — "level" must mean the
exact monotone full-window hierarchy (no weight truncation, monotone residual
list).  Steps: full-window moment PSD ⟺ window density matrix PSD; partial-trace
conditional-expectation extension; weak-* closed nested nonempty compact sets;
translation invariance from pairwise window constraints; π_ω(R)=0 via dense
matrix elements.  Yields the exact alternative (63.10): some level infeasible OR
a reference state exists.  Julia witnesses implemented by an Opus agent
(220 assertions; a phase-dropping mutation initially survived the PSD-only
checks and the testset was strengthened with complex-entry assertions until the
mutation went RED — recorded as a genuine test-quality catch).

**CA-64 relaxed gates:** GPT-5.5 design with inline finite computations.  Key
outputs: gauge-invariant residual profiles (distance to coboundary image,
witnesses constrained by Du=A so u cannot absorb boost error), fixed-residual
GNS-norm SDP objective v_N(R)=min ω(R*R) with certified dual lower bounds as
exclusion; joint witness+moment optimization identified as bilinear (NOT an
SDP) — alternation/SOS deferred.  Design predictions for the self-dual TFIM
boost profile (supports 2..5): sqrt(6), 1.8257418583505538 (matches the
recorded 2026-05-31 scan artifact), 1.5275252316519468, 1.3416407864998736,
optimizer speed λ = -2.  An Opus agent implemented the profiles, SDP tier, and
relaxed re-scan; the implementation reproduced every design number to ~1e-15
(independent cross-model validation) and mutation-proofed the coboundary code.
The λ = -2 sign is recorded as an open interpretation item.

**CA-65/CA-66 categorical BU algebra (Rule-12 two-model competition):**
independent designs from GPT-5.5 and Opus CONVERGED on every load-bearing
choice: site-object parametrization (C, O) with maybe-object O = 1 ⊕ X;
A(I) = End_C(O^⊗L) as an AF C*-tower (Bratteli diagram = fusion graph of O);
free tensor pre-layer BU₀ = T(V) with canonical surjection π and kinematic
fusion ideal J_fus = ker π; fusion NEVER deferred to the state (only
dynamical/Virasoro relations live in the GNS null ideal); tube/double-triangle
algebra assigned to a separate defect/symmetry layer; birth/death via raw cups
with cup-cap = quantum dimension; Trebst unitary F-gauge; functoriality on
pairs with unitary monoidal dagger functors.  Opus additionally identified the
categorical Markov trace as a natural state (the canonical-but-not-dynamical
answer to "as functorial as possible"); GPT-5.5 additionally supplied the
placed-matrix-block generator calculus.  Both independently flagged the same
two source gaps (canonical spherical structure for unitary UFCs; κ_τ = +1).
Synthesis: scratchpad record binding both; shards drafted by GPT-5.5 from the
synthesis; anchors re-verified by the orchestrator before integration.

## W6 addendum — refinement maps (same day, second commissioning)

Tobias's follow-up objective: refinement maps are the key to the continuum
limit; they must be local, isometric, and Virasoro-compatible; dense-anyon
spaces largely forbid them; the variable-N construction opens new options.
Fan-out: (1) opus deep-read of the OAR scaling-map axioms, the soft
inductive-limit relaxations, the Jones no-go mechanism, and Stottmeister's
braiding-RG — yielding the CA-67 requirement set and NG1–NG5 checklist;
(2) archive dig recovering the dead predecessor's two fine-graining
isometries — the normalised product map (solid, 1e-10) and the number-changing
V0+V2 (unfinished) — whose deficit/pair-creation phenomenon is structural
evidence that fixed-N wavelet refinement fails isometry exactly where
indefinite anyon number repairs it; (3) web survey establishing that anyonic
MERA (Koenig–Bilgin) permits but never develops vacancy sites, that
Kliesch–Koenig prove generic discontinuity with a checkable necessary
condition, that Zini–Wang demand isometric embeddings framed as adding
particles, and that NO Koo–Saleur construction exists for the dilute
Temperley–Lieb algebra (open research target); (4) GPT-5.5 design of the
vacuum-insertion family V_L, its corner-versus-unital OAR status, exact
charge-diagonal state consistency, the stretched birth covariance, and the
dressed family W_L = U_L V_L with the asymptotic Koo–Saleur intertwining
target. Deliverables: shards CA-67/CA-68, src/AnyonicWordAlgebra.jl with the
83-assertion Fibonacci testset (dimension tables to L=6, exact 13x2/21x3
vacuum-insertion isometries, occupation covariance, mutation-proofed), and
seven further registered sources (Kliesch–Koenig, Koenig–Bilgin, Pfeifer et
al., Ayeni et al., three dilute-TL papers; Bubble Algebra authorship corrected
to Grimm–Martin).

## Convention changes (Core-tier)

- (b) F-gauge FIXED to the unitary gauge (Trebst eq. 2.4 anchors).
- (a) index level FIXED: unit object first, 1-based in Julia.
- (r) NEW: anyonic site object, word algebra, cup normalization, FS flag.

## Non-negotiable boundaries recorded

- No continuum theorem claimed anywhere in the block; approximate-Virasoro-
  becoming-exact-in-the-limit is the programme conjecture.
- CA-63 existence needs feasibility at EVERY full-window level — never certified
  by finite solver runs; exclusion remains the only finitely-certifiable side.
- Relaxed-gate survival is never symmetry evidence; certified SDP lower bounds
  are the exclusion currency.
- Gaps kept open and marked: canonical spherical structure source, κ_τ = +1,
  Banach–Alaoglu and conditional-expectation textbook anchors, coefficient-tail
  decay → continuum symmetry theorem.

## Deliverables

Shards CA-62–CA-66 (guard: 67 shards green; report.pdf 151 pp), CONVENTIONS
(a)(b)(r), 8 registered sources, src/QubitMomentStateWitnesses.jl,
src/QubitRelaxedGates.jl, src/QubitResidualSDP.jl, src/QubitRelaxedScan.jl,
scripts/julia/qubit_relaxed_scan.jl, runs/2026-07-05-qubit-relaxed-scan/,
new testsets in test/runtests.jl, worklog 011.
