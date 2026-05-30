# Exact rational checks for the Fibonacci conformal-weight input.

function assert_equal(name, value, target)
    ok = value == target
    println(rpad(name, 48), ok ? "PASS" : "FAIL", "  value=", value)
    ok || error("check failed: $name")
end

su2_wzw_spin_weight(level, spin) = spin * (spin + 1) // (level + 2)

tau_h = su2_wzw_spin_weight(3, 1)
tau_delta = tau_h + tau_h
vacuum_h = 0 // 1
vacuum_ope_exponent = vacuum_h - 2 * tau_h
tau_ope_exponent = tau_h - 2 * tau_h

assert_equal("SU(2)_3 spin-1 h", tau_h, 2 // 5)
assert_equal("diagonal left+right Delta", tau_delta, 4 // 5)
assert_equal("tau primary exponent", -tau_h, -2 // 5)
assert_equal("diagonal tau exponent", -tau_delta, -4 // 5)
assert_equal("vacuum channel OPE exponent", vacuum_ope_exponent, -4 // 5)
assert_equal("tau channel OPE exponent", tau_ope_exponent, -2 // 5)
assert_equal("vacuum norm exponent", 2 * vacuum_ope_exponent, -8 // 5)
assert_equal("tau norm exponent", 2 * tau_ope_exponent, -4 // 5)

for n in 0:6
    assert_equal("tau descendant exponent n=$n", -(tau_h + n), -(2 // 5 + n))
    assert_equal("vacuum descendant exponent n=$n", -(vacuum_h + n), -n // 1)
end

println("all CFT weight checks passed")
