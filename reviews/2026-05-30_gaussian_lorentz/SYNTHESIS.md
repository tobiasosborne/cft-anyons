# Synthesis — Gaussian Lorentz Shard Reviews

This synthesis summarizes four independent reviews of CA-10--CA-17 and
CA-23--CA-28.  It is not a replacement for the review files; it is the action
queue for the next shard-writing turn.

## Review Files

- `reviewer_01_source_conventions.md` — source/provenance/convention review.
- `reviewer_02_algebra_domains.md` — signs, domains, and operator algebra.
- `reviewer_03_numerics_examples.md` — Julia checks and example systems.
- `reviewer_04_stress_tensor_proposal.md` — stress-energy proposal map.

## Highest-Severity Findings

1. **The vector-field-to-self-adjoint-generator sign map is not fixed.**  CA-11
   derives vector-field brackets, while CA-24--CA-26 use a definite
   self-adjoint commutator table.  A convention must state the map from
   continuum vector fields to quantum generators before Poincare-sign residuals
   are promoted beyond formal algebra.

2. **Finite periodic grids do not carry the exact canonical differential
   commutator.**  The phrase "trigonometric-polynomial core" in CA-26 is too
   loose if read as exact finite-dimensional `[X,P]=iI`.  Periodic grids are
   currently safe for symbol/eigenvalue checks, not for exact position/momentum
   commutators or first moments without branch data.

3. **The Gaussian one-particle measure is not fixed.**  The boost
   \(K_a=\frac12(X_a\omega+\omega X_a)\) is a flat momentum-space formula.  The
   sourced free-field constructions use weighted one-particle structures or
   mass-shell measures.  The next convention must state the Hilbert-space
   measure and any unitary transform that justifies this boost form.

4. **The real-space stress-energy density layer is absent.**  The current
   Gaussian block fixes total scalar symbols and one-particle residuals, but not
   a local density \(h_x\), bond/cell split, current assignment, normal ordering,
   or improvement convention.  Stress-energy claims must remain proposal-level.

5. **CA-26 overstates "checked" coverage.**  Tests currently check boost-time
   symbols, Hessian residuals, finite stiffness spectra, and examples.  They do
   not check boost-momentum, rotation-Hamiltonian, boost-boost, or
   second-quantized commutator identities.

6. **Massless examples must be labelled coefficient-only.**  The sourced
   one-particle/Fock machinery assumes positive mass or \(\omega>0\) on the
   patch.  The doubler test with `mass = 0` is a valid rejection witness, but not
   evidence for a massless Fock-generator policy.

7. **Numerical conventions and validators are missing.**  Tolerances, centered
   momentum grids, coefficient symmetry/positivity validation, and single-patch
   minimum data need conventions and tests before the helpers become compiler
   gates.

8. **CA-23 roadmap drift should be repaired.**  The planned CA-27--CA-31 roles
   no longer match the actual CA-27--CA-28 shards.  This is navigationally
   important because the omitted "real-space densities" shard is exactly the
   bridge needed for stress-energy.

## Stress-Energy Proposal Takeaways

For **1+1 dimensions**, the viable next proposal is:

- Fix a Gaussian real-space density convention for \(T_{00}^{lat}=h_j\).
- On open chains, define an energy-current candidate from the CA-12 identity,
  schematically \(j^E_{j+1/2}\sim i[h_j,h_{j+1}]\), with sign set by a discrete
  continuity equation.
- Treat \(T_{10}^{lat}\) as a comparison target, not an assumption: test whether
  the integrated energy current matches the one-particle \(d\Gamma(k)\) momentum
  candidate in the low-energy limit.
- Define \(T_{11}^{lat}\) operationally as the current of the momentum-density
  candidate, then test trace/chiral relations only in a sourced massless CFT
  setting.
- Use Koo-Saleur-style Fourier modes as the sourced 1+1 precedent, but keep the
  current bosonic Gaussian case separate until the needed sources are acquired.

For **2+1 and 3+1 dimensions**, the proposal needs additional structure before
it is well-posed:

- Oriented cells/faces for energy currents \(T_{0a}^{lat}\).
- A local momentum-density layer \(T_{a0}^{lat}\), not just a total momentum.
- Stress components \(T_{ab}^{lat}\) from momentum-continuity equations.
- Rotation constraints, symmetric-stress/improvement policy, and anisotropic
  lattice artifact diagnostics.
- Boundary policy: open boxes with endpoint terms or a sourced periodic
  sawtooth/Fourier construction.

## Recommended Next Shards

1. **Convention Repair Shard.**  Fix the self-adjoint-generator sign map,
   Gaussian one-particle measure, massive/zero-mode boundary, numerical
   tolerance policy, and periodic centered-momentum branch policy.

2. **Gaussian Real-Space Density Shard.**  Define the local split of
   \(H=\frac12p^2+\frac12qVq\), including bond sharing, cell-volume factors,
   normal ordering/vacuum subtraction, and improvement ambiguity.

3. **1+1 Stress-Energy Candidate Shard.**  Define \(T_{00}^{lat}\),
   \(T_{01}^{lat}\), \(T_{10}^{lat}\), and \(T_{11}^{lat}\) as candidates with
   explicit continuity equations and endpoint terms.

4. **Current-vs-Symbol Equivalence Shard.**  For the nearest-neighbour Gaussian
   chain, compare the real-space first-moment current to the momentum-space
   boost-time residual and \(d\Gamma(k)\) target.

5. **Higher-Dimensional Cell-Current Shard.**  Formulate the oriented
   \(d=2,3\) energy-current and stress-component problem, with rotations and
   boosts as acceptance tests rather than assumptions.

6. **Numerical Hardening Shard.**  Add centered momentum grids, Fourier
   eigenvector tests, finite-difference derivative oracles, coefficient
   validators, stability/single-minimum checks, and current-density failure
   witnesses.

## Source Acquisition Queue

- Weinberg QFT Vol. 1 or another local source for stress-energy/Poincare
  generator formulas and sign conventions.
- Original Koo-Saleur source, registered rather than cited through secondary
  memory.
- Discrete Gaussian/free-boson Virasoro source currently present only as
  bibliography metadata.
- A harmonic-chain or free-boson energy-current source, unless the continuity
  equations are derived and checked locally first.
