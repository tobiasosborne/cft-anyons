import Lake
open Lake DSL

package «cft-anyons» where
  -- The project keeps the first layer independent of heavy category theory,
  -- but Mathlib is required for the Hilbert-space and matrix phases.

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git"

@[default_target]
lean_lib Formalisation where
