# Proposed minimal-model input extension — not implemented

Work on this extension stopped at the user's request to wind up and report.
There is no new recognizer, cyclotomic implementation, compiler test suite,
or run artifact in this directory. The existing coset benchmark and positive
Hamiltonian work live under `cft_machine/benchmarks/`; they are not a completed
tricritical-Ising modular-input compiler.

The proposed next supported input was the m=4 minimal model, whose k=2 coset
stress invariants have already been checked in the existing sparse benchmark.
A future exact recognizer could derive fusion and conformal weights from
`references/cft-machine/realisation/KawahigashiLongo2002/source.tex:647–669`,
use the complete DHR-sector identification and phases at `:1106–1157`, and
construct the normalized modular matrix through the balancing relation at
`references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:689–690`.
Exact arithmetic conventions and a guarded input/output contract would need
to be registered before implementing that proposal.

The user's final steering is to pursue **local models on fusion spaces**, with
the global constraints incorporated in the admissible basis. The current
vacuum-descendant spaces are computed subspaces of an ambient fermion Fock
space. No equivalence with a categorical fusion-path basis, and no spatially
local operator representation on such a basis, has been established. Building
that identification is a constructive next step; the presence of global
constraints alone is not a proof that a local fusion-space realization is
impossible.
