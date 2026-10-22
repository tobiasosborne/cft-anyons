#!/usr/bin/env python3
"""Exact finite shadows of NOTE.md; no continuum convergence claim.

Command: python3 explorations/2026-10-22-astra/D1-carrier-theory/checks/carrier_checks.py
Sources: NOTE.md D1-T1,T5b,T6,T7 and its proposed conventions.
All scalar-particle matrices below are the small Hilb_fd calibration only.
"""
import hashlib
import itertools
import platform
from pathlib import Path
import sympy as s


def zero(expr, label):
    if isinstance(expr, s.MatrixBase):
        assert all(s.simplify(x) == 0 for x in expr), label
    else:
        assert s.simplify(expr) == 0, label


def refinement(t, mutant=False):
    # Output order 00, 0X, X0, XX; input order 0, X.
    R = s.zeros(4, 2)
    R[0, 0] = 1
    R[1, 1] = s.sqrt(1-t)
    R[2, 1] = s.sqrt(t) if not mutant else t
    return R


def check_refinement(mutant=False):
    t = s.Rational(2, 5)
    R = refinement(t, mutant)
    zero(R.T*R-s.eye(2), "R must be isometric")
    V = s.zeros(4, 2)
    V[0, 0] = V[2, 1] = 1
    U = s.eye(4)
    U[1, 1] = U[2, 2] = s.sqrt(t)
    U[1, 2], U[2, 1] = s.sqrt(1-t), -s.sqrt(1-t)
    zero(U.T*U-s.eye(4), "local rotation unitarity")
    zero(U*V-R, "R=UV")
    a, b, c = map(s.Integer, (2, 3, 7))
    left = s.kronecker_product(refinement(a/(a+b)), s.eye(2))*refinement((a+b)/(a+b+c))
    right = s.kronecker_product(s.eye(2), refinement(b/(b+c)))*refinement(a/(a+b+c))
    zero(left-right, "unequal-length subdivision coherence")


