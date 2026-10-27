#!/usr/bin/env python3
"""Opus REVIEW check for H2 (independent of the note's code paths).

Run from repo root:
  python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/review_h2_independent.py [--mutate MODE]
MODE in {none, no-gauge, alpha-nonmult, brief-sign}; every non-none mode must exit 1.

Pillar P3 on P2.  Layer: L0, pointed site O=1+g of Vec_Z2^omega (an INSTANCE only,
used to test whether the note's three-site "F-dependence" witness is an invariant).
Conventions: NOTE.md scoped conventions; left-associated words 000..111 (site 1
most significant); pointed F = omega (Penneys:594-608 as cited by the note);
R = dZ - B_out Z + Z B_in (brief sign); LC-1 sign W = dZ + B_out Z - Z B_in.

Tests (each asserts an invariant, Rule 7):
 T1  b=0 (pure pair tile): U = Z_1 CZ_12 maps (k12, k23[zeta=-1]) EXACTLY onto
     (k12, k23[zeta=+1]); so J(-) = U^dag J(+) U although J(-)-J(+) != 0
     entrywise.  The note's matrix-entry witness therefore certifies no
     invariant dependence on its own.
 T2  a,b != 0, same marked tile: the unitary invariant Tr((k12 k23)^2) differs
     between zeta=+1 and zeta=-1 (loop-holonomy sign), so for a FIXED marked
     tile the dependence is genuine.
 T3  no zeta=+1 tile k' (8 real parameters: any Hermitian charge-preserving
     two-site tile) reproduces the zeta=-1 word-trace invariants of the pair
     (k12,k23) for a=1,b=0.7 (numerical multistart least squares; min residual
     bounded away from 0).  Evidence, not proof, that the three-site placement
     pair is not isomorphic across the two cocycle classes.
 T4  the note's own equality-complex calibration has H^1 = H^2 = 0.
 T5  (C.3) needs multiplicativity of alpha: with alpha(x)=x (x) M, M^2 != M the
     off-shell identity fails (mutation alpha-nonmult must exit 1).
 T6  sign trap: with B_out = k = -h (KS density, brief sign) the collar residual
     is 2hT, not 0; with LC-1 sign and B_out=k it is 0 (mutation brief-sign).
"""
import argparse, itertools, runpy, sys
from pathlib import Path
import numpy as np
import sympy as s
from scipy.optimize import least_squares

ap = argparse.ArgumentParser()
ap.add_argument("--mutate", default="none",
                choices=["none", "no-gauge", "alpha-nonmult", "brief-sign"])
MUT = ap.parse_args().mutate

words = list(itertools.product((0, 1), repeat=3))
idx = {w: i for i, w in enumerate(words)}

def tile(a, b, d=(0, 0, 0, 0)):
    """two-site Hermitian charge-preserving tile, basis 00,01,10,11"""
    k = np.zeros((4, 4), complex)
    k[0, 3], k[3, 0] = a, np.conj(a)
    k[1, 2], k[2, 1] = b, np.conj(b)
    k[np.diag_indices(4)] = d
    return k

def placements(k, zeta):
    k12 = np.kron(k, np.eye(2))
    f3 = np.diag([zeta if w == (1, 1, 1) else 1 for w in words]).astype(complex)
    k23 = f3.conj().T @ np.kron(np.eye(2), k) @ f3
    return k12, k23

def current(k12, k23):
    return 1j * (k12 @ k23 - k23 @ k12)

# ---- T1: b = 0 dependence is pure gauge
a = 1.3
kp = tile(a, 0)
k12m, k23m = placements(kp, -1)
k12p, k23p = placements(kp, +1)
Z1 = np.diag([(-1) ** w[0] for w in words]).astype(complex)
CZ12 = np.diag([(-1) ** (w[0] * w[1]) for w in words]).astype(complex)
U = Z1 @ CZ12
if MUT == "no-gauge":
    U = np.eye(8)
Jm, Jp = current(k12m, k23m), current(k12p, k23p)
assert np.abs(Jm - Jp).max() > 1.0, "entrywise difference should be present"
err = max(np.abs(U @ k12m @ U.conj().T - k12p).max(),
          np.abs(U @ k23m @ U.conj().T - k23p).max(),
          np.abs(U @ Jm @ U.conj().T - Jp).max())
assert err < 1e-12, f"T1 gauge map failed, err={err}"
print(f"PASS T1 b=0: max|J(-)-J(+)|={np.abs(Jm-Jp).max():.3f} entrywise, yet "
      f"U=Z1*CZ12 conjugates (k12,k23,J) exactly (err={err:.1e}): gauge artifact")

# ---- T2: a,b != 0 invariant differs
def wt(k12, k23):
    return np.trace(k12 @ k23 @ k12 @ k23).real
a, b = 1.0, 0.7
inv = {z: wt(*placements(tile(a, b), z)) for z in (1, -1)}
assert abs(inv[1] - inv[-1]) > 1e-6, "T2 invariant should differ"
assert abs(inv[1] - 4 * (a * a * b * b + a**4 + b**4) / 1) >= 0  # recorded only
print(f"PASS T2 a=1,b=0.7: Tr((k12 k23)^2) = {inv[1]:.4f} (zeta=+1) vs {inv[-1]:.4f} "
      "(zeta=-1): fixed-tile dependence is a unitary invariant")

