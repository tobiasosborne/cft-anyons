# Local consistency conditions for categorical CFT reconstruction

This is the fresh, model-independent investigation requested on 2026-10-21.
The aim is to separate **formulating equations** from **finding solutions**:
category and boundary data should determine cutoff-dependent local lattices,
whose standard Koo–Saleur generators and OAR limit realize a rigorous CFT.
The organizing requirement is that local coordinate changes be generated
by the stress tensor belonging to the same local observable theory.

**Current result:** a proposed cell-equation system, explicit local Taylor
recurrences, conditional algebraic obstruction calculations, and a separate
list of quantitative microscopic certificates. At the user's subsequent
request, small VecZ2/semion/Fibonacci inputs now test the categorical and
low-grade stress equations. The four-port system is now explicit, with an
exact semion tensor ansatz, a conditional primary-multiplicity selection,
and necessary Fibonacci functional equations. No complete category-to-CFT
reconstruction or universal existence/sufficiency theorem is claimed.
The latest research state and handoff are recorded in `worklog/`.

## Read order

| Note | Content and claim status |
|---|---|
| [01_cells.md](01_cells.md) | Unknown boundary carriers and cell amplitudes; C0–C7 typing, positivity, sewing, Ward, curvature, stress and KS constraints; proved conditional Ward-sewing identity; coefficient recurrence. |
| [02_obstructions.md](02_obstructions.md) | Derived algebraic innerness obstruction; central CE cocycle; scalar counterterms; geometric curvature and Bianchi; exact finite-matrix limitation. |
| [03_sewing_deformations.md](03_sewing_deformations.md) | Sewing multipliers; explicit normalized binary deformation complex and H²/H³ statements; limits of a proposed full deformation complex. |
| [04_cutoff_oar.md](04_cutoff_oar.md) | Explicit nearest-neighbour KS tier, finite patch flux obstruction, state/GNS consistency and energy-weighted refinement estimates; analytic conclusions still requiring proof. |
| [05_mixed_complex.md](05_mixed_complex.md) | Derived CE/Hochschild complex coupling an associative product to its Lie derivation action; explicit mixed first-order and gauge equations. |
| [06_small_category_sewing.md](06_small_category_sewing.md) | Exact VecZ2/Fibonacci dagger Frobenius solutions and an associator obstruction for the semion A=1+s ansatz. |
| [07_small_category_cohomology.md](07_small_category_cohomology.md) | Explicit separability contraction proving vanishing categorical Hochschild groups for the two positive solutions; scope of their categorical derivations. |
| [08_small_category_stress.md](08_small_category_stress.md) | Selected modular lifts, exact stress Gram forms, vacuum exchange coefficients through grade four and a semion null-state channel equation. |
| [09_four_port_equations.md](09_four_port_equations.md) | Typed four-port sewings, full-carrier contractions, positive null quotients, categorical/analytic dual-basis maps and normalization equations. |
| [10_four_port_linearization.md](10_four_port_linearization.md) | Reflected positivity, countable common-chart Taylor equations, metric/collar variations and formal cokernel obstructions. |
| [11_semion_four_port.md](11_semion_four_port.md) | Exact null ODE, two Virasoro functions inside one tensor-valued semion channel, F=-1 and declared R=i, positive reflected kernels. |
| [12_fibonacci_four_port.md](12_fibonacci_four_port.md) | Exact conditional descendant coefficients, normalization-aware crossing and midpoint hierarchy; separate conditional modular-character obstruction. |
| [13_semion_multiplicity.md](13_semion_multiplicity.md) | Under the stated finite skew-dual ansatz, graded Hilbert positivity plus null/crossing equations force primary multiplicity two; pointwise positivity does not. |

Root `CONVENTIONS.md` (ac)–(ai) fixes signs and scope. The newly acquired
source map is `references/categorical-reconstruction/SOURCES.md`; the notes
also cite already registered sources by exact local anchors.

## The concrete local system

Cell maps have type `Z_P:D_in -> D_out tensor L_P`, with a Hermitian anomaly
line L_P. On a coordinate-change chart the basic equation is

    partial_i Z_P + B_i^+ Z_P - Z_P B_i^- = 0,

where B^+ includes the outgoing and anomaly-line connections and B^- is
incoming. The generators must be supplied by the cell's own stress field.
For ordinary Taylor coefficients the equation becomes

    (alpha_i+1) Z_(alpha+e_i)
      = -sum_(beta<=alpha) [B^+_(i,beta) Z_(alpha-beta)
                           -Z_(alpha-beta) B^-_(i,beta)].

