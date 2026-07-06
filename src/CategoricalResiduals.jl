# CategoricalResiduals.jl
#
# CA-73 (categorical residual set), FILE 2: the ported residual calculus on the
# anyonic word tower A_L = End_C(O^{⊗L}). Two-site density h placed at bonds by
# the shift (FibonacciLocalOperators.jl); the CONVENTIONS (n) local residuals,
# coboundary distances (pinv/nullspace, CA-64 lesson), the open-window mode
# identity with its edge-support assertion, and exact transport through the
# CA-72 corner morphism. Plus the decisive dilute-image / parity-even dimension
# counts (W1.4 data). Concrete, finite, fail-loud; no deps beyond LinearAlgebra.
#
# Residual definitions verbatim from CONVENTIONS (n):494-536 and
# report/sections/73_categorical_residual_set.tex:71-98:
#   p_j = i[h_j, h_{j+1}],  A_j = i[h_j + h_{j+1}, p_j],
#   B_j = i[p_j, h_{j+1}] + 2 i[p_j, h_{j+2}],  (Du)_j = u_j - u_{j+1},
#   z_n = e^{2πin/L},  H_n^W = Σ_{j∈W} z_n^j h_j,  J_n^W = Σ_{j∈W} z_n^j p_j.

_icomm(A, B) = im * (A * B - B * A)

# h at bond j on a single charge sector (Float64 matrix).
_hbond(h, j::Integer, L::Integer, charge::Symbol) = local_two_site_matrix(h, j, L, charge)

"""
    chain_hamiltonian(h, L, charge) -> Matrix

Translation-invariant open-chain sum `H = Σ_{j=1}^{L-1} h_j` of the two-site
density `h` (fused blocks) on the charge sector.
"""
function chain_hamiltonian(h, L::Integer, charge::Symbol)
    L >= 2 || error("chain_hamiltonian needs L >= 2, got $L")
    H = zeros(Float64, size(_hbond(h, 1, L, charge)))
    for j in 1:(L - 1)
        H .+= _hbond(h, j, L, charge)
    end
    return H
end

