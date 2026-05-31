const QUBIT_AXIS_TO_PAULI_INDEX = Dict(:x => 2, :y => 3, :z => 4)

struct QubitHamiltonianSample
    name::String
    family::Symbol
    parameters::Dict{Symbol, Float64}
    coefficients::Matrix{Float64}
end

function _qubit_axis_index(axis::Symbol)
    haskey(QUBIT_AXIS_TO_PAULI_INDEX, axis) ||
        error("unknown qubit Pauli axis $axis; expected :x, :y, or :z")
    return QUBIT_AXIS_TO_PAULI_INDEX[axis]
end

function _empty_two_site_density(; scalar::Real = 0.0)
    h = zeros(Float64, 4, 4)
    h[1, 1] = Float64(scalar)
    return h
end

function _add_symmetric_field!(h, axis::Symbol, coefficient::Real)
    idx = _qubit_axis_index(axis)
    h[idx, 1] += Float64(coefficient) / 2
    h[1, idx] += Float64(coefficient) / 2
    return h
end

function _add_bilinear!(h, left_axis::Symbol, right_axis::Symbol, coefficient::Real)
    h[_qubit_axis_index(left_axis), _qubit_axis_index(right_axis)] += Float64(coefficient)
    return h
end

function qubit_onsite_field_density(; hx::Real = 0.0, hy::Real = 0.0, hz::Real = 0.0,
        scalar::Real = 0.0)
    h = _empty_two_site_density(; scalar)
    _add_symmetric_field!(h, :x, hx)
    _add_symmetric_field!(h, :y, hy)
    _add_symmetric_field!(h, :z, hz)
    return h
end

function qubit_xyz_density(; jx::Real = 0.0, jy::Real = 0.0, jz::Real = 0.0,
        hx::Real = 0.0, hy::Real = 0.0, hz::Real = 0.0, dmz::Real = 0.0,
        scalar::Real = 0.0)
    h = qubit_onsite_field_density(; hx, hy, hz, scalar)
    _add_bilinear!(h, :x, :x, jx)
    _add_bilinear!(h, :y, :y, jy)
    _add_bilinear!(h, :z, :z, jz)
    _add_bilinear!(h, :x, :y, dmz)
    _add_bilinear!(h, :y, :x, -dmz)
    return h
end

function qubit_tfim_density(; coupling::Real = 1.0, field::Real = 1.0,
        interaction_axis::Symbol = :z, field_axis::Symbol = :x)
    h = _empty_two_site_density()
    _add_bilinear!(h, interaction_axis, interaction_axis, -coupling)
    _add_symmetric_field!(h, field_axis, -field)
    return h
end

qubit_xy_density(; jx::Real = 1.0, jy::Real = 1.0, field_z::Real = 0.0) =
    qubit_xyz_density(; jx, jy, hz = field_z)

qubit_xxz_density(; exchange::Real = 1.0, delta::Real = 1.0, field_z::Real = 0.0) =
    qubit_xyz_density(; jx = exchange, jy = exchange, jz = delta * exchange, hz = field_z)

qubit_heisenberg_density(; exchange::Real = 1.0, hx::Real = 0.0, hy::Real = 0.0,
        hz::Real = 0.0) =
    qubit_xyz_density(; jx = exchange, jy = exchange, jz = exchange, hx, hy, hz)

qubit_compass_density(; jx::Real = 1.0, jz::Real = 1.0) =
    qubit_xyz_density(; jx, jz)

qubit_dm_density(; exchange::Real = 1.0, delta::Real = 0.0, dmz::Real = 1.0) =
    qubit_xyz_density(; jx = exchange, jy = exchange, jz = delta * exchange, dmz)

function _sample(name, family, parameters, coefficients)
    return QubitHamiltonianSample(
        String(name),
        Symbol(family),
        Dict(Symbol(k) => Float64(v) for (k, v) in pairs(parameters)),
        Matrix{Float64}(coefficients),
    )