Different differentiation orders yield curvature compatibility. Sewn
maps obey exactly

    W_(Z2 Z1)=W2 Z1+Z2 W1,

so local Ward errors have an explicit propagation law. Bounds on the
resulting sums are still required as the number of cells grows.

This horizontal equation is not a demand that every Euclidean deformation
be unitary. Real unitary reparametrizations have skew connection operators;
a collar has positive evolution exp(-tE), with partial_t P=-EP. Other
moduli need a specified stress-insertion equation. The general moduli part
remains a schema until the geometry-to-insertion rule is fixed for a chosen
cell grammar. Countably many formal equations do not supply convergence.

## The obstruction calculations obtained so far

| Problem | Precisely established algebraic statement | Boundary |
|---|---|---|
| Generate a coordinate derivation locally | `[delta]=0` in HH¹(B,E), for a declared implementer bimodule E. | A restricted support ansatz may instead give only a linear cokernel; operator domains and locality remain. |
| Lift the Lie action projectively | Inner lifts have central defect; after scalarity it is a CE 2-cocycle. | A nonzero class is allowed. Matching a target class, not erasing every anomaly, is the relevant condition. |
| Extend binary sewing to the next formal order | `d phi_N=O_N`, with `d O_N=0`; obstruction `[O_N]` lies in H³ of the fixed associative complex. | Geometry, adjoints and all other equations are frozen; this is not the full CFT deformation complex. |
| Deform product and coordinate action together | The explicit total differential squares to zero; `d_HH phi=0`, `d_CE phi=d_HH psi`, `d_CE psi=0`. | This couples the associative and Lie-action fragments; it does not yet impose internal stress or all geometric sewings. |
| Find a bounded-support momentum flux | Residual must lie in the image of the finite patch divergence map. | Hamiltonian time evolution is not a square-zero cochain differential. |
| Deform the entire proposed system | Linearization gives a cokernel obstruction. | A cohomology group requires verified identities between equations; its complete complex has not been constructed. |

## Exact symbolic verification

From the repository root:

```bash
python3 scripts/python/run_local_conformal_checks.py
```

The checks use Python and the already available SymPy; no network or large
matrix computation is involved. They expand universal free multilinear
expressions and polynomial identities, not a particular physical model.
The bundle `runs/2026-10-21-local-conformal-consistency/` records raw runs,
software versions and producer SHA256 hashes. Eleven symbolic tests pass;
five deliberate mutations are rejected: Hochschild sign, Ward sign,
circle-bracket sign, Taylor derivative factor, and mixed cochain-action
sign. The restored run passes.

These checks validate algebraic formulas and detect sign/coefficient
regressions. They do not validate analytic CFT existence or a continuum limit.

The separately requested small-input probe is reproduced by
`python3 scripts/python/run_small_category_inputs.py`. Its ten exact tests
and four rejected mutations are recorded in
`runs/2026-10-21-small-category-inputs/`, with matrices, block coefficients,
software versions and source/producer hashes. No chain diagonalization or
computation beyond the declared grade/arity-four budget is used.

Four-port checks use `python3 scripts/python/run_four_port_consistency.py`.
Fifteen exact test groups pass and five deliberately incorrect choices are
rejected. The bundle `runs/2026-10-21-four-port-consistency/` records raw
outputs, exact block/tensor/kernel data, software versions and ten source/
producer/dependency hashes. No truncated Taylor series is treated as an
exact analytic continuation or midpoint crossing test.

## What this makes possible next

The next task can now be formulated without selecting a model: choose a
presentation of elementary geometrically marked cells and their local moves;
specify the independent-modulus insertion rules; linearize the combined
sewing/Ward/stress equations; and derive the identities between those
equations. That would identify which parts form an actual local deformation
complex, and which remaining conditions are positivity or analytic bounds.
Solving that system and proving its realization theorem remain separate tasks.
The small-input tests solve particular binary equations and formal stress
blocks. Four-port equations now have the explicit semion solution within
its declared analytic/duality ansatz; Fibonacci's completed analytic blocks
and positive four-port sewing remain unknown. For both, complete carriers,
higher sewing, local Hamiltonians, standard KS and OAR remain further tasks.
