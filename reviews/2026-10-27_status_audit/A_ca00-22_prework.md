# Status audit A: CA-00..CA-22 (May 2026 pre-work)

Paths: shards are report/sections/NN_*.tex (S/NN below); tests are test/runtests.jl (T:line); core helpers src/CftAnyons.jl, src/GalileiAlgebras.jl. Layer tags are mostly NOT stated in these shards (they predate Rules 16/17 and CONVENTIONS (aq)); tags below are inferred and marked (inf). Setting = any/open/periodic; data L0-L4; rung R0-R5.

## 1. Summary

The block set out to (a) build a typed "Hilbert-space compiler" front end (AND = tensor, OR = direct sum, vacuum = C; Fock completion; symmetry decoration; sector/projection/quotient semantics; exchange sectors), (b) open a lattice-symmetry programme (boost as first moment of Hamiltonian density, position-dependent generators, Koo-Saleur prototype, acceptance tests, compiler interface), and (c) a Galilean variant (mass-density first moments, mass central term). What it actually established is small and kinematic: exact finite-dimensional algebra (Fock grading, group-average projector, Fibonacci path counts), two vector-field bracket tables (Poincare, Galilei), one nearest-neighbour commutator identity for K=sum x_j h_j (CA-12), a discrete-continuity first-moment identity (CA-21), and the canonical [mX,P]=im coefficient. Everything about continuum convergence, Virasoro, category data beyond fusion rules, and Galilean source naming is explicitly deferred. CA-00/01/04/08/15/16/22 are contracts/specs, not results; no shard in the block touches L1+ data, R1+ rungs, or a CFT.

## 2. Per-shard table

Columns: ID | claim | status in shard | layers (setting; data; rung) | backing check | key cite.

| ID | Claim | Status as stated | Layers | Check | Key cite |
|---|---|---|---|---|---|
| CA-00 | North star, two criteria (provability, fidelity), claim labels Question/Proposal/Source-local/Checked/Rejected | no label (frontmatter; says "programme, not a settled theory") | any; L4 target declared; R5 as goal | none | S/00:7-20, 40-46 |
| CA-01 | Pipeline as questions: category -> model -> lattice generators -> OAR limit -> CFT target | "map of questions, not a list of results" (no formal label) | any; L0-L2 posed as open (inf); R0-R3 as stages | none | S/01:3-4, 31-62 |
| CA-02 | OR=⊕, AND=⊗, vacuum C (distinct from ⊕-zero), distributivity iso, carrier functor, particle-number grading; finite only | no label (derived; Lamport skeleton S/02:154) | any; no categorical data (L-1/none); R0-ish kinematic | none | S/02:35-50, 85, 189-193 |
| CA-03 | Indefinite-N Fock = Hilbert (l2) direct sum of completed tensor powers; algebraic vs Hilbert sum; statistics deferred | no label; "Theorem (Fock is a Hilbert space)" | any; no cat. data; kinematic | none | S/03:34-48, 98 |
| CA-04 | Compiler contract: typed output slots (carrier, grading, observable policy, symmetry, sector, evidence) | "Status: Proposal / contract shard" | any; none; none | none (points to projector test) | S/04:13-17 |
| CA-05 | Decorated atoms (K,U); ordinary/projective (central-extension) symmetry propagates through OR, AND, Fock | no label; sourced via Schottenloher | any; none | none | S/05:27-69, 119-123 |
| CA-06 | Sector = projection/subspace/quotient; finite-group averaging projector; invariant vs compressed observable algebras | no formal label; "Checked Example" subsection | any; none | "finite symmetry sector projectors" T:21 | S/06:46, 106-121, 141 |
| CA-07 | Bose/Fermi as S_n irrep sectors on full Fock; para and braid statistics deferred; para projectors "a proposal" | no label; para/anyonic explicitly proposal/deferred | any; none (anyonic exchange needs L1, not done) | "two-qubit exchange projectors" T:42 (cited by CA-08, not by S/07) | S/07:111-122 |
| CA-08 | First partial compiler spec: constructor rules, 6 examples, required compile error | "Status: specification shard" | any; none | T:21 and T:42; compiler itself not implemented | S/08:13, 268-276 |
| CA-09 | Fibonacci path spaces = one tau atom + admissibility projector; dimension recurrence | "Status: checked kinematic shard" | any setting; L0 (instance: Fibonacci, calibration only); R0 (finite) | "Fibonacci fusion path counts" T:75 | S/09:13, 101-131, 196-200 |
| CA-10 | Lattice adds geometry; boost-as-energy-moment is an intuition | "Status: proposal shard with sourced boundary" | open/any; none; none | none | S/10:13-16, 87-111 |
| CA-11 | Poincare/Euclidean target; vector-field bracket table; boost-time -> momentum relation | "sourced definitions plus checked local derivation" | any (continuum target); none; target for R3 | "Poincare vector-field brackets" T:97 | S/11:13-16, 29, 50-111 |
| CA-12 | i[H,K]=sum (x_{j+1}-x_j) i[h_j,h_{j+1}] for nearest-neighbour h_j; uniform spacing -> momentum candidate | "Status: checked local derivation" (not sourced; boundary says no convergence) | open chain (inf); none (any local Hamiltonian); pre-R1 | "nearest-neighbour boost current coefficients" T:112 (checks only coefficient list x_{j+1}-x_j, not the operator identity) | S/12:13, 47-73, 99-104 |
| CA-13 | Scalar ramps, vector fields, rotations/boosts in d>1 | "Status: proposal shard with local derivation pattern" | open/any lattice; none; pre-R1 | none (refers to CA-12 test, S/13:26) | S/13:13-18, 96-109 |
| CA-14 | Koo-Saleur prototype: density Fourier modes + commutator corrections ~ Virasoro; KS 1993 source-local but conjectural/numerical; rigorous only for free fermions (OAR) | "source-local prototype plus later rigorous precedent" | periodic/open mixed (inf); L3-like (TL/XXZ/RSOS in source) and free-fermion; target R2 (only free-fermion sourced) | none | S/14:13-18, 120-127 |
| CA-15 | Acceptance tests: locality, self-adjointness, commutator closure, scaling convergence, observable covariance; evidence payload | "Status: specification shard" | any; none; R1-R3 as obligations | none | S/15:13-16, 86-107 |
| CA-16 | Lattice-symmetry compiler input/output/failure contract; status field Proposal/Source-local/Checked | "Status: compiler specification shard... not yet an implementation" | any; none | none | S/16:13-15, 67-81 |
| CA-17 | 6 small examples (black box, open, nonuniform, periodic, square, KS) + 7-item research queue | "Status: worked examples and queue"; per-example: checked finite derivation (Ex.2, S/17:49), proposal (Ex.5, S/17:82) | open/periodic/2D; none | T:97, T:112 | S/17:13, 49, 82, 93-105 |
| CA-18 | Galilean target differs from Lorentzian boost; needs conserved mass/number density | "sourced boundary plus proposal shard"; Bargmann mass extension = source gap | any; none | none | S/18:13-19 |
| CA-19 | Galilei algebra from Newtonian vector fields; signs pinned | "Status: checked local derivation" | any; none | "Galilei vector-field brackets" T:446 | S/19:13-17, 21, 107-129 |
| CA-20 | Mass central coefficient [mX_a,P_b]=i m delta_ab on common core | "sourced projective framework plus checked local derivation"; named Bargmann extension = source gap | any; none | "Galilei mass central coefficient" T:466 (only returns m*delta; trivial) | S/20:13-20, 102-110 |
| CA-21 | Galilean lattice boost = first moment of mass/number density; continuity -> current-sum momentum candidate | "Status: proposal plus checked local derivation" | open chain (inf); none | "first-moment continuity current coefficients" T:474 | S/21:13-18, 63-88, 102-115 |
| CA-22 | Galilean compiler slots + 5 examples; Hamiltonian density alone cannot compile Galilean boost | "Status: compiler specification shard" (one example labelled "checked formal derivation on a common core", S/22:106) | any; none | T:446, T:466, T:474 | S/22:13-16, 46-91, 159-172 |

