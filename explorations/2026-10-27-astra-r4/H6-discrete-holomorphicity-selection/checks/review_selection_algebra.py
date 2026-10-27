#!/usr/bin/env python3
"""Reviewer check (independent of the note's scripts): the B5 kernel as an
intertwiner space, and its collapse to an algebra on exact-gate families.

Claim tested (REVIEW.md, Proposition R1, general C; examples only here):
  R_q(T) = T M_in - M_out (1_Y (x) T),
  M_in = z_L Q_L + z_B Q_R,  M_out = -(z_T Q_L + z_R Q_R).
  (i)  a continuous family T(u) -> 1 in ker forces M_in = M_out =: M;
  (ii) then ker = A_M := {T : T M = M (1_Y (x) T)}, a UNITAL ALGEBRA, so
       e^{th} in ker for all t  <=>  h in A_M, and with h also every p(h);
  (iii) at s = 0 (z = (-b, a, -a, b), a+b != 0) every q with M_in = M_out
       is vacuum type and gives A_M = B_2 (no selection at all; strengthens B4).
Categories (explicit, pointed, scalar associators; defined here, no import):
  * bit-pair grading G = Z2 x Z2, trivial associator, Y = a, chi_0 / chi_1
    (the note's half_braiding_witness data, re-implemented independently);
  * Z2 grading with associator omega(1,1,1) = w in {+1, -1}; Y = the odd
    simple with half-braiding beta(1), hexagon forcing beta(1)^2 = w
    (derived in REVIEW.md: beta(a+b) = w(a,b,y)^-1 beta(b) w(a,y,b) beta(a)
    w(y,a,b)^-1 with gamma: Y(x)A -> A(x)Y as in the note's (A2)).
Mutation (--mutate): z_T -> -z_L + 1/7. Then 1 is not in ker and ker is not
closed under products; the script must FAIL (exit 1).
Run from repo root:
  python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/review_selection_algebra.py
Pillar P3 on P2; finite, no rung.
"""
import itertools
import sys
import sympy as s

MUT = "--mutate" in sys.argv
I = s.I


def kernel_basis(dimV, units, Min, Mout):
    """Basis of {T in span(units) : T Min = Mout T} (Y simple, 1_Y(x)T = T
    in the (g,h) indexing of U = Y(x)V, valid for both examples below)."""
    xs = s.symbols(f"x0:{len(units)}")
    T = s.zeros(dimV)
    for x, (r, c) in zip(xs, units):
        T[r, c] = x
    eqs = list(T * Min - Mout * T)
    A, _ = s.linear_eq_to_matrix([e for e in eqs if e != 0], xs)
    out = []
    for v in A.nullspace():
        B = s.zeros(dimV)
        for val, (r, c) in zip(v, units):
            B[r, c] = val
        out.append(B)
    return out


def in_span(X, basis):
    if not basis:
        return X == s.zeros(*X.shape)
    cols = s.Matrix.hstack(*[b.reshape(len(b), 1) for b in basis])
    aug = s.Matrix.hstack(cols, X.reshape(len(X), 1))
    return cols.rank() == aug.rank()


def algebra_report(label, dimV, units, QL, QR, z):
    zL, zB, zT, zR = z
    Min = zL * QL + zB * QR
    Mout = -(zT * QL + zR * QR)
    K = kernel_basis(dimV, units, Min, Mout)
    one_in = in_span(s.eye(dimV), K)
    closed = all(in_span(X * Y, K) for X in K for Y in K)
    star = all(in_span(X.H, K) for X in K)
    print(f"{label}: dim ker={len(K)}, 1 in ker={one_in}, "
          f"closed under products={closed}, *-closed={star}")
    return K, one_in, closed


ok = True
# ---------- example 1: bit-pair grading, trivial associator -------------
G = [(0, 0), (1, 0), (0, 1), (1, 1)]
add = lambda g, h: (g[0] ^ h[0], g[1] ^ h[1])
a = (1, 0)
V = list(itertools.product(G, repeat=2))
ix = {v: k for k, v in enumerate(V)}
units = [(r, c) for r, x in enumerate(V) for c, y in enumerate(V)
         if add(*x) == add(*y)]
assert len(units) == 64
chis = {"chi0": lambda g: 1, "chi1": lambda g: (-1) ** g[1]}
# a generic endpoint q : a(x)g -> g+a with coefficients q_g (all nonzero)
qv = {G[0]: 1, G[1]: 2, G[2]: -1, G[3]: 3}