end

function _deterministic_generic_density(seed::Integer)
    h = zeros(Float64, 4, 4)
    for a in 1:4, b in 1:4
        h[a, b] = 0.37 * sin(seed * (2a + 3b)) + 0.19 * cos((seed + a) * (b + 1))
    end
    h[1, 1] = 0.0
    return h
end

function qubit_candidate_scan_samples(; include_generic::Bool = true)
    samples = QubitHamiltonianSample[]
    push!(samples, _sample("onsite_x", :onsite, (; hx = 1.0),
        qubit_onsite_field_density(; hx = 1.0)))
    push!(samples, _sample("classical_zz", :ising_classical, (; coupling = 1.0),
        qubit_xyz_density(; jz = -1.0)))

    for field in (0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 2.0)
        name = field == 1.0 ? "tfim_self_dual" : "tfim_field_$(field)"
        push!(samples, _sample(name, :tfim, (; coupling = 1.0, field),
            qubit_tfim_density(; coupling = 1.0, field)))
    end

    for (jx, jy) in Iterators.product((-1.0, -0.5, 0.5, 1.0), (-1.0, -0.5, 0.5, 1.0))
        push!(samples, _sample("xy_jx_$(jx)_jy_$(jy)", :xy, (; jx, jy),
            qubit_xy_density(; jx, jy)))
    end

    for delta in (-2.0, -1.0, -0.5, 0.0, 0.5, 1.0, 2.0)
        family = delta == 1.0 ? :heisenberg : :xxz
        name = delta == 1.0 ? "heisenberg_iso" : "xxz_delta_$(delta)"
        push!(samples, _sample(name, family, (; exchange = 1.0, delta),
            qubit_xxz_density(; exchange = 1.0, delta)))
    end

    for (jx, jy, jz) in Iterators.product((-1.0, 0.0, 1.0), (-1.0, 0.0, 1.0), (-1.0, 0.0, 1.0))
        (jx, jy, jz) == (0.0, 0.0, 0.0) && continue
        push!(samples, _sample("xyz_$(jx)_$(jy)_$(jz)", :xyz, (; jx, jy, jz),
            qubit_xyz_density(; jx, jy, jz)))
    end

    for (axis, field) in ((:x, 0.3), (:z, 0.3), (:y, -0.4))
        params = axis == :x ? (; hx = field) : axis == :y ? (; hy = field) : (; hz = field)
        push!(samples, _sample("heisenberg_field_$(axis)", :heisenberg_field, params,
            qubit_heisenberg_density(; params...)))
    end

    for dmz in (-1.0, -0.5, 0.5, 1.0)
        push!(samples, _sample("dmz_$(dmz)", :dm, (; exchange = 1.0, delta = 0.0, dmz),
            qubit_dm_density(; exchange = 1.0, delta = 0.0, dmz)))
    end

    for (jx, jz) in Iterators.product((-1.0, 0.5, 1.0), (-1.0, 0.5, 1.0))
        push!(samples, _sample("compass_$(jx)_$(jz)", :compass, (; jx, jz),
            qubit_compass_density(; jx, jz)))
    end

    if include_generic
        for seed in 1:24
            push!(samples, _sample("generic_$(seed)", :generic_bilinear_field, (; seed),
                _deterministic_generic_density(seed)))
        end
    end
    return samples
end

function qubit_sample_source_kind(sample::QubitHamiltonianSample)
    sample.family in (:tfim, :xy, :xxz, :heisenberg) && return :locally_sourced_family
    return :synthetic_scan_input
end

qubit_sourced_candidate_samples() =
    filter(sample -> qubit_sample_source_kind(sample) == :locally_sourced_family,
        qubit_candidate_scan_samples(; include_generic = false))

qubit_synthetic_candidate_samples() =
    filter(sample -> qubit_sample_source_kind(sample) == :synthetic_scan_input,
        qubit_candidate_scan_samples())
