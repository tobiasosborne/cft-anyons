struct PauliWord
    sites::Tuple{Vararg{Int}}
    labels::Tuple{Vararg{Int}}

    function PauliWord(sites::Tuple{Vararg{Int}}, labels::Tuple{Vararg{Int}})
        length(sites) == length(labels) ||
            error("PauliWord sites and labels must have the same length")
        all(label -> 1 <= label <= 3, labels) ||
            error("PauliWord stores only non-identity labels 1,2,3")
        all(i -> sites[i] < sites[i + 1], 1:(length(sites) - 1)) ||
            error("PauliWord sites must be strictly increasing")
        return new(sites, labels)
    end
end

PauliWord() = PauliWord((), ())

struct PauliTerm
    coeff::ComplexF64
    word::PauliWord
end

"""
    pauli_word(labels; start = 0)

Build a positioned Pauli word from dense zero-based labels, dropping identity
labels but preserving the positions of interior identities through site gaps.
"""
function pauli_word(labels; start::Integer = 0)
    sites = Int[]
    nonzero = Int[]
    for (offset, label_raw) in pairs(labels)
        label = Int(label_raw)
        0 <= label <= 3 || error("Pauli labels must be in 0:3, got $label")
        if label != 0
            push!(sites, Int(start) + offset - 1)
            push!(nonzero, label)
        end
    end
    return PauliWord(Tuple(sites), Tuple(nonzero))
end

function translate_pauli_word(word::PauliWord, shift::Integer)
    isempty(word.sites) && return word
    return PauliWord(Tuple(site + Int(shift) for site in word.sites), word.labels)
end

function canonical_moment_word(word::PauliWord)
    isempty(word.sites) && return word
    return translate_pauli_word(word, -first(word.sites))
end

pauli_weight(word::PauliWord) = length(word.labels)
pauli_span(word::PauliWord) = isempty(word.sites) ? 0 : last(word.sites) - first(word.sites) + 1

function _pauli_label_product(a::Integer, b::Integer)
    a == 0 && return 1.0 + 0.0im, Int(b)
    b == 0 && return 1.0 + 0.0im, Int(a)
    a == b && return 1.0 + 0.0im, 0
    (a, b) == (1, 2) && return 0.0 + 1.0im, 3
    (a, b) == (2, 3) && return 0.0 + 1.0im, 1
    (a, b) == (3, 1) && return 0.0 + 1.0im, 2
    (a, b) == (2, 1) && return 0.0 - 1.0im, 3
    (a, b) == (3, 2) && return 0.0 - 1.0im, 1
    (a, b) == (1, 3) && return 0.0 - 1.0im, 2
    error("Pauli labels must be in 0:3, got ($a, $b)")
end

"""
    multiply_pauli_words(left, right)

Return `(phase, word)` for the product of two positioned Pauli words.
"""
function multiply_pauli_words(left::PauliWord, right::PauliWord)
    out_sites = Int[]
    out_labels = Int[]
    phase = 1.0 + 0.0im
    i = 1
    j = 1
    while i <= length(left.sites) || j <= length(right.sites)
        if j > length(right.sites) || (i <= length(left.sites) && left.sites[i] < right.sites[j])
            push!(out_sites, left.sites[i])
            push!(out_labels, left.labels[i])
            i += 1
        elseif i > length(left.sites) || right.sites[j] < left.sites[i]
            push!(out_sites, right.sites[j])
            push!(out_labels, right.labels[j])
            j += 1
        else
            local_phase, label = _pauli_label_product(left.labels[i], right.labels[j])
            phase *= local_phase
            if label != 0
                push!(out_sites, left.sites[i])
                push!(out_labels, label)
            end
            i += 1
            j += 1
        end
    end
    return phase, PauliWord(Tuple(out_sites), Tuple(out_labels))
end

function window_pauli_words(start::Integer, len::Integer; max_weight = nothing, include_identity::Bool = true)
    len >= 0 || error("window length must be nonnegative, got $len")
    max_count = 4^len
    words = PauliWord[]
    for raw in 0:(max_count - 1)
        labels = digits(raw; base = 4, pad = len)
        weight = count(!=(0), labels)
        (weight == 0 && !include_identity) && continue
        (max_weight !== nothing && weight > max_weight) && continue
        push!(words, pauli_word(labels; start))
    end
    return words
end

function pauli_coefficient_terms(coefficients; start::Integer = 0, atol::Real = PAULI_COEFFICIENT_ATOL)
    ndims(coefficients) >= 1 || error("Pauli coefficient array must have at least one axis")
    all(size(coefficients) .== 4) ||
        error("every Pauli coefficient axis must have length 4, got size $(size(coefficients))")
    terms = PauliTerm[]
    for index in CartesianIndices(coefficients)
        coeff = coefficients[index]
        abs(coeff) <= atol && continue
        labels = Tuple(i - 1 for i in Tuple(index))
        push!(terms, PauliTerm(ComplexF64(coeff), pauli_word(labels; start)))
    end
    return terms
end

function combine_pauli_terms(terms; atol::Real = PAULI_COEFFICIENT_ATOL)
    combined = Dict{PauliWord, ComplexF64}()
    for term in terms
        combined[term.word] = get(combined, term.word, 0.0 + 0.0im) + term.coeff
    end
    return [PauliTerm(coeff, word) for (word, coeff) in combined if abs(coeff) > atol]
end
