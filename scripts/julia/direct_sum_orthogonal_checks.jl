# Exact checks for finite orthogonal direct-sum coordinate inclusions.

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
ranges = [inclusions[i] * projections[i] for i in eachindex(sizes)]

for i in eachindex(sizes)
    assert_equal("inclusion isometry i=$i",
        adjoint(inclusions[i]) * inclusions[i],
        Matrix{Int}(I, sizes[i], sizes[i]))
    assert_equal("projection is inclusion adjoint i=$i",
        adjoint(inclusions[i]),
        projections[i])
    assert_equal("range idempotent i=$i", ranges[i] * ranges[i], ranges[i])
    assert_equal("range self-adjoint i=$i", adjoint(ranges[i]), ranges[i])
end

ambient_vector = Complex{Rational{Int}}[
    1//1 + 2//1 * im,
    -3//1 + 1//1 * im,
    5//2 - 4//1 * im,
    7//1 + 0//1 * im,
    -2//1 - 3//1 * im,
    11//3 + 1//2 * im,
]

for i in eachindex(sizes)
    component_vector = Complex{Rational{Int}}[
        (k//1) + ((i + k)//1) * im for k in 1:sizes[i]
    ]
    assert_equal("adjoint pairing i=$i",
        dot(inclusions[i] * component_vector, ambient_vector),
        dot(component_vector, projections[i] * ambient_vector))
    assert_equal("range self-adjoint pairing i=$i",
        dot(ranges[i] * ambient_vector, ambient_vector),
        dot(ambient_vector, ranges[i] * ambient_vector))
end

for i in eachindex(sizes), j in eachindex(sizes)
    if i != j
        assert_equal("orthogonal ranges i=$i j=$j",
            ranges[i] * ranges[j],
            zeros(Int, total_dim, total_dim))
    end
end

println("all orthogonal direct-sum coordinate checks passed")
