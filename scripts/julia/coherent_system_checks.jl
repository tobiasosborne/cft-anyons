# Exact finite checks for coherent refinement maps and ascending observables.

using LinearAlgebra

function assert_equal(name, value, target)
    ok = value == target
    println(rpad(name, 52), ok ? "PASS" : "FAIL")
    ok || error("check failed: $name; value=$value target=$target")
end

function matpow(A, k)
    result = Matrix{Rational{Int}}(I, size(A, 1), size(A, 2))
    for _ in 1:k
        result = A * result
    end
    result
end

E(n, m) = matpow(A, m - n)
ascend(n, m, O) = transpose(E(n, m)) * O * E(n, m)
lift(n, m, O) = E(n, m) * O * transpose(E(n, m))

A = Rational{Int}[3//5 -4//5; 4//5 3//5]
I2 = Matrix{Rational{Int}}(I, 2, 2)
O = Rational{Int}[2//1 1//3; 1//3 5//2]

assert_equal("adjacent isometry", transpose(A) * A, I2)

for (n, m, l) in [(0, 0, 0), (0, 1, 3), (1, 3, 5), (2, 4, 7)]
    assert_equal("identity map n=$n", E(n, n), I2)
    assert_equal("coherence n=$n m=$m l=$l", E(m, l) * E(n, m), E(n, l))
    assert_equal("map isometry n=$n m=$l", transpose(E(n, l)) * E(n, l), I2)
    assert_equal("ascending unital n=$n m=$l", ascend(n, l, I2), I2)
    assert_equal("ascending composition n=$n m=$m l=$l",
        ascend(n, m, ascend(m, l, O)), ascend(n, l, O))
    assert_equal("logical lift identity n=$n", lift(n, n, O), O)
    assert_equal("logical lift composition n=$n m=$m l=$l",
        lift(m, l, lift(n, m, O)), lift(n, l, O))
end

println("all coherent system checks passed")
