# Exact checks for finite truncated distinguishable-Fock coordinates.

using LinearAlgebra

function assert_equal(name, got, expected)
    if got != expected
        error("$name: got $got, expected $expected")
    end
end

function sector_dim(local_dim, n)
    return local_dim^n
end

function truncated_dim(local_dim, max_n)
    return sum(sector_dim(local_dim, n) for n in 0:max_n)
end

for local_dim in 1:5, max_n in 0:7
    assert_equal("zero sector local_dim=$local_dim", sector_dim(local_dim, 0), 1)
    assert_equal("one sector local_dim=$local_dim", sector_dim(local_dim, 1), local_dim)
    assert_equal("truncated count local_dim=$local_dim max_n=$max_n",
        truncated_dim(local_dim, max_n),
        sum(local_dim^n for n in 0:max_n))
end

function component_vectors(local_dim, max_n)
    xs = Vector{Vector{Complex{Rational{Int}}}}()
    ys = Vector{Vector{Complex{Rational{Int}}}}()
    cursor = 0
    for n in 0:max_n
        len = sector_dim(local_dim, n)
        x = Complex{Rational{Int}}[]
        y = Complex{Rational{Int}}[]
        for k in 1:len
            cursor += 1
            push!(x, cursor//1 + (n + k)//1 * im)
            push!(y, (2 * cursor - k)//1 - (n + 1)//1 * im)
        end
        push!(xs, x)
        push!(ys, y)
    end
    return xs, ys
end

for local_dim in (2, 3), max_n in (0, 1, 4)
    xs, ys = component_vectors(local_dim, max_n)
    flat_x = reduce(vcat, xs)
    flat_y = reduce(vcat, ys)
    assert_equal("flattened dimension local_dim=$local_dim max_n=$max_n",
        length(flat_x), truncated_dim(local_dim, max_n))
    assert_equal("pairing preservation local_dim=$local_dim max_n=$max_n",
        dot(flat_x, flat_y),
        sum(dot(xs[n + 1], ys[n + 1]) for n in 0:max_n))
end

for max_n in 0:8
    assert_equal("Fibonacci two-label truncated count max_n=$max_n",
        truncated_dim(2, max_n),
        sum(2^n for n in 0:max_n))
end

println("all truncated Fock coordinate checks passed")
