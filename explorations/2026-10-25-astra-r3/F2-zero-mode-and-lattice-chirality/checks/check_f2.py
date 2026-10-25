#!/usr/bin/env python3
"""Exact finite and polynomial checks; no claim of a lattice continuum limit.

Sources: CA-79:73-77; NOTE.md F2-B/F2-Aalg/F2-N; CONVENTIONS (m),(ap),(at).
Run from repo root: python3 explorations/2026-10-25-astra-r3/
F2-zero-mode-and-lattice-chirality/checks/check_f2.py [--mutate central|shift]
"""
import argparse
import sympy as sp

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=("central", "shift", "cubic"))
args = parser.parse_args()
t, p, q, n, m = sp.symbols("t p q n m", real=True)


def zero(expr, label):
    assert sp.expand(expr) == 0, (label, sp.expand(expr))


# Polynomial module: f(t)X_q. Test symbolic indices, not just a finite grid.
f = 2*t**3 - 3*t + 5


def ell(j, poly):
    return (t+j)*(poly if args.mutate == "shift" else poly.subs(t, t+j))


def ess(j, weight, poly):
    return (t+weight)*poly


def star(poly):
    return -sp.conjugate(poly.subs(t, -t))


def parity(weight, poly):
    return -poly.subs(t, t-weight)


zero(ell(p, ell(n, f))-ell(n, ell(p, f))-(p-n)*ell(p+n, f), "LL module")
zero(ess(p, q+n, ess(n, q, f))-ess(n, q+p, ess(p, q, f))
     +(p-n)*ess(p+n, q, f), "SS module")
zero(ell(p, ess(n, q, f))-ess(n, q+p, ell(p, f)), "LS module")
zero(ell(m, sp.Integer(1))-ell(n, sp.Integer(1))-(m-n), "LLS cocycle")
zero(ess(m, n+p, sp.Integer(1))-ess(n, m+p, sp.Integer(1))+(m-n),
     "SSL cocycle")
zero(star(ell(p, f))+ell(-p, star(f)), "L star")
zero(star(ess(p, q, f))+ess(-p, -q, star(f)), "S star")
zero(parity(q+p, ell(p, f))-ess(-p, -q, parity(q, f)), "L parity")
zero(parity(q+p, ess(p, q, f))-ell(-p, parity(q, f)), "S parity")
zero(parity(-q, parity(q, f))-f, "parity involution")
zero(star(star(f))-f, "star involution")
zero(star(parity(q, f))-parity(-q, star(f)), "star parity commute")
print("PASS: exact polynomial module, cocycle Jacobi, star and parity identities")

# B4/B5 imply ad([L_1,S_-1])X_q=2qX_q, including q=+-1.
dc, dcstar = sp.symbols("dc dcstar", real=True)


def gamma(j):
    return (j**3*dcstar-j*dc)/12


def action(j, expr, chirality):
    out = {}
    for key, val in expr.items():
        if key == "I":
            continue
        dest = j+key
        if dest != 0:  # X_0=0 is an EXPLICIT hypothesis here.
            out[dest] = out.get(dest, 0)+(1 if chirality == "S" else -1)*key*val
        if dest == 0:
            out["I"] = out.get("I", 0)+sp.Rational(j, 2)*gamma(j)*val
    return out


for index in range(-6, 7):
    if index == 0:
        continue
    ls = action(1, action(-1, {index: 1}, "S"), "L")
    sl = action(-1, action(1, {index: 1}, "L"), "S")
    for key in set(ls) | set(sl) | {index}:
        zero(ls.get(key, 0)-sl.get(key, 0)-(2*index if key == index else 0),
             "B4/B5 double Jacobi")
assert sp.solve([gamma(1), gamma(2)], [dc, dcstar]) == {dc: 0, dcstar: 0}
print("PASS: central-term bookkeeping in parity-free proof and both ledger equations")

# Independent integer paths in C3: cubic balance does NOT set X_0=0.
f1 = sp.Symbol("F1")
f2 = 2*f1-gamma(1)
f3 = f1+f2-gamma(1)-gamma(2)
f4_22 = 2*f2-(3 if args.mutate == "cubic" else 4)*gamma(2)
f4_13 = f1+f3-sp.Rational(3, 2)*(gamma(1)+gamma(3))
zero(f4_22-f4_13-sp.Rational(3, 2)*dcstar, "C3 two F4 paths")
assert sp.diff(f4_22-f4_13, dc) == 0
print("PASS: double-Jacobi consistency detects cubic difference, cancels linear difference")

# Small Vec/unit-multiplicity instance tests the GENERAL exact KS identity.
# An asymmetric density is intentional: no parity hypothesis is used.
X = sp.Matrix([[0, 1], [1, 0]])
Z = sp.diag(1, -1)
I2 = sp.eye(2)
sites = 4
ident = sp.eye(2**sites)


def local(op, j):
    factors = [op if k == j % sites else I2 for k in range(sites)]
    return sp.kronecker_product(*factors)


def comm(a, b):
    return a*b-b*a


dens = [local(X, j)*local(X, j+1) + sp.Rational(1, 3)*local(Z, j)
        + sp.Rational(1, 5)*local(X, j)*local(Z, j+1) for j in range(sites)]
current = [sp.I*comm(dens[j], dens[(j+1) % sites]) for j in range(sites)]
a, root = 1/sp.pi, sp.I


def fourier(terms, index):
    return a*sum((root**(index*j)*terms[j] for j in range(sites)), sp.zeros(16))


def energy(index):
    return fourier(dens, index)


def flux(index):
    return fourier(current, index)


def left(index):
    return energy(index)-flux(index)


def right_reversed(index):
    return energy(index)+flux(index)


def ledger(index, other, cubic, linear):
    return sp.Rational(1, 12)*(index**3*cubic-index*linear) if index+other == 0 else 0


for im, jn in [(0, 1), (1, -1), (1, 2), (-1, -2)]:
    zleft, zright = ledger(im, jn, 3, 2), ledger(im, jn, 7, 5)
    fl = comm(left(im), left(jn))-(im-jn)*left(im+jn)-zleft*ident
    fs = (comm(right_reversed(im), right_reversed(jn))
          +(im-jn)*right_reversed(im+jn)+zright*ident)
    cmn = comm(left(im), right_reversed(jn))
    cnm = comm(left(jn), right_reversed(im))
    kappa = -sp.I*a*(root**jn-root**im)
    sign = -1 if args.mutate == "central" else 1
    rhs = (4*kappa-2*(jn-im))*flux(im+jn)-fl-fs+sign*(zright-zleft)*ident
    assert all(sp.expand(entry) == 0 for entry in cmn-cnm-rhs), "finite B1 identity"
print("PASS: exact N=4 nearest-neighbour Fourier/unequal-ledger identity")

for size in (4, 6, 8):
    shift = sp.zeros(size)
    vec = sp.Matrix([(-1)**j for j in range(size)])
    for j in range(size):
        shift[(j+1) % size, j] = 1
    assert shift*vec == -vec and shift**size == sp.eye(size)
print("PASS: genuine cyclic site translation has phase -1 (all-branch obstruction)")
print("All checks passed. No VR-1 certificate or physical counterexample inferred from finite data.")
