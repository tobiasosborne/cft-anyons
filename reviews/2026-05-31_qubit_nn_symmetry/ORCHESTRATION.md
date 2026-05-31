# Orchestration -- qubit nearest-neighbour symmetry diagnostics

Date: 2026-05-31.

Purpose: investigate whether nearest-neighbour qubit Hamiltonian densities,
written in a two-site Pauli basis, admit finite algebraic diagnostics that can
rule out candidate microscopic realisations of Poincare/Witt/Virasoro symmetry
before any continuum theorem is attempted.

## Parent scope

The parent agent owns all repository edits and shard integration.  Subagents are
read-only reviewers.  Their outputs should be synthesized into report shards
starting at CA-34 and into the worklog.  Do not treat a subagent statement as
ground truth until it is tied to an existing local source, a local derivation, or
a Julia invariant.

## Subagents

| ID | Nickname | Scope | Status |
|---|---|---|---|
| `019e7d82-50fb-7662-970f-cfdd9936d0ae` | Turing | 1+1D Poincare/current algebra for two-site Pauli density `h`; adjacent commutator diagnostics and fully local obstruction. | completed; integrated into CA-35 |
| `019e7d82-515b-7462-83cc-a269fd4bd4cd` | Heisenberg | 2+1D qubit edge-density diagnostics: ramp currents, rotation closure, isotropy, patch checks, caveats. | completed; integrated into CA-36 |
| `019e7d82-51c6-7ef2-80ce-f3894ce7896f` | Dirac | 1+1D Witt/Virasoro/Koo-Saleur finite algebra diagnostics for Pauli nearest-neighbour chains. | completed; integrated into CA-37 |
| `019e7d82-5266-7652-83c1-ff54811dfe55` | Hume | Source/provenance audit for the planned shards and local evidence chain. | completed; integrated into CA-34--CA-37 |

## Intended shard landing

Proposed shard split, subject to subagent findings:

1. `CA-34-QUBIT-NEAREST-NEIGHBOUR-SYMMETRY-QUEST`: scope, Pauli-basis input,
   convention boundaries, and investigation plan.
2. `CA-35-QUBIT-1D-BOOST-CURRENT-OBSTRUCTIONS`: checked local derivation for
   `i[h_{j,j+1}, h_{j+1,j+2}]`, including the fully on-site obstruction under a
   symmetric site-density split.
3. `CA-36-QUBIT-2D-PLAQUETTE-SYMMETRY-DIAGNOSTICS`: proposal-level 2+1D patch
   diagnostics from ramp currents, isotropy, and rotation closure.
4. `CA-37-QUBIT-WITT-VIRASORO-DIAGNOSTICS`: proposal-level Koo-Saleur/Witt
   finite algebra tests, with central-term and low-energy-sector caveats.

If the first integration pass grows too large, land CA-34--CA-35 first and keep
CA-36--CA-37 as explicitly open queue items.

## Non-negotiable boundaries

- No continuum Poincare, Witt, or Virasoro realisation claim from finite
  commutator diagnostics alone.
- No periodic first-moment without a branch/sawtooth/Fourier-coordinate
  convention.
- No stress-energy or momentum-density identification in 2+1D without a named
  density/current convention.
- A fully local single-site Hamiltonian is only ruled out after fixing the
  density split.  The safe first convention is the symmetric split of a
  translation-invariant on-site term across neighbouring bonds.
