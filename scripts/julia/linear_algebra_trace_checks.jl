# Independent finite-matrix trace and square-form checks for ascending channels.

using LinearAlgebra

tol = 1e-12

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = norm(value - target)
    ok = err <= tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

function assert_psd(name, value; tolerance=tol)
    hermitian_error = norm(value - value')
    min_eval = minimum(eigvals(Hermitian((value + value') / 2)))
    ok = hermitian_error <= tolerance && min_eval >= -tolerance
    println(rpad(name, 56), ok ? "PASS" : "FAIL",
        "  hermitian_error=", hermitian_error, "  min_eval=", min_eval)
    ok || error("PSD check failed: $name")
end

E = ComplexF64[
    1 0
    0 1
    0 0
]

rho = ComplexF64[
    0.7+0im 0.2-0.1im
    0.2+0.1im 0.3+0im
]

O = ComplexF64[
    1+0im 2-im 0.25+0.5im
    -1+3im 0.75+0im 2+0im
    0.5-im 1+0.25im -2+0im
]

X = ComplexF64[
    1+im 2 0
    -im 3-im 1+2im
    2-im 0.5 4
]

assert_close("state embedding trace preserving", tr((E * rho) * E'), target=tr(rho))
assert_close(
    "expectation against embedded state",
    tr((((E * rho) * E') * O)),
    target=tr(rho * (E' * (O * E))),
)
assert_close(
    "Kraus square form",
    E' * ((X' * X) * E),
    target=(X * E)' * (X * E),
)

K = kron(Matrix{ComplexF64}(I, 2, 2), E)
Xbig = ComplexF64[
    1 2-im 0 1+im 0.5 -2
    -1+im 3 2 0 1-im 0
    0.25 1+2im -1 2 0 1
    2 0 -im 1 3+im 0.75
    0 1 2-im -1 0.5+im 2
    1-im -0.5 0 2+im -1 3
]

assert_close(
    "amplified Kraus square form",
    K' * ((Xbig' * Xbig) * K),
    target=(Xbig * K)' * (Xbig * K),
)

Oamp = Xbig' * Xbig
AscAmp = K' * (Oamp * K)
assert_psd("amplified input positive semidefinite", Oamp)
assert_psd("amplified ascending preserves PSD", AscAmp)
assert_close(
    "amplified PSD congruence identity",
    AscAmp,
    target=(Xbig * K)' * (Xbig * K),
)

Kalt = ComplexF64[
    0.5 1-im
    -1+0.25im 0.75
    2 0.5im
]
Klist = [E, Kalt]
OtracePos = X' * X
KrausSum = sum(Ki' * (OtracePos * Ki) for Ki in Klist)
KrausSumTarget = sum((X * Ki)' * (X * Ki) for Ki in Klist)
AmpKrausSum = sum(kron(Matrix{ComplexF64}(I, 2, 2), Ki)' *
    (Oamp * kron(Matrix{ComplexF64}(I, 2, 2), Ki)) for Ki in Klist)
AmpKrausSumTarget = sum((Xbig * kron(Matrix{ComplexF64}(I, 2, 2), Ki))' *
    (Xbig * kron(Matrix{ComplexF64}(I, 2, 2), Ki)) for Ki in Klist)

assert_psd("finite Kraus sum preserves PSD", KrausSum)
assert_close("finite Kraus sum Gram identity", KrausSum, target=KrausSumTarget)
assert_psd("amplified finite Kraus sum preserves PSD", AmpKrausSum)
assert_close("amplified finite Kraus sum Gram identity",
    AmpKrausSum, target=AmpKrausSumTarget)

Knormalized = [ComplexF64(3 / 5) * E, ComplexF64(0, 4 / 5) * E]
Knormalization = sum(Ki' * Ki for Ki in Knormalized)
KAscending = sum(Ki' * (O * Ki) for Ki in Knormalized)
KState = sum((Ki * rho) * Ki' for Ki in Knormalized)
assert_close("finite Kraus normalization", Knormalization, target=Matrix{ComplexF64}(I, 2, 2))
assert_close("finite Kraus sum unital",
    sum(Ki' * (Matrix{ComplexF64}(I, 3, 3) * Ki) for Ki in Knormalized),
    target=Matrix{ComplexF64}(I, 2, 2))
assert_close("finite Kraus sum star preserving",
    sum(Ki' * (O' * Ki) for Ki in Knormalized), target=KAscending')
assert_close("finite Kraus state trace preserving", tr(KState), target=tr(rho))
assert_close("finite Kraus expectation preserving",
    tr(KState * O), target=tr(rho * KAscending))

Erect = ComplexF64[
    1+im 2-im
    0.5  -im
    -1   3+2im
]
Ypos = ComplexF64[
    1-im 2 0.5+im
    -2   im 1
    0.25 1-im 3
    2+im -0.5 1-2im
]
Opos = Ypos' * Ypos
AscPos = Erect' * (Opos * Erect)

assert_psd("input positive semidefinite observable", Opos)
assert_psd("ascending preserves positive semidefinite", AscPos)
assert_close(
    "PSD congruence quadratic form identity",
    AscPos,
    target=(Ypos * Erect)' * (Ypos * Erect),
)

println("all finite-matrix trace checks passed")
