# CA-64 fixed-residual GNS-norm SDP objective tier.
#
# For a fixed residual density R (a Vector{PauliTerm}), the GNS quantity is
#   ||pi_omega(R) Omega||^2 = omega(R* R).
# At moment level N this is  v_N(R) = min_y omega_y(R* R)  over the CA-43/CA-44
# moment-PSD, translation-invariant, relation-constrained moment cone. Because R
# is fixed, omega_y(R* R) is affine in the moments y, so this is a genuine SDP.
# The normalized value is nu_N = v_N / tau(R* R) with tau(R* R) = sum_s |r_s|^2.
#
# Optimizing the witnesses (u, w, lambda, e) jointly with y is NOT an SDP (it is
# bilinear); attempting it here is a hard error until an SOS/alternating lift is
# registered as a convention.

struct QubitResidualNormSDPResult
    status::Symbol
    objective_value::Float64
    normalized_value::Float64
    termination_status::MOI.TerminationStatusCode
    model_data::QubitSDPModelData
end

"""
    residual_square_terms(residual) -> Vector{PauliTerm}

Combined Pauli terms of ``R^* R`` for a self-adjoint-coefficient residual
``R = sum_s r_s P_s`` (each ``P_s`` a Hermitian Pauli word), using
``R^* R = sum_{s,t} conj(r_s) r_t phase(s,t) P_{st}``.
"""
function residual_square_terms(residual::Vector{PauliTerm})
    base = combine_pauli_terms(residual)
    terms = PauliTerm[]
    for s in base, t in base
        phase, word = multiply_pauli_words(s.word, t.word)
        push!(terms, PauliTerm(conj(s.coeff) * t.coeff * phase, word))
    end
    return combine_pauli_terms(terms)
end

"""
    tracial_residual_norm_squared(residual) -> Float64

``tau(R^* R) = sum_s |r_s|^2``, computed exactly from the Pauli coefficients.
"""
tracial_residual_norm_squared(residual::Vector{PauliTerm}) =
    sum(abs2(t.coeff) for t in combine_pauli_terms(residual); init = 0.0)

"""
    residual_square_affine(square_terms, variables) -> JuMP.AffExpr

Affine expression ``omega_y(R^* R)`` in the moment variables. ``R^* R`` is
Hermitian so its expectation is real; the imaginary parts cancel and only the
real coefficient of each canonical moment word contributes.
"""
function residual_square_affine(square_terms::Vector{PauliTerm}, variables)
    expr = JuMP.AffExpr(0.0)
    for term in square_terms
        word = canonical_moment_word(term.word)
        JuMP.add_to_expression!(expr, _scaled_moment_affine(real(term.coeff), word, variables))
    end
    return expr
end

function _residual_moment_words(spec::QubitSDPSpec, square_terms::Vector{PauliTerm})
    words = Set(_collect_moment_words(spec))
    for term in square_terms
        push!(words, canonical_moment_word(term.word))
    end
    return sort!(collect(words); by = word -> (pauli_span(word), word.sites, word.labels))
end

function _build_residual_norm_model(spec::QubitSDPSpec, square_terms::Vector{PauliTerm};
        optimizer, silent::Bool)
    model = optimizer === nothing ? JuMP.Model() : JuMP.Model(optimizer)
    optimizer === nothing || !silent || JuMP.set_silent(model)

    moment_words = _residual_moment_words(spec, square_terms)
    nonidentity = [word for word in moment_words if !isempty(word.sites)]
    # Box bounds |y_s| <= 1 hold for every state because each Pauli word has
    # unit operator norm. They are required here: R*R can span more sites than
    # the PSD window, and without them the objective moments outside the window
    # are unconstrained and the SDP is unbounded below (dual infeasible).
    JuMP.@variable(model, -1.0 <= y[1:length(nonidentity)] <= 1.0)
    variables = Dict(word => y[idx] for (idx, word) in enumerate(nonidentity))

    k = length(spec.psd_words)
    real_part = Matrix{JuMP.AffExpr}(undef, k, k)
    imag_part = Matrix{JuMP.AffExpr}(undef, k, k)
    for i in 1:k, j in 1:k
        phase, word = _moment_product_key(spec.psd_words[i], spec.psd_words[j])
        real_part[i, j] = _scaled_moment_affine(real(phase), word, variables)
        imag_part[i, j] = _scaled_moment_affine(imag(phase), word, variables)
    end
    realified = Matrix{JuMP.AffExpr}(undef, 2k, 2k)
    for i in 1:k, j in 1:k
        realified[i, j] = real_part[i, j]
        realified[i, j + k] = -imag_part[i, j]
        realified[i + k, j] = imag_part[i, j]
        realified[i + k, j + k] = real_part[i, j]
    end
    JuMP.@constraint(model, realified in JuMP.PSDCone())

    relation_count = 0
    for residual in spec.residuals, left in spec.relation_words, right in spec.relation_words
        real_expr, imag_expr, has_real, has_imag =
            _form_affine_parts(expectation_form(left, residual, right), variables)
        has_real && (JuMP.@constraint(model, real_expr == 0); relation_count += 1)
        has_imag && (JuMP.@constraint(model, imag_expr == 0); relation_count += 1)
    end

    JuMP.@objective(model, Min, residual_square_affine(square_terms, variables))
    return QubitSDPModelData(model, spec, moment_words, variables, 2k, relation_count)
end

"""
    solve_qubit_residual_norm_sdp(spec, residual; optimizer, normalize = true,
        method = :fixed) -> QubitResidualNormSDPResult

Solve ``v_N(R) = min_y omega_y(R^* R)`` for the fixed residual ``R`` over the
moment cone of `spec`, returning the objective and (if `normalize`) the
normalized value ``nu_N = v_N / tau(R^* R)``. Only `method = :fixed` is
supported; `:alternating`/`:sos` witness optimization is a hard error until a
convex lift is registered.
"""
function solve_qubit_residual_norm_sdp(spec::QubitSDPSpec, residual::Vector{PauliTerm};
        optimizer = MosekTools.Optimizer, normalize::Bool = true,
        silent::Bool = true, method::Symbol = :fixed)
    method == :fixed ||
        error("solve_qubit_residual_norm_sdp only supports method=:fixed; " *
              "witness optimization ($method) is bilinear, not an SDP — register an SOS lift first")
    square_terms = residual_square_terms(residual)
    data = _build_residual_norm_model(spec, square_terms; optimizer, silent)
    JuMP.optimize!(data.model)
    status = JuMP.termination_status(data.model)
    verdict = status == MOI.OPTIMAL ? :solved :
        status in (MOI.INFEASIBLE, MOI.INFEASIBLE_OR_UNBOUNDED) ? :infeasible : :solver_unknown
    objective = status == MOI.OPTIMAL ? JuMP.objective_value(data.model) : NaN
    denom = tracial_residual_norm_squared(residual)
    normalized = !normalize ? NaN :
        denom > PAULI_COEFFICIENT_ATOL ? objective / denom : 0.0
    return QubitResidualNormSDPResult(verdict, objective, normalized, status, data)
end
