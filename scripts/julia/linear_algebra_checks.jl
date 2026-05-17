# Independent finite-matrix checks for general fine-graining/channel claims.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 48), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

E = ComplexF64[
    1 0
    0 1
    0 0
]

theta = pi / 5
U = ComplexF64[
    cos(theta) sin(theta) 0
    -sin(theta) cos(theta) 0
    0 0 1
]

O_coarse = ComplexF64[
    2+0im 1-im
    -3+2im 0.5+0im
]

O_fine = ComplexF64[
    1+0im 2-im 0.25+0.5im
    -1+3im 0.75+0im 2+0im
    0.5-im 1+0.25im -2+0im
]

X_fine = ComplexF64[
    1+im -2+0.5im 0.25+0im
    0.5-im 3+0im -1+2im
    2+0im -0.25+im 1-im
    -1+0.5im 0.75-im 2.5+0im
]

I2 = Matrix{ComplexF64}(I, 2, 2)
I3 = Matrix{ComplexF64}(I, 3, 3)

assert_close("E'E = I", E' * E, target=I2)
assert_close("U'U = I", U' * U, target=I3)
assert_close("(U E)'(U E) = I", (U * E)' * (U * E), target=I2)
assert_close("ascending unital", E' * (I3 * E), target=I2)
assert_close("ascending star preserving", E' * (O_fine' * E), target=(E' * (O_fine * E))')
assert_close("logical lift retract", E' * (((E * O_coarse) * E') * E), target=O_coarse)
Pcode = E * E'
assert_close("logical lift identity is code projection", (E * I2) * E', target=Pcode)
assert_close("code projection idempotent", Pcode * Pcode, target=Pcode)
assert_close("code projection self-adjoint", Pcode', target=Pcode)
square_fine = X_fine' * X_fine
square_witness = X_fine * E
assert_close(
    "ascending preserves Gram-form witness",
    E' * (square_fine * E),
    target=square_witness' * square_witness,
)

println("all finite-matrix linear algebra checks passed")