def check_grid(mutant=False):
    # Two coarse cells -> four fine cells, one and two occupied particles.
    for N in (1, 2):
        coarse = list(itertools.combinations(range(2), N))
        fine = list(itertools.combinations(range(4), N))
        J = s.zeros(len(fine), len(coarse))
        for col, S in enumerate(coarse):
            for children in itertools.product((0, 1), repeat=N):
                T = tuple(2*j+child for j, child in zip(S, children))
                J[fine.index(T), col] = s.sqrt(s.Rational(1, 2))**N
        zero(J.T*J-s.eye(len(coarse)), "configuration refinement isometry")
        factor = s.Integer(4)**s.Rational(N, 2)
        if mutant:
            factor = s.Integer(4)**N
        for row, T in enumerate(fine):
            for col, S in enumerate(coarse):
                expected = s.Integer(2)**s.Rational(N, 2) if tuple(j//2 for j in T) == S else 0
                zero(factor*J[row, col]-expected, "Kfine J=Kcoarse on every fine box")
    L = s.symbols("L", integer=True, positive=True)
    zero(s.binomial(L, 2)/L**2-(L-1)/(2*L), "distinct-cell two-particle volume")


def check_corner(mutant=False):
    V = s.Matrix([[1, 0], [0, 1], [0, 0]])
    P = V*V.T
    A = s.Matrix([[1, 2], [3, 4]])
    B = s.Matrix([[2, -1], [0, 3]])
    theta = lambda T: V*T*V.T
    zero(theta(A)*theta(B)-theta(A*B), "corner multiplication")
    zero(V.T*(s.eye(3)-P)*V, "compression nonfaithfulness")
    rho = s.diag(s.Rational(1, 4), s.Rational(1, 4), s.Rational(1, 2))
    p = s.trace(rho*P)
    D = P/s.sqrt(p)-s.eye(3)
    zero(s.trace(rho*D.T*D)-2*(1-s.sqrt(p)), "exact GNS vacuum defect")
    complement = P if mutant else s.eye(3)-P
    chi = lambda T: s.trace(T)/2
    Phi = lambda T: theta(T)+chi(T)*complement
    zero(Phi(s.eye(2))-s.eye(3), "CP completion is unital")
    zero(Phi(A*B)-Phi(A)*Phi(B)-(chi(A*B)-chi(A)*chi(B))*(s.eye(3)-P), "CP defect")


def finite_energy(L, b, v, mu):
    # Independent direct enumeration: ψ0=2, ψ1=3, ψ2=5, all higher ψN=0.
    eps = s.Rational(1, L)
    value = {0: s.Integer(2), 1: s.Integer(3), 2: s.Integer(5)}
    def amp(S):
        return eps**s.Rational(len(S), 2)*value.get(len(S), 0)
    total = 0
    for j in range(L-1):
        outside = [k for k in range(L) if k not in (j, j+1)]
        for flags in itertools.product((False, True), repeat=len(outside)):
            S = {k for k, occupied in zip(outside, flags) if occupied}
            a00, a10, a01, a11 = amp(S), amp(S | {j}), amp(S | {j+1}), amp(S | {j, j+1})
            total += (a10-a01)**2/eps**2
            total += (a11-s.sqrt(eps)*b*a10)**2/eps
            total += (a11-eps*v*a00)**2/eps
    for N in range(3):
        total += mu*N*s.binomial(L, N)*eps**N*value[N]**2
    return s.simplify(total)


def check_reactions(mutant=False):
    eps = s.symbols("eps", positive=True)
    # One spectator count suffices to pin distinct sqrtε and ε powers.
    a, b, v, upper, lower = s.symbols("a b v upper lower", real=True)
    fusion = (eps**s.Rational(3, 2)*upper-s.sqrt(eps)*b*eps*lower)**2/eps
    zero(fusion-eps**2*(upper-b*lower)**2, "fusion face scaling")
    coefficient = s.sqrt(eps) if mutant else eps
    pair = (eps**s.Rational(3, 2)*upper-coefficient*v*s.sqrt(eps)*lower)**2/eps
    zero(pair-eps**2*(upper-v*lower)**2, "pair face scaling")
    L = s.symbols("L", positive=True, integer=True)
    b, v, mu = s.Rational(2, 3), s.Rational(3, 5), s.Rational(7, 11)
    A, B, C = map(s.Integer, (2, 3, 5))
    formula = ((L-1)/L*((C-b*B)**2+(C-v*A)**2)
               +(L-1)*(L-2)/L**2*(b*b*C*C+v*v*B*B)
               +(L-1)*(L-2)*(L-3)/(2*L**3)*v*v*C*C
               +mu*(B*B+(L-1)/L*C*C))
    for size in (3, 4, 5, 6):
        zero(finite_energy(size, b, v, mu)-formula.subs(L, size), "independent finite reaction enumeration")
    continuum = (C-b*B)**2+b*b*C*C+(C-v*A)**2+v*v*(B*B+C*C/2)+mu*(B*B+C*C)
    zero(s.limit(formula, L, s.oo)-continuum, "constant-core face integrals including outgoing sectors")
    print("  Constant-core continuum energy:", continuum)


def main():
    print("Python", platform.python_version(), "SymPy", s.__version__)
    print("Producer SHA256", hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    checks = [check_refinement, check_grid, check_corner, check_reactions]
    for check in checks:
        try:
            check(mutant=True)
        except AssertionError as exc:
            print("RED mutation rejected:", check.__name__, str(exc))
        else:
            raise AssertionError("Mutation survived: "+check.__name__)
        check()
        print("GREEN restored:", check.__name__)
    print("PASS: 4 invariant groups; 4 deliberate mutations rejected; largest matrix 8x2.")
    print("Headline: exact local spreading, corner identities, and collision scalings pass finite checks.")
    print("Boundary: no continuum lower bound, CFT, or modular-fidelity assertion was tested.")


if __name__ == "__main__":
    main()
