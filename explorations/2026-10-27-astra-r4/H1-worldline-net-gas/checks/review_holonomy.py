#!/usr/bin/env python3
"""Opus REVIEW check for H1-D1 / D-FS / D2 path-gauge criterion.

Independent of check_fs_instance.py: builds the FULL path-basis Hilbert space
H_L = (+)_c Hom(c, O^L) for a pointed category Vec_{Z_n}^{omega_p}
(standard cocycle omega_p(a,b,c) = exp(2 pi i p a (b+c-[b+c]_n)/n^2),
cocycle condition asserted below), O = 1_vac (+) X, left-associated trees,
and embeds every two-site operator by alpha^{-1} T alpha with
alpha_{P,a,b} = omega(P,a,b) the associator (P = prefix charge).
It then computes the U(1) holonomy of the multigraph of nonzero off-diagonal
entries of all h_j (the NOTE's path-gauge criterion, H1-D2) by a spanning
tree, and asserts the general predictions of the NOTE:

 (P1) X = g self-dual in Z_2 (single cup tile, h = b+b^dag + hop):
      frustrated iff omega nontrivial (FS sign kappa = -1); D-FS.
 (P2) X = g (+) g^{-1} in Z_4 (non-self-dual, two oriented cups b_+, b_-):
      with the PROPER oriented ratio theta_-/theta_+ = omega(g,g^-1,g)
      (snake = 1) the gas is unfrustrated for every p (D1 positive
      direction, oriented form); with naive raw cups theta_- = theta_+ it is
      frustrated iff omega(g,g^-1,g) != 1.  This is a category the NOTE did
      not check; it tests the general statement, not an instance accident.
 (P3) Recompute the NOTE's D4 four-site history weight -729/4096 from the
      full matrices exp(t h_j) at t = log 2.
Mutations (must flip a verdict): drop associators in the embedding (P1
becomes unfrustrated: the FS sign is an associator effect); naive cups (P2).
Pointed instances are CHECKS of general statements (Rule 16), not results.
Pillars P2/P1; setting any; L0; finite; no rung.
"""
import cmath
import hashlib
import platform
from collections import deque
from datetime import datetime, timezone
from fractions import Fraction
from itertools import product
from pathlib import Path

import numpy as np

