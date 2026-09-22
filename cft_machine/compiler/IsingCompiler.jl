module IsingCompiler
using LinearAlgebra
include("Cyclo16.jl")
include("../benchmarks/fermion/FermionBenchmark.jl")
using .FermionBenchmark
export Cyclo16, ZETA16, SQRT2, ModularDatum, IsingRecipe, UnsupportedCategory
export ising_datum, relabel, compile_ising, compile_product, product_modular_data
export sample_local_field, observable_word, local_observable_recipe
export realize, refinement, exact_string, complex_value, minimal_model_fusion
include("ModularInput.jl")
include("LocalObservables.jl")
include("Microscopic.jl")
end
