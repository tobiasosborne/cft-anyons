# Numerical checks for the conditional diagonal scaling theorem.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 52), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

b = 3.0
chiral_weights = [0.0, 2 / 5, 2 / 5 + 1]
nonchiral_weights = [0.0, 4 / 5, 4 / 5 + 1]

for (name, weights) in [
    ("chiral b^(-h_i)", chiral_weights),
    ("nonchiral b^(-Delta_i)", nonchiral_weights),
]
    lambdas = b .^ (-weights)
    R = Diagonal(lambdas)
    for i in eachindex(weights)
        e = zeros(ComplexF64, length(weights))
        e[i] = 1
        assert_close("$name basis $i", R * e, target=lambdas[i] * e)
    end
end

println("all diagonal scaling checks passed")
