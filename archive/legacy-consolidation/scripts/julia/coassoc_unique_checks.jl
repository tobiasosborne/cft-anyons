# High-precision checks for the scalar positive coassociative solution.

setprecision(BigFloat, 256)

const tol = big"1e-70"

function assert_small(name, value; tolerance = tol)
    ok = abs(value) <= tolerance
    println(rpad(name, 52), ok ? "PASS" : "FAIL", " error=", abs(value))
    ok || error("check failed: $name")
end

function assert_true(name, condition)
    println(rpad(name, 52), condition ? "PASS" : "FAIL")
    condition || error("check failed: $name")
end

phi = (big(1) + sqrt(big(5))) / big(2)
x0 = inv(phi)
y0 = inv(sqrt(phi))
r0 = inv(phi^(big(3) / big(2)))

assert_small("candidate x^2+y^2", x0^2 + y0^2 - 1)
assert_small("candidate 2x^2+r^2", 2x0^2 + r0^2 - 1)
assert_small("candidate eigen equation", r0^2 - phi^(-big(3) / big(2)) * x0 * y0)
assert_small("y equals phi^-1/2", y0 - inv(sqrt(phi)))
assert_small("r equals phi^-3/2", r0 - inv(phi * sqrt(phi)))
assert_small("r^2 equals phi^-3", r0^2 - phi^(-3))
assert_small("r is positive sqrt phi^-3", r0 - sqrt(phi^(-3)))

eta = BigFloat[
    x0 0;
    y0 0;
    0 x0;
    0 x0;
    0 r0
]
gram = transpose(eta) * eta
assert_small("coassoc eta Gram (1,1)", gram[1, 1] - 1)
assert_small("coassoc eta Gram (2,2)", gram[2, 2] - 1)
assert_small("coassoc eta Gram offdiag (1,2)", gram[1, 2])
assert_small("coassoc eta Gram offdiag (2,1)", gram[2, 1])

# Eliminating y and r gives a polynomial in u=x^2:
# (1-2u)^2 = phi^-3 u(1-u), with roots phi^-2 and phi^-1.
u1 = phi^(-2)
u2 = phi^(-1)

function eliminated_polynomial(u)
    (1 - 2u)^2 - phi^(-3) * u * (1 - u)
end

assert_small("root u=phi^-2", eliminated_polynomial(u1))
assert_small("root u=phi^-1", eliminated_polynomial(u2))
assert_true("positive r selects u<1/2 root", u1 < big(1) / 2 && u2 > big(1) / 2)
assert_small("recover positive x", sqrt(u1) - x0)
assert_small("recover positive y", sqrt(1 - u1) - y0)
assert_small("recover positive r", sqrt(1 - 2u1) - r0)

println("all scalar coassociative uniqueness checks passed")