Julia backing is thin: 6 testsets (T:21, 42, 75, 97, 112, 446/466/474) over helpers at src/CftAnyons.jl:32, 54, 69, 120, 194 and src/GalileiAlgebras.jl:52, 95, 108. Worklog 001 (CA-04..07: files worklog/001_2026-05-30_reboot.md) and 002 (CA-18..22: worklog/002_2026-05-30_compiler_spec.md) record the same content; worklog 002 itself states the mass term is "a checked canonical calculation, not ... a sourced named Bargmann-group claim".

## 3. Load-bearing / superseded / dead weight

Still load-bearing for the north star (verified by later citations in report/sections):
- CA-02, CA-03, CA-09: cited by CA-62, CA-65, CA-66 (variable-N anyonic Fock tower; S/62:14,19,87; S/65:18; S/66:17,215). CA-06 also by CA-66 and CA-22. This is the one thread of the block that feeds the current pipeline, and it is L0 kinematics (fusion-path/Fock carrier).
- CA-14 and CA-15: the most cited (CA-14 by 37, 42, 55, 61, 64, 67, 68, 70, 75, 79; CA-15 by 23, 25, 34-38, 43, 45, 52, 61, 64, 67, 75). CA-75 (integration map) uses CA-14 as the "only sourced convergence theorem is free-fermion" boundary (S/75:107) and merges CA-15 into the acceptance contract (S/75:23, 178). CA-79 depends on CA-14 (S/79:26). Their content is source-boundary and obligation lists, not derived results.
- CA-12: used by the Gaussian (CA-24,26,30) and qubit (CA-34,35,37-39) blocks as "the CA-12 candidate"; the test T:112 and the identity are the base of those obstruction checks. Note CA-35 (catalog) shows the first-moment route gives zero momentum candidate for fully on-site or commuting densities; this narrows but does not refute CA-12 (CA-35 says it "rules out only the first-moment route").
- CA-10/11/13/16/17 are cited by the Gaussian/qubit symmetry quests (CA-23, 24, 26, 32, 34, 36, 37, 38, 39, 41) as framing and bracket conventions (CA-11: Poincare table).

