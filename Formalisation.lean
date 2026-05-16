-- Formalisation.lean — root file of the `Formalisation` lean_lib.
--
-- Empty placeholder at Phase 4 entry (P4.1: lake skeleton). Each
-- subsequent P4.* step (P4.2 through P4.14) ports one Mathlib-only
-- `LinearAlgebra/<file>.lean` from CAD; corresponding `import`
-- lines will be appended here in those commits. Phase 5 then adds
-- the fusion-category content (`Foundations/`, `Fibonacci/`,
-- `Ising/`).
--
-- Invariant (post-Phase 5): `lake build` passes; zero `sorry`;
-- zero `axiom`.

import Formalisation.Foundations.Configurations
import Formalisation.Foundations.ConfigurationSpace
import Formalisation.Foundations.DirectSumCoordinates
import Formalisation.Foundations.FockSpace
import Formalisation.Foundations.ProjectDefinitions
import Formalisation.Foundations.SkeletalFusion
import Formalisation.Fibonacci.Basic
import Formalisation.LinearAlgebra.Isometry
import Formalisation.LinearAlgebra.Polar
import Formalisation.LinearAlgebra.Tensor
import Formalisation.LinearAlgebra.TensorPower
import Formalisation.LinearAlgebra.HeterogeneousTensor
import Formalisation.LinearAlgebra.Trace
import Formalisation.LinearAlgebra.Postcompose
import Formalisation.LinearAlgebra.Component
import Formalisation.LinearAlgebra.NoMixing
import Formalisation.LinearAlgebra.FineGraining
import Formalisation.LinearAlgebra.CoherentSystem
import Formalisation.LinearAlgebra.DiagonalScaling
import Formalisation.LinearAlgebra.ChargeOnly
