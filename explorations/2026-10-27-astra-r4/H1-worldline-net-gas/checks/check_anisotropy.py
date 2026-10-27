"""P2 calibration only: sourced dilute weights, no general-C integrability.

Source: references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:120-145.
Dictionary: report/sections/86_spacetime_trotter_dictionary.tex:154-217.
The commutativity qualification at CA-86:273-279 is retained. These are
spectral face weights, not claimed equal to exp(t h) at finite u.
Run from repository root with python3 <this path>.
"""
import sys
import sympy as s

u, lam = s.symbols("u lam", real=True)
den = s.sin(2*lam)*s.sin(3*lam)
rho = [
    1+s.sin(u)*s.sin(3*lam-u)/den,
    s.sin(3*lam-u)/s.sin(3*lam),
    s.sin(3*lam-u)/s.sin(3*lam),
    s.sin(u)/s.sin(3*lam),
    s.sin(u)/s.sin(3*lam),
    s.sin(u)*s.sin(3*lam-u)/den,
    s.sin(u)*s.sin(3*lam-u)/den,
    s.sin(2*lam-u)*s.sin(3*lam-u)/den,
    -s.sin(u)*s.sin(lam-u)/den,
]


def zero(expr):
    return s.trigsimp(s.expand_trig(expr)) == 0


print("Python", sys.version.split()[0], "SymPy", s.__version__)
print("Source convention: n=-2*cos(4*lambda); denominators assumed nonzero.")
assert [s.simplify(x.subs(u, 0)) for x in rho] == [1,1,1,0,0,0,0,1,0]
print("PASS: regular face is the four-projector identity at u=0")
at = [x.subs(u, lam) for x in rho]
x = 1/(2*s.cos(lam))
assert zero(at[1]-at[0]*x)
for k in (3,4,5,6,7):
    assert zero(at[k]-at[0]*x*x)
assert at[8] == 0
print("PASS: u=lambda has normalized arc weight x and paired weight x^2, rho9=0")
n = -2*s.cos(4*lam)
assert zero((2*s.cos(2*lam))**2-(2-n))
assert zero(x**-2-(2+2*s.cos(2*lam)))
print("PASS: branch arithmetic uses sqrt(2-n)=2*abs(cos(2*lambda))")
# Deliberate wrong rho9 sign does not affect u=lambda, so test a derivative
# which does distinguish it. This prevents a fake mutation proof.
right = s.sin(lam)/den
assert zero(s.diff(rho[8], u).subs(u, 0)+right)
mutated = -rho[8]
assert not zero(s.diff(mutated, u).subs(u, 0)+right)
print("MUTATION REJECTED: reversing rho9 sign fails the Hamiltonian tangent")
print("No critical-limit or conformal-invariance assertion was tested.")
