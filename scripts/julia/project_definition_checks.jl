# Exact checks for the finite-coordinate project definitions Q and H_N^W.

function assert_equal(name, got, expected)
    if got != expected
        error("$name: got $got, expected $expected")
    end
end

function configs(labels, n)
    n == 0 && return [String[]]
    smaller = configs(labels, n - 1)
    return [[prefix..., label] for prefix in smaller for label in labels]
end

particle_number(vacuum, cfg) = count(!=(vacuum), cfg)
sector_size(cfg) = count(==("tau"), cfg) + 1

function coordinate_pairing(x, y)
    sum(conj(xi) * yi for (xi, yi) in zip(x, y); init = zero(eltype(x)))
end

function unflatten_components(flat, sizes)
    out = Vector{Vector{eltype(flat)}}()
    offset = 0
    for len in sizes
        push!(out, flat[offset + 1:offset + len])
        offset += len
    end
    return out
end

const QI = Complex{Rational{BigInt}}

labels = ["one", "tau"]
vacuum = "one"
n = 4
cfgs = configs(labels, n)
sizes = sector_size.(cfgs)

assert_equal("local occupation summands", length(labels), 2)
assert_equal("Q tensor N label summands", length(cfgs), length(labels)^n)
assert_equal("Fibonacci Q tensor N label summands", length(cfgs), 2^n)
assert_equal("vacuum tensor particle number", particle_number(vacuum, fill(vacuum, n)), 0)
assert_equal("all-tau tensor particle number", particle_number(vacuum, fill("tau", n)), n)
assert_equal("H_N^W flattened dimension", sum(sizes), length(vcat([fill(zero(QI), s) for s in sizes]...)))

x_components = [
    [QI(big(2 * j + k)//big(11 + j + k), big(j - 3 * k)//big(17 + j + k))
     for k in 1:sizes[j]]
    for j in eachindex(cfgs)
]
y_components = [
    [QI(big(j - k)//big(19 + j + k), big(4 * j + k)//big(23 + j + k))
     for k in 1:sizes[j]]
    for j in eachindex(cfgs)
]

x_flat = vcat(x_components...)
y_flat = vcat(y_components...)

assert_equal("H_N^W unflatten x", unflatten_components(x_flat, sizes), x_components)
assert_equal("H_N^W unflatten y", unflatten_components(y_flat, sizes), y_components)

component_pairing = sum(coordinate_pairing(x_components[i], y_components[i])
                        for i in eachindex(cfgs); init = zero(QI))
flat_pairing = coordinate_pairing(x_flat, y_flat)
assert_equal("H_N^W pairing preservation", component_pairing, flat_pairing)

println("all project definition checks passed")
