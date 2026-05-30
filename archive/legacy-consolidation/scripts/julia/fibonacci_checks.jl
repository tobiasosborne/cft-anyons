# Independent numerical/high-precision checks for the first Fibonacci block.
#
# Provenance:
# - handoff.md sections 9.1, 9.3, 9.5, 9.6, 9.7
# - references/text/FibonacciAnyonModels.txt lines 216-218, 272, 297, 301, 304
# - references/text/GoldenChainFeiguinEtAl.txt line 109

setprecision(BigFloat, 256)

using LinearAlgebra

const tol = BigFloat("1e-70")

function assert_close(name, value; target=zero(value), tolerance=tol)
    err = abs(value - target)
    ok = err <= tolerance
    println(rpad(name, 44), ok ? "PASS" : "FAIL", "  error=", err)
    ok || error("check failed: $name")
end

phi = (BigFloat(1) + sqrt(BigFloat(5))) / 2
D2 = BigFloat(1) + phi^2

println("Fibonacci high-precision checks")
println("precision_bits=", precision(BigFloat))
println("phi=", phi)
println("D2=", D2)

assert_close("phi^2 = phi + 1", phi^2 - phi - 1)
assert_close("phi^-1 = phi - 1", inv(phi) - (phi - 1))
assert_close("phi^-2 + phi^-1 = 1", inv(phi)^2 + inv(phi) - 1)
assert_close("D^2 = 2 + phi", D2 - (2 + phi))

a = inv(phi)
b = sqrt(inv(phi))
F = BigFloat[a b; b -a]
I2 = Matrix{BigFloat}(I, 2, 2)

assert_close("F'F = I Frobenius", norm(transpose(F) * F - I2))
assert_close("F^2 = I Frobenius", norm(F * F - I2))

assert_close("PF vacuum normalisation", inv(D2) + phi^2 / D2 - 1)
assert_close("PF tau normalisation", inv(D2) + inv(D2) + phi / D2 - 1)

dim(label) = label == :one ? BigFloat(1) : phi
pf_amplitude(a, b, c) = sqrt(dim(b) * dim(c) / (dim(a) * D2))
assert_close("PF amp 1->11 formula", pf_amplitude(:one, :one, :one) - 1 / sqrt(D2))
assert_close("PF amp 1->tt formula", pf_amplitude(:one, :tau, :tau) - phi / sqrt(D2))
assert_close("PF amp t->t1 formula", pf_amplitude(:tau, :tau, :one) - 1 / sqrt(D2))
assert_close("PF amp t->1t formula", pf_amplitude(:tau, :one, :tau) - 1 / sqrt(D2))
assert_close("PF amp t->tt formula", pf_amplitude(:tau, :tau, :tau) - sqrt(phi) / sqrt(D2))

x = inv(phi)
y = inv(sqrt(phi))
r = inv(phi^(BigFloat(3) / 2))
assert_close("coassoc x^2 + y^2 = 1", x^2 + y^2 - 1)
assert_close("coassoc 2x^2 + r^2 = 1", 2x^2 + r^2 - 1)
assert_close("coassoc F-eigen equation", r^2 - inv(phi^(BigFloat(3) / 2)) * x * y)

function rg_norms(u0, uI, jL, jR, uTau, rho)
    vac_den = abs2(u0) + abs2(uI) * rho^(-BigFloat(8) / 5)
    tau_den = abs2(jL) + abs2(jR) + abs2(uTau) * rho^(-BigFloat(4) / 5)
    vac_norm = (abs2(conj(u0)) + abs2(conj(uI) * rho^(-BigFloat(4) / 5))) / vac_den
    tau_norm =
        (abs2(conj(jL)) + abs2(conj(jR)) + abs2(conj(uTau) * rho^(-BigFloat(2) / 5))) /
        tau_den
    tau_tautau_probability =
        abs2(conj(uTau) * rho^(-BigFloat(2) / 5)) / tau_den
    tau_tautau_formula = abs2(uTau) * rho^(-BigFloat(4) / 5) / tau_den
    return vac_norm, tau_norm, tau_tautau_probability, tau_tautau_formula
