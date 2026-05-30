# Exact/numerical checks for the secondary Ising/TL toy block.

setprecision(BigFloat, 256)

labels = (:one, :sigma, :epsilon)

fusion = Dict(
    (:one, :one) => Dict(:one => 1, :sigma => 0, :epsilon => 0),
    (:one, :sigma) => Dict(:one => 0, :sigma => 1, :epsilon => 0),
    (:one, :epsilon) => Dict(:one => 0, :sigma => 0, :epsilon => 1),
    (:sigma, :one) => Dict(:one => 0, :sigma => 1, :epsilon => 0),
    (:epsilon, :one) => Dict(:one => 0, :sigma => 0, :epsilon => 1),
    (:sigma, :sigma) => Dict(:one => 1, :sigma => 0, :epsilon => 1),
    (:sigma, :epsilon) => Dict(:one => 0, :sigma => 1, :epsilon => 0),
    (:epsilon, :sigma) => Dict(:one => 0, :sigma => 1, :epsilon => 0),
    (:epsilon, :epsilon) => Dict(:one => 1, :sigma => 0, :epsilon => 0),
)

function check(name, condition)
    println(rpad(name, 52), condition ? "PASS" : "FAIL")
    condition || error("check failed: $name")
end

function assert_close(name, value; tol = big"1e-70")
    ok = abs(value) <= tol
    println(rpad(name, 52), ok ? "PASS" : "FAIL", " error=", abs(value))
    ok || error("check failed: $name")
end

check("sigma tensor sigma = one plus epsilon",
    fusion[(:sigma, :sigma)][:one] == 1 &&
    fusion[(:sigma, :sigma)][:epsilon] == 1 &&
    fusion[(:sigma, :sigma)][:sigma] == 0)
check("sigma tensor epsilon = sigma", fusion[(:sigma, :epsilon)][:sigma] == 1)
check("epsilon tensor sigma = sigma", fusion[(:epsilon, :sigma)][:sigma] == 1)
check("epsilon tensor epsilon = one", fusion[(:epsilon, :epsilon)][:one] == 1)
check("multiplicity free", all(fusion[(a, b)][c] <= 1 for a in labels, b in labels, c in labels))
check("sigma sigma total multiplicity", sum(fusion[(:sigma, :sigma)][c] for c in labels) == 2)

delta_sigma = big(1) // 8
delta_epsilon = big(1)
assert_close("Delta_epsilon - 2 Delta_sigma = 3/4",
    BigFloat(delta_epsilon - 2 * delta_sigma - big(3) // 4))

for rho in BigFloat[big"0.2", big"0.5", big"0.9", big"1.7"]
    t = rho^(big(3) / big(4))
    numerator = (inv(sqrt(big(2))))^2 + (inv(sqrt(big(2))))^2 + (t / 2)^2
    denominator = 1 + t^2 / 4
    assert_close("toy normalisation rho=$rho", numerator / denominator - 1)
end

println("all Ising toy checks passed")
