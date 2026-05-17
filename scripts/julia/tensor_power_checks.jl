# Exact finite checks for fixed-map Kronecker tensor powers.

using LinearAlgebra

function assert_equal(name, value, target)
    ok = value == target
    println(rpad(name, 52), ok ? "PASS" : "FAIL")
    ok || error("check failed: $name; value=$value target=$target")
end

function tensor_power(E, n)
    T = reshape(Rational{Int}[1], 1, 1)
    for _ in 1:n
        T = kron(E, T)
    end
    T
end

function reversal_permutation(n)
    P = zeros(Rational{Int}, n, n)
    for i in 1:n
        P[i, n + 1 - i] = 1//1
    end
    P
end

E = Rational{Int}[3//5 -4//5; 4//5 3//5]
assert_equal("base isometry", transpose(E) * E, Matrix{Rational{Int}}(I, 2, 2))

for n in 0:6
    T = tensor_power(E, n)
    assert_equal("tensor power n=$n", transpose(T) * T,
        Matrix{Rational{Int}}(I, size(T, 2), size(T, 2)))
end

Erect = Rational{Int}[1//1 0//1; 0//1 3//5; 0//1 4//5]
assert_equal("rectangular base isometry", transpose(Erect) * Erect,
    Matrix{Rational{Int}}(I, 2, 2))

for n in 0:4
    T = tensor_power(Erect, n)
    U = reversal_permutation(size(T, 1))
    assert_equal("dressing unitary n=$n", transpose(U) * U,
        Matrix{Rational{Int}}(I, size(T, 1), size(T, 1)))
    assert_equal("dressed tensor power n=$n", transpose(U * T) * (U * T),
        Matrix{Rational{Int}}(I, size(T, 2), size(T, 2)))
end

println("all tensor power checks passed")
