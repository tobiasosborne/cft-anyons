# High-precision numerical checks for the sourced two-dimensional Fibonacci braid matrices.

using LinearAlgebra

setprecision(BigFloat, 256)

function assert_small(name, value; tol = big"1e-70")
    if !(value < tol)
        error("$name: residual $value exceeds tolerance $tol")
    end
end

q = cis(-big(2) * big(pi) / big(5))
phi = (big(1) + sqrt(big(5))) / big(2)
s = sqrt(phi)

B12 = Complex{BigFloat}[
    q^2 0;
    0 -q
]

B23 = (q / (q + 1)) * Complex{BigFloat}[
    -1 q * s;
    q * s q^2
]

relation_residual = norm(B12 * B23 * B12 - B23 * B12 * B23)
parameter_residual = abs(q * s^2 - (q^2 + q + 1))

assert_small("parameter relation", parameter_residual)
assert_small("braid relation", relation_residual)

println("all Fibonacci braid matrix checks passed")
