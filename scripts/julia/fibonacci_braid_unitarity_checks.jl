# High-precision checks for the sourced 5 x 5 Fibonacci braid construction B = F R F^*.

using LinearAlgebra

setprecision(BigFloat, 256)

function assert_small(name, value; tol = big"1e-70")
    println(rpad(name, 52), value < tol ? "PASS" : "FAIL", " residual=", value)
    if !(value < tol)
        error("$name: residual $value exceeds tolerance $tol")
    end
end

phi = (big(1) + sqrt(big(5))) / big(2)
a = inv(phi)
b = inv(sqrt(phi))

r_one = cis(big(4) * big(pi) / big(5))
r_tau = cis(-big(3) * big(pi) / big(5))

F = zeros(Complex{BigFloat}, 5, 5)
for i in 1:3
    F[i, i] = 1
end
F[4, 4] = a
F[4, 5] = b
F[5, 4] = b
F[5, 5] = -a

R = diagm(Complex{BigFloat}[r_one, r_tau, r_tau, r_one, r_tau])
I5 = Matrix{Complex{BigFloat}}(I, 5, 5)

B = F * R * F'

assert_small("F left unitarity", norm(F' * F - I5))
assert_small("F right unitarity", norm(F * F' - I5))
assert_small("F adjoint equals inverse", norm(F' - inv(F)))
assert_small("R left unitarity", norm(R' * R - I5))
assert_small("R right unitarity", norm(R * R' - I5))
assert_small("B matches F R F inverse", norm(B - F * R * inv(F)))
assert_small("B left unitarity", norm(B' * B - I5))
assert_small("B right unitarity", norm(B * B' - I5))

println("all Fibonacci braid unitarity checks passed")
