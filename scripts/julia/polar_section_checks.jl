# Numerical finite-matrix polar-section checks.

using LinearAlgebra

tol = 1e-10

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

B = ComplexF64[
    1+im 2-im 0.5
    -1 0.25+0.5im 1-im
]

G = B * B'
F = eigen(Hermitian(G))
R = F.vectors * Diagonal(1 ./ sqrt.(F.values)) * F.vectors'
E = B' * R

entry_formula = [
    sum(conj(B[mu, nu]) * R[mu, m] for mu in axes(B, 1))
    for nu in axes(B, 2), m in axes(B, 1)
]

assert_close("inverse-square-root condition", R' * (G * R), target=Matrix{ComplexF64}(I, 2, 2))
assert_close("polar section isometry", E' * E, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("polar entry formula", E, target=entry_formula)

Bdiag = ComplexF64[
    2 0 0
    0 3 0
]
gdiag = real.(diag(Bdiag * Bdiag'))
Rdiag = Diagonal(1 ./ sqrt.(gdiag))
Ediag = Bdiag' * Rdiag
assert_close("diagonal Gram entries", gdiag, target=[4.0, 9.0])
assert_close("diagonal inverse sqrt condition",
    Matrix(Rdiag') * ((Bdiag * Bdiag') * Matrix(Rdiag)),
    target=Matrix{ComplexF64}(I, 2, 2))
assert_close("diagonal polar section isometry",
    Ediag' * Ediag, target=Matrix{ComplexF64}(I, 2, 2))

println("all polar section checks passed")