Superseded or absorbed:
- CA-04/CA-08 (generic Hilbert-space compiler) and CA-16/CA-22 (lattice-/Galilean-compiler specs): CA-22 cites CA-08/16; nothing downstream cites CA-04, CA-07, CA-22. The "compiler" framing was replaced by the category-to-lattice tower (CA-62..74, CA-75 integration map, CA-86/87 spacetime dictionary) and the OAR contracts (CA-81). I found no implementation of the compiler (S/16:13 "not yet an implementation"; S/22:13 "does not implement the compiler"; S/08:268-276).
- CA-01 pipeline map is superseded in practice by AGENTS.md north-star layering and CA-75; it still says "Fibonacci or Ising/TL" as first example (S/01:73-76), contrary to Rule 16.

Dead weight relative to the north star:
- Galilean block CA-18..22: cited only internally (CA-18 by 20,21,22; CA-19 by 20,22; CA-20 by 21; CA-21 by 22); no later shard uses it. Nonrelativistic mass central extension has no role in the category-to-CFT pipeline (CFT target is Poincare/conformal, not Galilean). Only src/GalileiAlgebras.jl and three testsets back it. Best treated as an isolated side study.
- CA-05/CA-07 symmetry decoration and S_n sectors: no downstream citations by CA-07; CA-05 only by CA-20. Bose/Fermi projectors are irrelevant to anyonic (L1) exchange, which S/07:119-122 explicitly leaves undefined.

## 4. Explicit gaps

Named source gaps:
- Bargmann/standard Galilei mass central extension: not registered locally (S/18:13-19; S/20:13-20, 102-110; worklog/002). Repeated in CA-22 next obligations item 1 (S/22:163-164).
- Weinberg and Koo-Saleur were registered later; S/10:113-121 and S/17:93-105 still list "use registered anchors before promoting exact Lorentz-generator formulas" as research-queue items 1-2, i.e. the formulas were never promoted in this block.

Proposals/specs never promoted within the block:
- CA-04 (Proposal / contract), CA-10, CA-13 (proposal), CA-18 (proposal), CA-21 (proposal part: Galilean candidate), CA-07 para-statistics projectors (S/07:111-117), CA-17 Ex.5 square-lattice (S/17:82). CA-08/15/16/22 are specifications with no implementation; no executable compiler exists.
- CA-15 acceptance tests: none discharged in this block. Later CA-64/67/75 reference them as open ("remains open", S/64:156).
- CA-17 research queue items 3-7 (general local energy-current theorem, periodic branch/sawtooth convention, higher-d oriented supports, closure tests on small chains, connect anyon-chain densities): none done here; item 7 is the only one touching the north star.

Asserted without a local citation / weakly backed:
- CA-02 and CA-05 carry source comments but their central claims (rig structure, distributivity as iso; propagation through OR/AND/Fock) are "derived" with no test; CA-04's regular-expression analogy is explicitly a proposal.
- Checks are weaker than the claims: T:112 and T:474 test only coefficient lists (x_{j+1}-x_j), not the operator commutator identity on any Hamiltonian; T:466 tests that a function returns m*delta (a convention pin, not a check of [mX,P]=im on a core); T:97/T:446 check a hard-coded bracket table against itself. CA-22 (S/22:106) labels an unbounded-operator statement "checked formal derivation on a common core" without domain analysis.
- CA-12 and CA-21 sign/orientation conventions rest on CONVENTIONS (h), (i); the periodic-chain case (branch of x) is unresolved (CA-17 queue item 4; CA-22 obligation 5).
- Layer/rung tags absent in all 23 shards; no shard states chiral vs full setting. CA-14 mixes periodic free-fermion rigour with open/periodic TL/XXZ heuristics without a setting tag.
- Verification note: I did not run Julia/LaTeX; testset names and lines were read from test/runtests.jl only.

## 5. Honest assessment

Essentially none of this block is a step along the category-to-CFT pipeline per se. What survives is infrastructure: (i) the L0 kinematic carrier (CA-02/03/09 -> CA-62/65/66 variable-N Fock/path tower), (ii) the CA-12 first-moment identity and CA-11 Poincare conventions that the Gaussian/qubit probe blocks reuse, and (iii) CA-14/CA-15 as the source-boundary statement ("only free-fermion KS convergence is rigorous") and obligation checklist that CA-75/CA-79 carry forward. All three are low-data (L0, any/open setting, rung R0 or pre-R1) and prove nothing about limit states (R1), Virasoro modes (R2), or modular data (L2). The generic compiler (CA-04/08/16) and the Galilean block (CA-18..22) are unimplemented specs or side topics with no downstream consumer; the Galilean shards are the cleanest candidates to treat as archived side work. The block's best-calibrated feature is its honesty about status labels; its main risk is that the spec shards read as infrastructure that does not exist. The Fibonacci shard (CA-09) is a valid L0 calibration datum only, and CA-01 still names Fibonacci/Ising as first scope, which Rule 16 now discourages.