"""
    momentum_density(h, j, L, charge) -> Matrix{ComplexF64}

`p_j = i[h_j, h_{j+1}]` (needs bond j+1, so `1 ≤ j ≤ L-2`). Self-adjoint.
"""
function momentum_density(h, j::Integer, L::Integer, charge::Symbol)
    1 <= j <= L - 2 || error("momentum bond j=$j outside 1:$(L-2) for L=$L")
    p = _icomm(_hbond(h, j, L, charge), _hbond(h, j + 1, L, charge))
    isapprox(p, p'; atol = 1e-12) || error("momentum density not self-adjoint")
    return p
end

"""
    conservation_density(h, j, L, charge) -> Matrix{ComplexF64}

`A_j = i[h_j + h_{j+1}, p_j]`, `p_j = i[h_j, h_{j+1}]` (needs `1 ≤ j ≤ L-2`).
"""
function conservation_density(h, j::Integer, L::Integer, charge::Symbol)
    p = momentum_density(h, j, L, charge)
    hj = _hbond(h, j, L, charge)
    hj1 = _hbond(h, j + 1, L, charge)
    A = _icomm(hj + hj1, p)
    isapprox(A, A'; atol = 1e-12) || error("conservation density not self-adjoint")
    return A
end

"""
    boost_density(h, j, L, charge) -> Matrix{ComplexF64}

`B_j = i[p_j, h_{j+1}] + 2 i[p_j, h_{j+2}]` (needs bond j+2, so `1 ≤ j ≤ L-3`).
"""
function boost_density(h, j::Integer, L::Integer, charge::Symbol)
    1 <= j <= L - 3 || error("boost bond j=$j outside 1:$(L-3) for L=$L")
    p = momentum_density(h, j, L, charge)
    B = _icomm(p, _hbond(h, j + 1, L, charge)) + 2 * _icomm(p, _hbond(h, j + 2, L, charge))
    isapprox(B, B'; atol = 1e-12) || error("boost density not self-adjoint")
    return B
end

# The 13 matrix-unit basis blocks of A_2 = M_2 ⊕ M_3 (support-2 local operators).
function _two_site_operator_basis()
    ops = Dict{Symbol,Matrix{Float64}}[]
    for a in 1:2, b in 1:2
        E = zeros(2, 2); E[a, b] = 1.0
        push!(ops, Dict(:one => E, :tau => zeros(3, 3)))
    end
    for a in 1:3, b in 1:3
        E = zeros(3, 3); E[a, b] = 1.0
        push!(ops, Dict(:one => zeros(2, 2), :tau => E))
    end
    return ops
end

"""
    coboundary_bond(u, j, L, charge) -> Matrix

`(Du)_j = u_j - u_{j+1}` for the two-site local density `u` (fused blocks).
"""
coboundary_bond(u, j::Integer, L::Integer, charge::Symbol) =
    _hbond(u, j, L, charge) - _hbond(u, j + 1, L, charge)

# Interior coboundary window (bonds j with Du_j support {j,j+1,j+2} inside 1:L).
_default_cob_window(L::Integer) = 2:(L - 3)

"""
    coboundary_distance(R, u_support, L, charge; window) -> Float64

Least-squares distance of the residual matrix `R` to the image of the coboundary
`D` over local densities `u` of support `u_support`, with `u` placed at each bond
in `window` (default `_default_cob_window`, kept off the open-chain boundary).
Uses `pinv` (the CA-64 lesson: the KKT normal system is singular). Only
`u_support == 2` is implemented (fail-loud otherwise).
"""
function coboundary_distance(R, u_support::Integer, L::Integer, charge::Symbol;
                             window = _default_cob_window(L))
    u_support == 2 || error("coboundary_distance implemented only for u_support=2, got $u_support")
    n = size(R, 1)
    cols = Vector{ComplexF64}[]
    for u in _two_site_operator_basis(), j in window
        push!(cols, ComplexF64.(vec(coboundary_bond(u, j, L, charge))))
    end
    isempty(cols) && error("empty coboundary window $window for L=$L")
    W = reduce(hcat, cols)
    r = ComplexF64.(vec(R))
    proj = W * (pinv(W) * r)
    return norm(r - proj)
end

"""
    mode_operator(density_fn, n, L, charge, window) -> Matrix{ComplexF64}

`Σ_{j∈window} z_n^j · density_fn(j)`, `z_n = e^{2πin/L}` (CONVENTIONS (t): index
phases at own scale). `density_fn(j)` returns the bond-`j` operator.
"""
function mode_operator(density_fn, n::Integer, L::Integer, window)
    z = cis(2 * pi * n / L)
    terms = [z^j * ComplexF64.(density_fn(j)) for j in window]
    return sum(terms)
end

"""
    mode_identity_edge_defect(h, m, n, L, charge, hwin) -> (defect, edge_term)

For H-window bond set `hwin = a:b`, returns `Δ = [H_m^W, H_n^W] +
i(z_n - z_m) J_{m+n}^W` and the predicted single top-edge current
`i(z_n - z_m) z_{m+n}^b p_b`. The exact identity `Δ == edge_term` is the strong
locality assertion: the bulk telescopes and only the boundary current `p_b`
(supported on the edge cells, sites b..b+2) survives (report Lemma, :100-110).
"""
function mode_identity_edge_defect(h, m::Integer, n::Integer, L::Integer,
                                   charge::Symbol, hwin)
    hf(j) = _hbond(h, j, L, charge)
    pf(j) = momentum_density(h, j, L, charge)
    Hm = mode_operator(hf, m, L, hwin)
    Hn = mode_operator(hf, n, L, hwin)
    Jmn = mode_operator(pf, m + n, L, hwin)
    zm = cis(2 * pi * m / L); zn = cis(2 * pi * n / L); zmn = cis(2 * pi * (m + n) / L)
    b = last(hwin)
    defect = (Hm * Hn - Hn * Hm) + im * (zn - zm) * Jmn
    edge = im * (zn - zm) * zmn^b * pf(b)
    return defect, edge
end

# --- Transport through the CA-72 corner morphism (block operators). ---
# Block version of a bond operator: Dict(charge => matrix) on the coarse chain.
_hbond_block(h, j::Integer, L::Integer) =
    Dict(c => _hbond(h, j, L, c) for c in _FIB_CHARGES)

"""
    dyadic_placement(k) -> Placement

The CA-68 dyadic refinement `φ(j) = 2j-1` as a `Placement` `[k] -> [2k]`.
"""
dyadic_placement(k::Integer) = Placement(k, 2k, [2j - 1 for j in 1:k])

"""
    transported_momentum(h, j, k, phi) -> Dict, Dict

Returns `θ_φ(p_j)` (corner image of the coarse momentum) and the momentum built
from the stretched densities `i[θ(h_j), θ(h_{j+1})]`. Equal because θ is a
*-morphism (Lemma 73.1 / 72.1): residual calculus transports exactly.
"""
function transported_momentum(h, j::Integer, k::Integer, phi::Placement)
    pj = Dict(c => momentum_density(h, j, k, c) for c in _FIB_CHARGES)
    θp = corner_morphism(pj, phi)
    θhj = corner_morphism(_hbond_block(h, j, k), phi)
    θhj1 = corner_morphism(_hbond_block(h, j + 1, k), phi)
    built = Dict(c => im * (θhj[c] * θhj1[c] - θhj1[c] * θhj[c]) for c in _FIB_CHARGES)
    return θp, built
end

# --- FILE 2b: decisive dimension counts (W1.4 data). ---
# Tier-1 generator block operators on the length-L chain (both charges), as the
# unital set {1, occupancy n_j, hop_j, pair_j, dense_e_j}. n_j, hop_j, pair_j
# generate the full dilute image (a_j,b_j recovered via [ΣjN, ·]/[Σ n, ·]).
function _tier1_generators(L::Integer)
    charges = _FIB_CHARGES
    gens = Dict{Symbol,Matrix{Float64}}[]
    push!(gens, Dict(c => Matrix{Float64}(I, length(fibonacci_word_sector_basis(L, c)),
                                          length(fibonacci_word_sector_basis(L, c)))
                     for c in charges))
    for j in 1:(L - 1), op in (hop_blocks(), pair_blocks(), dense_e_blocks())
        push!(gens, Dict(c => _hbond(op, j, L, c) for c in charges))
    end
    for j in 1:L
        push!(gens, Dict(c => Matrix{Float64}(occupation_number_matrix(L, j, c))
                         for c in charges))
    end
    return gens
end

_block_vec(T) = vcat(vec(T[:one]), vec(T[:tau]))

"""
    dilute_image_dimension(L; tol = 1e-8) -> Int

Dimension of the unital *-algebra generated by the Tier-1 generators
`{1, n_j, hop_j, pair_j, e_j}` inside `⊕_c M_{m_c(L)}`, via span-closure under
LEFT-multiplication by the generators (which reaches every word). Independence
by incremental Gram–Schmidt on the per-charge-block vectorization (length
`m_1² + m_τ² = F_{4L-1}`); `tol` is the residual-norm floor. Anchored values
(CA-69, report/sections/69_dilute_tl_word_algebra.tex:96): 9 at L=2, 51 at L=3.
"""
function dilute_image_dimension(L::Integer; tol::Real = 1e-8)
    G = _tier1_generators(L)
    Q = Vector{Vector{ComplexF64}}()
    count = 0
    function tryadd!(T)
        v = ComplexF64.(_block_vec(T))
        for q in Q
            v .-= (q' * v) .* q
        end
        nv = norm(v)
        nv > tol && (push!(Q, v ./ nv); count += 1; return true)
        return false
    end
    frontier = Dict{Symbol,Matrix{Float64}}[]
    for g in G
        tryadd!(g) && push!(frontier, g)
    end
    while !isempty(frontier)
        newfront = Dict{Symbol,Matrix{Float64}}[]
        for T in frontier, g in G
            prod = Dict(c => g[c] * T[c] for c in _FIB_CHARGES)
            tryadd!(prod) && push!(newfront, prod)
        end
        frontier = newfront
    end
    return count
end

"""
    parity_even_dimension(L) -> Int

`Σ_c (m_{c,even}(L)² + m_{c,odd}(L)²)`, the dimension of the occupied-parity-
preserving subalgebra of `⊕_c M_{m_c(L)}` (each charge block split by `|S|`
parity). CA-69 conjectures this equals the dilute image; anchored 9, 51 at L=2,3.
"""
function parity_even_dimension(L::Integer)
    total = 0
    for c in _FIB_CHARGES
        b = fibonacci_word_sector_basis(L, c)
        ev = Base.count(x -> iseven(length(x[1])), b)
        od = length(b) - ev
        total += ev^2 + od^2
    end
    return total
end
