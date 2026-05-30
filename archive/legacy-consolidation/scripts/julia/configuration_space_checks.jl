# Exact checks for finite configuration-space coordinate direct sums.

function assert_equal(name, got, expected)
    if got != expected
        error("$name: got $got, expected $expected")
    end
end

function configs(labels, n)
    n == 0 && return [String[]]
    smaller = configs(labels, n - 1)
    return [[first..., label] for first in smaller for label in labels]
end

particle_number(cfg) = count(==("tau"), cfg)
sector_size(cfg) = particle_number(cfg) + 1

function coordinate_pairing(x, y)
    sum(conj(xi) * yi for (xi, yi) in zip(x, y); init = zero(eltype(x)))
end

function unflatten_components(flat, sizes)
    out = Vector{Vector{eltype(flat)}}()
    offset = 0
    for n in sizes
        push!(out, flat[offset + 1:offset + n])
        offset += n
    end
    out
end

const QI = Complex{Rational{Int}}

labels = ["one", "tau"]
n = 3
cfgs = configs(labels, n)
sizes = sector_size.(cfgs)

assert_equal("Fibonacci configuration count", length(cfgs), 2^n)
assert_equal("dependent dimension sum", sum(sizes), 20)

x_components = [
    [QI((j + 2 * k)//(13 + j + k), (j - k)//(17 + j + k)) for k in 1:sizes[j]]
    for j in eachindex(cfgs)
]
y_components = [
    [QI((3 * j - k)//(19 + j + k), (j + 2 * k)//(23 + j + k)) for k in 1:sizes[j]]
    for j in eachindex(cfgs)
]

x_flat = vcat(x_components...)
y_flat = vcat(y_components...)

assert_equal("flatten dimension", length(x_flat), sum(sizes))
assert_equal("unflatten x", unflatten_components(x_flat, sizes), x_components)
assert_equal("unflatten y", unflatten_components(y_flat, sizes), y_components)

component_pairing = sum(coordinate_pairing(x_components[i], y_components[i])
                        for i in eachindex(cfgs); init = zero(QI))
flat_pairing = coordinate_pairing(x_flat, y_flat)
assert_equal("pairing preservation", component_pairing, flat_pairing)

constant_sector_dim = 3
assert_equal("constant sector dimension", length(cfgs) * constant_sector_dim,
    2^n * constant_sector_dim)

println("all configuration-space coordinate checks passed")
