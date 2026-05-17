# Numerical finite-matrix component orthogonality checks.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

E = ComplexF64[
    1 / sqrt(2) 0
    im / sqrt(2) 0
    0 1
]

gram = E' * E
component_gram = [
    sum(conj(E[b, a]) * E[b, ap] for b in axes(E, 1))
    for a in axes(E, 2), ap in axes(E, 2)
]

assert_close("component Gram equals E'E", component_gram, target=gram)
assert_close("component orthogonality", component_gram, target=Matrix{ComplexF64}(I, 2, 2))

println("all component orthogonality checks passed")
