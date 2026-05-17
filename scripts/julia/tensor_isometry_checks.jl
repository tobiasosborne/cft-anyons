# Numerical finite-matrix tensor-product isometry checks.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

E1 = ComplexF64[
    1 / sqrt(2) 0
    im / sqrt(2) 0
    0 1
]

E2 = ComplexF64[
    1 / sqrt(3)
    im / sqrt(3)
    1 / sqrt(3)
]

E3 = ComplexF64[
    3/5 -4/5
    4/5 3/5
]

E4 = ComplexF64[
    1 0
    0 3/5
    0 4/5
]

K = kron(E1, E2)
K3 = kron(K, E3)
K4 = kron(K3, E4)
U3 = Matrix{ComplexF64}(I, size(K3, 1), size(K3, 1))[end:-1:1, :]
U4 = Matrix{ComplexF64}(I, size(K4, 1), size(K4, 1))[end:-1:1, :]
D3 = U3 * K3
D4 = U4 * K4

assert_close("first factor isometry", E1' * E1, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("second factor isometry", E2' * E2, target=1 + 0im)
assert_close("third factor isometry", E3' * E3, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("fourth factor isometry", E4' * E4, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("three-factor dressing unitary", U3' * U3, target=Matrix{ComplexF64}(I, size(K3, 1), size(K3, 1)))
assert_close("four-factor dressing unitary", U4' * U4, target=Matrix{ComplexF64}(I, size(K4, 1), size(K4, 1)))
assert_close("Kronecker product isometry", K' * K, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("three-factor heterogeneous Kronecker isometry",
    K3' * K3, target=Matrix{ComplexF64}(I, 4, 4))
assert_close("dressed three-factor Kronecker isometry",
    D3' * D3, target=Matrix{ComplexF64}(I, 4, 4))
assert_close("four-factor heterogeneous Kronecker isometry",
    K4' * K4, target=Matrix{ComplexF64}(I, 8, 8))
assert_close("dressed four-factor Kronecker isometry",
    D4' * D4, target=Matrix{ComplexF64}(I, 8, 8))

println("all tensor isometry checks passed")