print('UTC:', datetime.now(timezone.utc).isoformat())
print('Python:', platform.python_version(), 'NumPy:', np.__version__)
print('SHA256:', hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
TOL = 1e-12


def make_omega(n, p):
    def omega(a, b, c):
        return cmath.exp(2j*cmath.pi*p*a*(b+c-((b+c) % n))/n**2)
    for a, b, c, d in product(range(n), repeat=4):  # cocycle condition
        lhs = omega(b, c, d)*omega(a, (b+c) % n, d)*omega(a, b, c)
        rhs = omega((a+b) % n, c, d)*omega(a, b, (c+d) % n)
        assert abs(lhs-rhs) < TOL, 'cocycle'
    for a, b in product(range(n), repeat=2):
        assert abs(omega(0, a, b)-1) < TOL and abs(omega(a, 0, b)-1) < TOL \
            and abs(omega(a, b, 0)-1) < TOL, 'normalised'
    return omega


def local_h(n, species, theta):
    """Two-site h in End(O(x)O): dict (a,b)->{(a',b'): scalar}.
    Cups 1(x)1 -> s (x) s^{-1} with scalar theta[s]; caps are adjoints;
    hops (s,0)<->(0,s) with scalar 1.  Vertex bases: skeletal scalar 1."""
    T = {}
    for s in species:
        sbar = (-s) % n
        if sbar in species:
            T.setdefault((0, 0), {})[(s, sbar)] = theta[s]
            T.setdefault((s, sbar), {})[(0, 0)] = np.conj(theta[s])
        T.setdefault((s, 0), {})[(0, s)] = 1.0
        T.setdefault((0, s), {})[(s, 0)] = 1.0
    return T


def chain(n, omega, species, theta, L, assoc=True):
    sites = [0]+list(species)
    states = list(product(sites, repeat=L))
    index = {s: i for i, s in enumerate(states)}
    T = local_h(n, species, theta)
    hs = []
    for j in range(L-1):
        H = np.zeros((len(states), len(states)), dtype=complex)
        for s in states:
            P = sum(s[:j]) % n
            for (a2, b2), t in T.get((s[j], s[j+1]), {}).items():
                assert (a2+b2) % n == (s[j]+s[j+1]) % n, 'charge'
                ph = omega(P, s[j], s[j+1])/omega(P, a2, b2) if assoc else 1
                s2 = s[:j]+(a2, b2)+s[j+2:]
                H[index[s2], index[s]] += ph*t
        assert np.allclose(H, H.conj().T, atol=TOL), 'h selfadjoint'
        hs.append(H)
    return states, index, hs


def holonomy(hs):
    """Max |edge phase - potential ratio| after spanning-tree gauge; 0 iff
    every closed walk (incl. parallel edges) has phase product 1."""
    N = hs[0].shape[0]
    edges = [[] for _ in range(N)]
    for H in hs:
        ys, xs = np.nonzero(np.abs(H) > TOL)
        for y, x in zip(ys, xs):
            if x != y:
                edges[x].append((y, H[y, x]/abs(H[y, x])))
    phi = [None]*N
    worst, witness = 0.0, None
    for root in range(N):
        if phi[root] is not None:
            continue
        phi[root] = 1.0
        queue = deque([root])
        while queue:
            x = queue.popleft()
            for y, z in edges[x]:
                if phi[y] is None:
                    phi[y] = phi[x]*z
                    queue.append(y)
    for x in range(N):
        for y, z in edges[x]:
            dev = abs(z - phi[y]/phi[x])
            if dev > worst:
                worst, witness = dev, (x, y, z/(phi[y]/phi[x]))
    return worst, witness


L = 4
print('\n(P1) Z_2, X = g, h = b + b^dag + hop, L =', L)
for p in (0, 1):
    om = make_omega(2, p)
    _, _, hs = chain(2, om, [1], {1: 1.0}, L)
    worst, wit = holonomy(hs)
    frustrated = worst > 1e-9
    assert frustrated == (p == 1), 'P1 prediction failed'
    print(f'  p={p}: omega(g,g,g)={om(1,1,1).real:+.0f}; frustrated={frustrated}',
          '' if wit is None else f'; residual holonomy {complex(wit[2]):.3f}')
om = make_omega(2, 1)
_, _, hs_noassoc = chain(2, om, [1], {1: 1.0}, L, assoc=False)
assert holonomy(hs_noassoc)[0] < 1e-9
print('  MUTATION DETECTED: dropping associators erases the FS frustration (p=1 -> unfrustrated).')

print('\n(P2) Z_4, X = g (+) g^3, two oriented cups, L =', L)
for p in range(4):
    om = make_omega(4, p)
    w = om(1, 3, 1)
    # snake on g: (b_+^dag (x) 1) alpha^{-1}_{g,g^3,g} (1 (x) b_-) = conj(th+) th- / w
    proper = {1: 1.0, 3: w}
    naive = {1: 1.0, 3: 1.0}
    snake_g = np.conj(proper[1])*proper[3]/om(1, 3, 1)
    snake_g3 = np.conj(proper[3])*proper[1]/om(3, 1, 3)
    assert abs(snake_g-1) < TOL and abs(snake_g3-1) < TOL, 'proper = both snakes trivial'
    wp, _ = holonomy(chain(4, om, [1, 3], proper, L)[2])
    wn, witn = holonomy(chain(4, om, [1, 3], naive, L)[2])
    assert wp < 1e-9, 'D1 oriented positive direction failed'
    assert (wn > 1e-9) == (abs(w-1) > TOL), 'naive-cup prediction failed'
    print(f'  p={p}: omega(g,g^-1,g)={complex(w):.0f}; proper cups frustrated={wp>1e-9};'
          f' naive cups frustrated={wn>1e-9}'
          + ('' if witn is None else f' (residual {complex(witn[2]):.3f})'))
print('  MUTATION DETECTED: naive raw cups (theta_-=theta_+) frustrated for p=1,2,3.')

print('\n(P3) NOTE D4 history from full matrices exp(t h_j), t = log 2')
om = make_omega(2, 1)
states, index, hs = chain(2, om, [1], {1: 1.0}, L)
t = np.log(2.0)
gates = []
for H in hs:
    assert np.allclose(H @ H @ H, H, atol=TOL), 'h^3 = h'
    gates.append(np.eye(len(states)) + (np.cosh(t)-1)*(H @ H) + np.sinh(t)*H)
hist = [(0, (1, 1, 0, 0)), (2, (1, 1, 1, 1)), (1, (1, 0, 0, 1)),
        (2, (1, 0, 1, 0)), (1, (1, 1, 0, 0)), (0, (0, 0, 0, 0))]
state, weight = (0, 0, 0, 0), 1.0+0j
for j, new in hist:
    weight *= gates[j][index[new], index[state]]
    state = new
target = -float(Fraction(729, 4096))
assert abs(weight-target) < 1e-12, weight
print(f'  closed history weight = {weight.real:.10f} = -729/4096 (independent rebuild)')
print('\nALL REVIEW HOLONOMY CHECKS PASSED (3 predictions, 2 mutations flipped).')
