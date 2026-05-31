import JuMP
import MathOptInterface
import MosekTools

const MOI = MathOptInterface

struct QubitSDPSpec
    psd_words::Vector{PauliWord}
    relation_words::Vector{PauliWord}
    residuals::Vector{Vector{PauliTerm}}
end

struct QubitSDPModelData
    model::JuMP.Model
    spec::QubitSDPSpec
    moment_words::Vector{PauliWord}
    moment_variables::Dict{PauliWord, JuMP.VariableRef}
    psd_dimension::Int
    relation_constraint_count::Int
end

struct QubitSDPResult
    status::Symbol
    termination_status::MOI.TerminationStatusCode
    model_data::QubitSDPModelData
end

function QubitSDPSpec(; psd_window_start::Integer = 0, psd_window_length::Integer = 1,
        relation_window_start::Integer = 0, relation_window_length::Integer = 0,
        residuals = Vector{PauliTerm}[], max_weight = nothing)
    psd_words = window_pauli_words(psd_window_start, psd_window_length; max_weight)
    relation_words = window_pauli_words(relation_window_start, relation_window_length; max_weight)
    return QubitSDPSpec(psd_words, relation_words, [collect(r) for r in residuals])
end

function identity_residual_terms()
    return [PauliTerm(1.0 + 0.0im, PauliWord())]
end

function coefficient_residual_terms(coefficients; start::Integer = 0)
    return pauli_coefficient_terms(coefficients; start)
end

function conservation_residual_terms(coefficients; u = zeros(4, 4))
    h = pauli_two_site_operator(coefficients)
    residual = pauli_n_site_coefficients(adjacent_bond_conservation_residual(h), 3)
    residual .-= one_dimensional_coboundary_coefficients(u)
    return coefficient_residual_terms(residual)
end

function boost_residual_terms(coefficients; u = zeros(4, 4), w = zeros(4, 4, 4),
        speed2::Real = 1.0, scalar_shift::Real = 0.0)
    h = pauli_two_site_operator(coefficients)
    residual = pauli_n_site_coefficients(boost_relation_local_density(h), 4)
    for r in 1:4, s in 1:4
        residual[r, s, 1, 1] -= u[r, s]
    end
    hbar = copy(coefficients)
    hbar[1, 1] -= scalar_shift
    for r in 1:4, s in 1:4
        residual[r, s, 1, 1] -= speed2 * hbar[r, s]
    end
    residual .-= one_dimensional_coboundary_coefficients(w)
    return coefficient_residual_terms(residual)
end

function expectation_form(left::PauliWord, residual::Vector{PauliTerm}, right::PauliWord)
    form = Dict{PauliWord, ComplexF64}()
    for term in residual
        phase_left, word_left = multiply_pauli_words(left, term.word)
        phase_right, word = multiply_pauli_words(word_left, right)
        key = canonical_moment_word(word)
        form[key] = get(form, key, 0.0 + 0.0im) + term.coeff * phase_left * phase_right
    end
    return Dict(word => coeff for (word, coeff) in form if abs(coeff) > PAULI_COEFFICIENT_ATOL)
end

function _moment_product_key(left::PauliWord, right::PauliWord)
    phase, word = multiply_pauli_words(left, right)
    return phase, canonical_moment_word(word)
end

function _collect_moment_words(spec::QubitSDPSpec)
    words = Set{PauliWord}()
    push!(words, PauliWord())
    for left in spec.psd_words, right in spec.psd_words
        _, word = _moment_product_key(left, right)
        push!(words, word)
    end
    for residual in spec.residuals, left in spec.relation_words, right in spec.relation_words
        for word in keys(expectation_form(left, residual, right))
            push!(words, word)
        end
    end
    ordered = sort!(collect(words); by = word -> (pauli_span(word), word.sites, word.labels))
    return ordered
end

function _moment_affine(word::PauliWord, variables::Dict{PauliWord, JuMP.VariableRef})
    isempty(word.sites) && return JuMP.AffExpr(1.0)
    return JuMP.AffExpr(variables[word])
end

function _scaled_moment_affine(coeff::Real, word::PauliWord, variables)
    expr = JuMP.AffExpr(0.0)
    if isempty(word.sites)
        JuMP.add_to_expression!(expr, coeff)
    else
        JuMP.add_to_expression!(expr, coeff, variables[word])
    end
    return expr
end

function _form_affine_parts(form::Dict{PauliWord, ComplexF64}, variables)
    real_expr = JuMP.AffExpr(0.0)
    imag_expr = JuMP.AffExpr(0.0)
    has_real = false
    has_imag = false
    for (word, coeff) in form
        if abs(real(coeff)) > PAULI_COEFFICIENT_ATOL
            JuMP.add_to_expression!(real_expr, _scaled_moment_affine(real(coeff), word, variables))
            has_real = true
        end
        if abs(imag(coeff)) > PAULI_COEFFICIENT_ATOL
            JuMP.add_to_expression!(imag_expr, _scaled_moment_affine(imag(coeff), word, variables))
            has_imag = true
        end
    end
    return real_expr, imag_expr, has_real, has_imag
end

function build_qubit_sdp_model(spec::QubitSDPSpec; optimizer = nothing, silent::Bool = true)
    model = optimizer === nothing ? JuMP.Model() : JuMP.Model(optimizer)
    optimizer === nothing || !silent || JuMP.set_silent(model)

    moment_words = _collect_moment_words(spec)
    nonidentity = [word for word in moment_words if !isempty(word.sites)]
    JuMP.@variable(model, y[1:length(nonidentity)])
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
        if has_real
            JuMP.@constraint(model, real_expr == 0)
            relation_count += 1
        end
        if has_imag
            JuMP.@constraint(model, imag_expr == 0)
            relation_count += 1
        end
    end

    return QubitSDPModelData(model, spec, moment_words, variables, 2k, relation_count)
end

function solve_qubit_sdp(spec::QubitSDPSpec; optimizer = MosekTools.Optimizer, silent::Bool = true)
    data = build_qubit_sdp_model(spec; optimizer, silent)
    JuMP.optimize!(data.model)
    status = JuMP.termination_status(data.model)
    verdict =
        status == MOI.OPTIMAL ? :not_excluded_at_level :
        status in (MOI.INFEASIBLE, MOI.INFEASIBLE_OR_UNBOUNDED) ? :excluded :
        :solver_unknown
    return QubitSDPResult(verdict, status, data)
end