def ports(chi):
    QL, QR = s.zeros(16), s.zeros(16)
    for c, (g, h) in enumerate(V):
        QL[ix[(add(a, g), h)], c] = qv[g]
        QR[ix[(g, add(a, h))], c] = chi(g) * qv[h]
    return QL, QR


zL, zB = s.Rational(2, 3) + I, -1 + s.Rational(1, 5) * I   # generic
z_phase = (zL, zB, -zL + (s.Rational(1, 7) if MUT else 0), -zB)
dims = {}
for name, chi in chis.items():
    QL, QR = ports(chi)
    K, one_in, closed = algebra_report(f"bitpair {name} phase-cancel", 16,
                                       units, QL, QR, z_phase)
    ok &= one_in and closed
    dims[name] = len(K)
print(f"bitpair: half-braiding changes dim A_M: {dims}")
ok &= dims["chi0"] != dims["chi1"]

# (iii) s = 0 geometry: z = (-b, a, -a, b); B4 + collapse to B_2.
ag, bg = s.Integer(1), I
z0 = (-bg, ag, -ag, bg)
for name, chi in chis.items():
    QL, QR = ports(chi)
    K, one_in, _ = algebra_report(f"bitpair {name} s=0, Y=a", 16, units,
                                  QL, QR, z0)
    ok &= not one_in            # Hom(a,1)=0: no identity-normalised family
# vacuum-type endpoint: Y = unit with trivial / chi1 half-braiding, q = f(x)1
for name, chi in chis.items():
    QL, QR = s.zeros(16), s.zeros(16)
    for c, (g, h) in enumerate(V):
        QL[c, c] = 1
        QR[c, c] = chi(g)       # gamma_O on the first leg only
    Mdiff = (z0[0] + z0[2]) * QL + (z0[1] + z0[3]) * QR
    vac_ok = (QL == QR)
    K, one_in, _ = algebra_report(f"bitpair Y=(1,{name}) s=0", 16, units,
                                  QL, QR, z0)
    if vac_ok:
        ok &= len(K) == 64      # A_M = B_2: zero selection matrix
    else:
        ok &= not one_in        # (B13) fails: q must vanish for families
    print(f"  Q_L==Q_R: {vac_ok}; residual at T=1 zero: {Mdiff == s.zeros(16)}")

# ---------- example 2: Z2 grading with associator w ---------------------
W2 = [(g, h) for g in (0, 1) for h in (0, 1)]
j2 = {v: k for k, v in enumerate(W2)}
units2 = [(r, c) for r, x in enumerate(W2) for c, y in enumerate(W2)
          if (x[0] + x[1]) % 2 == (y[0] + y[1]) % 2]
assert len(units2) == 8
q2 = {0: 1, 1: 2}
res = {}
for w in (1, -1):
    om = lambda x, y, z: w if (x, y, z) == (1, 1, 1) else 1
    for beta1 in ([1, -1] if w == 1 else [I, -I]):
        beta = {0: 1, 1: beta1}
        # hexagon on all grade pairs, orientation of the note's (A2)
        for g, h in itertools.product((0, 1), repeat=2):
            lhs = beta[(g + h) % 2]
            rhs = s.simplify(beta[h] * beta[g] * om(g, 1, h)
                             / (om(g, h, 1) * om(1, g, h)))
            assert s.simplify(lhs - rhs) == 0, (w, beta1, g, h)
        QL, QR = s.zeros(4), s.zeros(4)
        for c, (g, h) in enumerate(W2):
            QL[j2[((g + 1) % 2, h)], c] = q2[g] / om(1, g, h)
            QR[j2[(g, (h + 1) % 2)], c] = (q2[h] * beta[g] * om(g, 1, h)
                                           / om(1, g, h))
        K, one_in, closed = algebra_report(
            f"Z2 w={w} beta(1)={beta1} phase-cancel", 4, units2, QL, QR,
            z_phase)
        ok &= one_in and closed
        res[(w, str(beta1))] = len(K)
print(f"Z2 associator/half-braiding pairs -> dim A_M: {res}")
if not ok:
    print("FAIL: a Proposition R1 invariant was violated")
    sys.exit(1)
print("PASS: kernel = unital algebra under phase cancellation; s=0 collapse;"
      " half-braiding enters dim A_M")
