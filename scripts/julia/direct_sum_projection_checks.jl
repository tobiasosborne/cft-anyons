# Exact checks for finite direct-sum coordinate projection/inclusion equations.

using LinearAlgebra

function assert_equal(name, got, expected)
    if got != expected
        error("$name: got $got, expected $expected")
    end
end

sizes = [1, 2, 3]
offsets = cumsum([0; sizes[1:end-1]])
total_dim = sum(sizes)

function inclusion_matrix(j)
    m = zeros(Int, total_dim, sizes[j])
    for k in 1:sizes[j]
        m[offsets[j] + k, k] = 1
    end
    return m
end

function projection_matrix(i)
    m = zeros(Int, sizes[i], total_dim)
    for k in 1:sizes[i]
        m[k, offsets[i] + k] = 1
    end
    return m
end

inclusions = [inclusion_matrix(j) for j in eachindex(sizes)]
projections = [projection_matrix(i) for i in eachindex(sizes)]

for i in eachindex(sizes), j in eachindex(sizes)
    got = projections[i] * inclusions[j]
    expected = i == j ? Matrix{Int}(I, sizes[i], sizes[i]) :
                        zeros(Int, sizes[i], sizes[j])
    assert_equal("projection inclusion i=$i j=$j", got, expected)
end

resolution = sum(inclusions[j] * projections[j] for j in eachindex(sizes))
assert_equal("sum inclusion projection", resolution, Matrix{Int}(I, total_dim, total_dim))

const QI = Complex{Rational{Int}}
flat = QI[
    QI(1//2, 1//3),
    QI(-2//5, 1//7),
    QI(3//4, -1//6),
    QI(5//8, 0//1),
    QI(-1//9, -2//3),
    QI(7//10, 4//11)
]

components = [projections[i] * flat for i in eachindex(sizes)]
reconstructed = sum(inclusions[i] * components[i] for i in eachindex(sizes))
assert_equal("coordinate reconstruction", reconstructed, flat)

println("all direct-sum projection checks passed")
