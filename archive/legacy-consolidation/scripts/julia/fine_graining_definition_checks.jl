# Independent finite-matrix checks for the fine-graining structure.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 52), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

E = ComplexF64[
    1 0
    0 1
    0 0
]

rho = ComplexF64[
    0.6+0im 0.1-0.2im
    0.1+0.2im 0.4+0im
]

F = ComplexF64[
    1+im 2
    -0.5 0.25-im
]
G = ComplexF64[
    -1+0.5im 0.75
    2-im -0.25+im
]
O = ComplexF64[
    1+0im 2-im 0.5+im
    -1+im 3+0im 0.25
    2-im -0.5+2im 1+0im
]

I2 = Matrix{ComplexF64}(I, 2, 2)
I3 = Matrix{ComplexF64}(I, 3, 3)
P = E * E'

assert_close("fine-graining isometry E'E", E' * E, target=I2)
assert_close("ascending unital from structure", E' * (I3 * E), target=I2)
assert_close("postcompose Gram preservation", (E * F)' * (E * G), target=F' * G)
assert_close("state embedding trace preservation", tr((E * rho) * E'), target=tr(rho))
assert_close("expectation preservation",
    tr(((E * rho) * E') * O), target=tr(rho * (E' * (O * E))))
assert_close("ascending star preservation",
    E' * (O' * E), target=(E' * (O * E))')
assert_close("logical lift identity", (E * I2) * E', target=P)
assert_close("logical lift retract",
    E' * (((E * rho) * E') * E), target=rho)
assert_close("range projection idempotent", P * P, target=P)
assert_close("range projection self-adjoint", P', target=P)

println("all fine-graining definition checks passed")