end

u0 = Complex{BigFloat}(1.25, -0.5)
uI = Complex{BigFloat}(-0.75, 0.125)
jL = Complex{BigFloat}(0.8, 0.3)
jR = Complex{BigFloat}(-0.4, 1.1)
uTau = Complex{BigFloat}(1.5, -0.2)

for rho in BigFloat[0.25, 0.5, 0.9]
    vac_norm, tau_norm, tau_prob, tau_prob_formula = rg_norms(u0, uI, jL, jR, uTau, rho)
    assert_close("RG vacuum norm rho=$rho", vac_norm - 1)
    assert_close("RG tau norm rho=$rho", tau_norm - 1)
    assert_close("RG tau->tautau probability rho=$rho", tau_prob - tau_prob_formula)
    (0 <= tau_prob <= 1) || error("probability out of range for rho=$rho")
end

beta_row = Complex{BigFloat}[
    Complex{BigFloat}(0.5, -1.2),
    Complex{BigFloat}(-0.75, 0.4),
    Complex{BigFloat}(1.1, 0.25),
]
Srow = sum(abs2, beta_row)
Brow = reshape(beta_row, 1, :)
Rrow = Complex{BigFloat}[1 / sqrt(Srow);;]
Erow = Brow' * Rrow
Arow = conj.(beta_row) ./ sqrt(Srow)
assert_close("no-mixing polar entry formula", norm(vec(Erow) - Arow))
assert_close("no-mixing polar section isometry", norm(Erow' * Erow - Complex{BigFloat}[1;;]))

function binary_eta(x, y, p, q, r)
    z = zero(Complex{BigFloat})
    return Complex{BigFloat}[x z; y z; z p; z q; z r]
end

raw_one = Complex{BigFloat}[Complex{BigFloat}(1.2, -0.3), Complex{BigFloat}(-0.5, 0.7)]
raw_tau = Complex{BigFloat}[
    Complex{BigFloat}(0.25, 0.8),
    Complex{BigFloat}(-1.1, 0.4),
    Complex{BigFloat}(0.6, -0.2),
]
one_vec = raw_one / norm(raw_one)
tau_vec = raw_tau / norm(raw_tau)
Ebin = binary_eta(one_vec[1], one_vec[2], tau_vec[1], tau_vec[2], tau_vec[3])
Ibin = Matrix{Complex{BigFloat}}(I, 2, 2)
assert_close("binary eta E'E = I", norm(Ebin' * Ebin - Ibin))

Epf = binary_eta(
    Complex{BigFloat}(1 / sqrt(D2), 0),
    Complex{BigFloat}(phi / sqrt(D2), 0),
    Complex{BigFloat}(1 / sqrt(D2), 0),
    Complex{BigFloat}(1 / sqrt(D2), 0),
    Complex{BigFloat}(sqrt(phi) / sqrt(D2), 0),
)
assert_close("PF binary eta E'E = I", norm(Epf' * Epf - Ibin))
Epf_from_dims = binary_eta(
    Complex{BigFloat}(pf_amplitude(:one, :one, :one), 0),
    Complex{BigFloat}(pf_amplitude(:one, :tau, :tau), 0),
    Complex{BigFloat}(pf_amplitude(:tau, :tau, :one), 0),
    Complex{BigFloat}(pf_amplitude(:tau, :one, :tau), 0),
    Complex{BigFloat}(pf_amplitude(:tau, :tau, :tau), 0),
)
assert_close("PF dimension-formula eta equality", norm(Epf_from_dims - Epf))
assert_close("PF dimension-formula eta E'E", norm(Epf_from_dims' * Epf_from_dims - Ibin))

println("all Julia Fibonacci checks passed")
