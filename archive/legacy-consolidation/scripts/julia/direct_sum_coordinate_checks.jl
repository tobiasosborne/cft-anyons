# Exact checks for finite direct-sum coordinate flattening.

function assert_equal(name, got, expected)
    if got != expected
        error("$name: got $got, expected $expected")
    end
end

function assert_true(name, condition)
    if !condition
        error("$name failed")
    end
end

function flatten_components(components)
    vcat(components...)
end

function unflatten_components(flat, sizes)
    out = Vector{Vector{eltype(flat)}}()
    offset = 0
    for n in sizes
        push!(out, flat[offset + 1:offset + n])
        offset += n
    end
    return out
end

function coordinate_pairing(x, y)
    sum(conj(xi) * yi for (xi, yi) in zip(x, y); init = zero(eltype(x)))
end

const QI = Complex{Rational{Int}}

x_components = [
    QI[QI(1//2, 1//3)],
    QI[QI(-2//5, 1//7), QI(3//4, -1//6)],
    QI[QI(5//8, 0//1), QI(-1//9, -2//3), QI(7//10, 4//11)]
]

y_components = [
    QI[QI(-3//7, 2//9)],
    QI[QI(4//5, -1//8), QI(-5//6, 3//10)],
    QI[QI(1//12, -7//13), QI(2//15, 5//16), QI(-6//17, 1//18)]
]

sizes = length.(x_components)
x_flat = flatten_components(x_components)
y_flat = flatten_components(y_components)

assert_equal("dimension additivity", length(x_flat), sum(sizes))
assert_equal("flatten/unflatten x", unflatten_components(x_flat, sizes), x_components)
assert_equal("flatten/unflatten y", unflatten_components(y_flat, sizes), y_components)

a = QI(2//3, -1//5)
b = QI(-4//7, 3//8)
lhs = flatten_components([a .* x_components[i] .+ b .* y_components[i]
                          for i in eachindex(x_components)])
rhs = a .* x_flat .+ b .* y_flat
assert_equal("complex linearity", lhs, rhs)

component_pairing = sum(coordinate_pairing(x_components[i], y_components[i])
                        for i in eachindex(x_components); init = zero(QI))
flat_pairing = coordinate_pairing(x_flat, y_flat)
assert_equal("pairing preservation", component_pairing, flat_pairing)

println("all direct-sum coordinate checks passed")
