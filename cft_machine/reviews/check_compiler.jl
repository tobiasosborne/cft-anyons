# Exact additional checks run by the independent compiler referee.
# Sources/conventions: ../compiler/PROOF.md; root CONVENTIONS (y).
using Test, LinearAlgebra
include(joinpath(@__DIR__, "..", "compiler", "IsingCompiler.jl"))
using .IsingCompiler
BLAS.set_num_threads(1)
@testset "Independent anomaly and label transport" begin
    d=ising_datum()
    @test (d.S*Diagonal(d.theta))^3==ZETA16*Matrix{Cyclo16}(I,3,3)
    for p in ([1,2,3],[1,3,2]), q in ([1,2,3],[1,3,2])
        a=relabel(d,p)
        b=relabel(d,q)
        data=product_modular_data(compile_product([a,b]))
        perm=data.input_product_to_canonical
        @test data.S[perm,perm]==kron(a.S,b.S)
        @test data.theta[perm]==[a.theta[i]*b.theta[j] for i in 1:3 for j in 1:3]
        @test (data.S*Diagonal(data.theta))^3==ZETA16^2*Matrix{Cyclo16}(I,9,9)
    end
end
