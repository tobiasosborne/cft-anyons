# Numerical finite-matrix postcomposition isometry checks.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

function assert_true(name, ok)
    println(rpad(name, 56), ok ? "PASS" : "FAIL")
    ok || error("check failed: $name")
end

E = ComplexF64[
    1 / sqrt(2) 0
    im / sqrt(2) 0
    0 1
]

F = ComplexF64[
    1+im 2-im
    -0.5+0.25im 3
]

G = ComplexF64[
    2-im -1+0.5im
    1+2im 0.75-im
]

assert_close("fine-graining matrix isometry", E' * E, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("postcomposition preserves Gram", (E * F)' * (E * G), target=F' * G)
assert_close("postcomposition preserves norm", (E * F)' * (E * F), target=F' * F)
assert_close(
    "converse identity test recovers isometry",
    (E * Matrix{ComplexF64}(I, 2, 2))' * (E * Matrix{ComplexF64}(I, 2, 2)),
    target=Matrix{ComplexF64}(I, 2, 2),
)

Ebad = ComplexF64[
    1 0
    0 2
    0 0
]
I2 = Matrix{ComplexF64}(I, 2, 2)
assert_true(
    "non-isometry fails identity Gram test",
    norm((Ebad * I2)' * (Ebad * I2) - I2) > 1,
)

println("all postcomposition isometry checks passed")
