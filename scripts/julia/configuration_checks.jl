# Finite ordered site configuration checks.

function assert_equal(name, value, target)
    ok = value == target
    println(rpad(name, 52), ok ? "PASS" : "FAIL", "  value=", value)
    ok || error("check failed: $name")
end

particle_number(cfg; vacuum=0) = count(!=(vacuum), cfg)

for n in 0:8
    configs = collect(Iterators.product(ntuple(_ -> (0, 1), n)...))
    assert_equal("Fibonacci configurations n=$n", length(configs), 2^n)
    assert_equal("vacuum particle number n=$n", particle_number(ntuple(_ -> 0, n)), 0)
    assert_equal("tau particle number n=$n", particle_number(ntuple(_ -> 1, n)), n)

    for k in 0:n
        count_k = count(cfg -> particle_number(cfg) == k, configs)
        assert_equal("particle sector n=$n k=$k", count_k, binomial(n, k))
    end
end

println("all configuration checks passed")
