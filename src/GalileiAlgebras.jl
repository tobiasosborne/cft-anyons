const GalileiBasisKey = Tuple{Symbol, Int, Int}

_gal_h_key()::GalileiBasisKey = (:H, 0, 0)
_gal_p_key(a::Integer)::GalileiBasisKey = (:P, Int(a), 0)
_gal_g_key(a::Integer)::GalileiBasisKey = (:G, Int(a), 0)

function _gal_j_key(a::Integer, b::Integer)
    a == b && return nothing, 0
    if a < b
        return (:J, Int(a), Int(b)), 1
    else
        return (:J, Int(b), Int(a)), -1
    end
end

function _validate_galilei_key(key::GalileiBasisKey, spatial_dim::Integer)
    kind, a, b = key
    if kind == :H
        (a, b) == (0, 0) || error("Galilei H key must be (:H, 0, 0), got $key")
    elseif kind in (:P, :G)
        b == 0 || error("Galilei $kind key must have third entry 0, got $key")
        1 <= a <= spatial_dim || error("spatial index $a outside 1:$spatial_dim")
    elseif kind == :J
        a < b || error("rotation basis key must have a < b, got $key")
        1 <= a <= spatial_dim || error("spatial index $a outside 1:$spatial_dim")
        1 <= b <= spatial_dim || error("spatial index $b outside 1:$spatial_dim")
    else
        error("unknown Galilei basis kind $kind")
    end
end

function _negate_bracket(bracket)
    out = Dict{GalileiBasisKey, Int}()
    for (key, coeff) in bracket
        _add_coeff!(out, key, -coeff)
    end
    return out
end

"""
    galilei_vector_field_bracket(a, b, spatial_dim) -> Dict

Return the unextended Galilei vector-field Lie bracket in ``d`` spatial
dimensions.

Basis keys are ``(:H, 0, 0)`` for time translation, ``(:P, a, 0)`` for spatial
translations, ``(:G, a, 0)`` for Galilean boosts, and ``(:J, a, b)`` for
rotations with ``1 <= a < b <= d``. The vector-field convention is
``H = ∂_t``, ``P_a = ∂_a``, ``G_a = t∂_a``, and
``J_ab = x_a∂_b - x_b∂_a``.
"""
function galilei_vector_field_bracket(a::GalileiBasisKey, b::GalileiBasisKey, spatial_dim::Integer)
    spatial_dim < 1 && error("spatial_dim must be positive, got $spatial_dim")
    _validate_galilei_key(a, spatial_dim)
    _validate_galilei_key(b, spatial_dim)

    kind_a, i, j = a
    kind_b, k, l = b
    out = Dict{GalileiBasisKey, Int}()

    if kind_a == :H && kind_b == :G
        _add_coeff!(out, _gal_p_key(k), 1)
    elseif kind_a == :G && kind_b == :H
        _add_coeff!(out, _gal_p_key(i), -1)
    elseif kind_a == :J && kind_b in (:P, :G)
        key_builder = kind_b == :P ? _gal_p_key : _gal_g_key
        _add_coeff!(out, key_builder(i), j == k ? 1 : 0)
        _add_coeff!(out, key_builder(j), i == k ? -1 : 0)
    elseif kind_a in (:P, :G) && kind_b == :J
        return _negate_bracket(galilei_vector_field_bracket(b, a, spatial_dim))
    elseif kind_a == :J && kind_b == :J
        key, sign = _gal_j_key(i, l)
        _add_coeff!(out, key, (j == k ? 1 : 0) * sign)
        key, sign = _gal_j_key(j, l)
        _add_coeff!(out, key, -(i == k ? 1 : 0) * sign)
        key, sign = _gal_j_key(j, k)
        _add_coeff!(out, key, (i == l ? 1 : 0) * sign)
        key, sign = _gal_j_key(i, k)
        _add_coeff!(out, key, -(j == l ? 1 : 0) * sign)
    end

    return out
end

"""
    galilei_mass_central_coefficient(mass, boost_index, momentum_index)

Return the real coefficient ``m δ_ab`` in the canonical commutator
``[mX_a, P_b] = i m δ_ab``.

This is a checked algebraic coefficient for the mass central extension of the
Galilei boost-momentum bracket, not a source claim about a named Bargmann
group.
"""
function galilei_mass_central_coefficient(mass, boost_index::Integer, momentum_index::Integer)
    boost_index >= 1 || error("boost_index must be positive, got $boost_index")
    momentum_index >= 1 || error("momentum_index must be positive, got $momentum_index")
    return boost_index == momentum_index ? mass : zero(mass)
end

"""
    first_moment_continuity_current_coefficients(positions) -> Vector

Return the bond coefficients obtained from the discrete continuity identity
``i[H,n_j] = J_{j-1/2} - J_{j+1/2}`` after multiplying by ``x_j`` and summing
over an open chain.
"""
function first_moment_continuity_current_coefficients(positions)
    length(positions) >= 2 || error("need at least two lattice positions")
    return [positions[j + 1] - positions[j] for j in 1:(length(positions) - 1)]
end
