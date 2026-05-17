# Numerical charge-only contrast counterexample.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

function assert_true(name, value)
    println(rpad(name, 56), value ? "PASS" : "FAIL")
    value || error("check failed: $name")
end

amplitude = 1 / 2
b = 32.0
target = b^(-2 / 5)

R = ComplexF64[
    (1 + amplitude) / 2 (1 - amplitude) / 2
    (1 - amplitude) / 2 (1 + amplitude) / 2
]

identity = ComplexF64[1, 1]
contrast = ComplexF64[1, -1]

assert_close("charge-only identity fixed", R * identity, target=identity)
assert_close("charge-only contrast eigenvalue", R * contrast, target=amplitude * contrast)
assert_close("b=32 target b^(-2/5)", target, target=1 / 4)
assert_true("chosen amplitude differs from b^(-2/5)", abs(amplitude - target) > tol)

println("all charge-only negative checks passed")
