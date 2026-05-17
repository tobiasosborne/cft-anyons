# Independent check for the finite skeletal Fibonacci fusion table.

const labels = (:one, :tau)

fusion = Dict(
    (:one, :one) => Dict(:one => 1, :tau => 0),
    (:one, :tau) => Dict(:one => 0, :tau => 1),
    (:tau, :one) => Dict(:one => 0, :tau => 1),
    (:tau, :tau) => Dict(:one => 1, :tau => 1),
)

function check(name, condition)
    println(rpad(name, 44), condition ? "PASS" : "FAIL")
    condition || error("check failed: $name")
end

check("1 tensor 1 = 1", fusion[(:one, :one)][:one] == 1 && fusion[(:one, :one)][:tau] == 0)
check("1 tensor tau = tau", fusion[(:one, :tau)][:one] == 0 && fusion[(:one, :tau)][:tau] == 1)
check("tau tensor 1 = tau", fusion[(:tau, :one)][:one] == 0 && fusion[(:tau, :one)][:tau] == 1)
check("tau tensor tau = 1 plus tau", fusion[(:tau, :tau)][:one] == 1 && fusion[(:tau, :tau)][:tau] == 1)
check("multiplicity free", all(fusion[(a, b)][c] <= 1 for a in labels, b in labels, c in labels))
check("tau tensor tau total multiplicity", sum(fusion[(:tau, :tau)][c] for c in labels) == 2)
check("left unit skeletal law", all(fusion[(:one, a)][c] == (c == a ? 1 : 0) for a in labels, c in labels))
check("right unit skeletal law", all(fusion[(a, :one)][c] == (c == a ? 1 : 0) for a in labels, c in labels))
check("left unit total multiplicity", all(sum(fusion[(:one, a)][c] for c in labels) == 1 for a in labels))
check("right unit total multiplicity", all(sum(fusion[(a, :one)][c] for c in labels) == 1 for a in labels))

println("all Fibonacci fusion-rule checks passed")