# ---- T3: no zeta=+1 tile reproduces zeta=-1 word traces
def word_traces(k12, k23, L=6):
    out = []
    for n in range(1, L + 1):
        for w in itertools.product((0, 1), repeat=n):
            M = np.eye(8, dtype=complex)
            for c in w:
                M = M @ (k12 if c == 0 else k23)
            out.append(np.trace(M))
    v = np.array(out)
    return np.concatenate([v.real, v.imag])
target = word_traces(*placements(tile(1.0, 0.7), -1))
def resid(p):
    k = tile(p[0] + 1j * p[1], p[2] + 1j * p[3], p[4:8])
    return word_traces(*placements(k, +1)) - target
rng = np.random.default_rng(20261027)
best = np.inf
for _ in range(60):
    sol = least_squares(resid, rng.normal(scale=1.0, size=8), xtol=1e-14, ftol=1e-14)
    best = min(best, np.linalg.norm(sol.fun) / np.linalg.norm(target))
# calibration: the same search finds zeta=-1 itself from zeta=-1 targets for b=0 (gauge case)
target0 = word_traces(*placements(tile(1.0, 0.0), -1))
def resid0(p):
    k = tile(p[0] + 1j * p[1], p[2] + 1j * p[3], p[4:8])
    return word_traces(*placements(k, +1)) - target0
best0 = min(np.linalg.norm(least_squares(resid0, rng.normal(size=8)).fun)
            for _ in range(20)) / np.linalg.norm(target0)
assert best0 < 1e-8, f"calibration: b=0 must be matchable, got {best0}"
assert best > 1e-3, f"T3 a zeta=+1 tile matched the zeta=-1 traces: {best}"
print(f"PASS T3 multistart(60): min rel. word-trace mismatch {best:.3e} for a=1,b=0.7 "
      f"(calibration b=0 matched to {best0:.1e})")

# ---- T4: cohomology of the note's own calibration
note = Path(__file__).with_name("equality_complex.py")
import contextlib, io
with contextlib.redirect_stdout(io.StringIO()):
    g = runpy.run_path(str(note))
D0, D1, D2 = g["D0"], g["D1"], g["D2"]
r0, r1, r2 = D0.rank(), D1.rank(), D2.rank()
H1 = (D1.cols - r1) - r0
H2 = (D2.cols - r2) - r1
assert (D1 * D0).is_zero_matrix and (D2 * D1).is_zero_matrix
assert H1 == 0 and H2 == 0, (H1, H2)
print(f"PASS T4 note calibration (base Z0=I, Z1=0, B independent): dim H^1={H1}, dim H^2={H2}")

# ---- T5: (C.3) requires multiplicative alpha
x = s.symbols("x0:4"); y = s.symbols("y0:4"); p = s.symbols("p0:16"); q = s.symbols("q0:16")
Zf, Zg = s.Matrix(2, 2, x), s.Matrix(2, 2, y)
Zfp, Zgp = s.Matrix(4, 4, p), s.Matrix(4, 4, q)
Zgf = s.Matrix(2, 2, s.symbols("w0:4")); Zgfp = s.Matrix(4, 4, s.symbols("v0:16"))
M = s.eye(2) if MUT != "alpha-nonmult" else s.Matrix([[1, 1], [0, 2]])
alpha = lambda X: s.kronecker_product(X, M)
E = lambda Zp, Z: Zp - alpha(Z)
S, Sp = Zgf - Zg * Zf, Zgfp - Zgp * Zfp
C3 = E(Zgfp, Zgf) - E(Zgp, Zg) * alpha(Zf) - Zgp * E(Zfp, Zf) - Sp + alpha(S)
assert C3.applyfunc(s.expand).is_zero_matrix, "T5 (C.3) fails for this alpha"
print("PASS T5 (C.3) off-shell with multiplicative alpha (M=1); mutation alpha-nonmult must fail")

# ---- T6: sign trap
t = s.symbols("t", real=True)
hs = s.Matrix(2, 2, s.symbols("h0:4"))
T = (t * hs).exp() if False else sum(((t * hs) ** n / s.factorial(n) for n in range(6)), s.zeros(2))
k = -hs
Rbrief = T.diff(t) - k * T            # brief sign, B_out = k, B_in = 0
Wlc1 = T.diff(t) + k * T              # LC-1 sign, B_out = k
lead = (Wlc1 if MUT != "brief-sign" else Rbrief).subs(t, 0)
assert lead.applyfunc(s.expand).is_zero_matrix, "T6 collar residual nonzero"
assert (Rbrief.subs(t, 0) - 2 * hs).is_zero_matrix
print("PASS T6 collar: LC-1 sign with B_out=k gives W=0; brief sign with B_out=k gives R=2hT")
print("ALL REVIEW CHECKS PASS (mutation=%s)" % MUT)
