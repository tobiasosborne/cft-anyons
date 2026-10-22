"""Exact finite shadows of NOTE.md, not a category-to-CFT existence test.

Run from the repository root with python3 <this path>. No network or files
are written by this script. Bases are zero-indexed, all arithmetic exact.
The associative test algebra is C direct-sum C in its two idempotent basis;
units/metrics transport with basis change. Largest array is 32 by 16.
Source: reconstruction/03_sewing_deformations.md:109-137 (syzygy/gauge).
Other identities are derived in NOTE.md P2, N1, section 7 and LC-W.
"""

import hashlib
import itertools as it
from pathlib import Path
import platform
import sympy as s


def indices(n):
    return list(it.product(range(2), repeat=n))


def algebra_check(mutation=None):
    keys = indices(3)  # output, input, input
    rkeys = indices(4)
    coeff = s.symbols('m:8')
    mu = dict(zip(keys, coeff))
    rvars = s.symbols('r:16')
    rr = dict(zip(rkeys, rvars))
    residual = s.Matrix([
        sum(mu[o, u, c]*mu[u, a, b]-mu[o, a, u]*mu[u, b, c]
            for u in range(2)) for o, a, b, c in rkeys])
    last_sign = -1 if mutation == 'syzygy_sign' else 1
    syzygy = s.Matrix([
        sum(mu[o, a, u]*rr[u, b, c, d]
            - mu[u, a, b]*rr[o, u, c, d]
            + mu[u, b, c]*rr[o, a, u, d]
            - mu[u, c, d]*rr[o, a, b, u]
            + last_sign*mu[o, u, d]*rr[u, a, b, c]
            for u in range(2)) for o, a, b, c, d in indices(5)])
    q = syzygy.jacobian(rvars)
    assert all(s.expand(z) == 0 for z in q*residual), 'off-shell Q R != 0'
    base = {mu[o, a, b]: int(o == a == b) for o, a, b in keys}
    j = residual.jacobian(coeff).subs(base)
    q0 = q.subs(base)
    xi = s.Matrix(2, 2, s.symbols('x:4'))
    output_sign = 1 if mutation == 'gauge_sign' else -1
    gauge = s.Matrix([
        sum(mu[o, u, b]*xi[u, a]+mu[o, a, u]*xi[u, b]
            + output_sign*xi[o, u]*mu[u, a, b] for u in range(2))
        for o, a, b in keys]).subs(base)
    g = gauge.jacobian(list(xi))
    assert j*g == s.zeros(16, 4), 'd1 d0 != 0'
    assert q0*j == s.zeros(32, 8), 'd2 d1 != 0'
    xval = s.Matrix([[1, 2], [3, 4]])
    xv = dict(zip(list(xi), list(xval)))
    phi = gauge.subs(xv)
    b2 = residual.subs(dict(zip(coeff, phi)), simultaneous=True)
    psi = []
    x2 = xval*xval
    for o, a, b in keys:
        first = sum(mu[o, u, v]*xval[u, a]*xval[v, b]
                    for u, v in indices(2))
        second = -sum(xval[o, u]*(mu[u, v, b]*xval[v, a]
                                 + mu[u, a, v]*xval[v, b])
                      for u, v in indices(2))
        third = sum(x2[o, u]*mu[u, a, b] for u in range(2))
        psi.append((first+second+third).subs(base))
    assert q0*b2 == s.zeros(32, 1), 'quadratic obstruction is not closed'
    assert j*s.Matrix(psi)+b2 == s.zeros(16, 1), 'quadratic extension failed'
    return 'off-shell identity; d1*d0=d2*d1=0; closed and killed order-2 obstruction'


def corner_check(mutation=None):
    w = s.Matrix([[1, 0], [0, 1], [0, 0], [0, 0]])
    pmat = w*w.T
    a = s.diag(1, -1)
    theta = lambda x: w*x*w.T
    alpha = lambda x: s.diag(x, x)
    chi = lambda x: s.trace(x)/2
    cp = lambda x: theta(x)+chi(x)*(s.eye(4)-pmat)
    defect = cp(a*a)-cp(a)*cp(a)
    assert defect == s.eye(4)-pmat, 'CP defect formula failed'
    assert max(abs(v) for v in defect.eigenvals()) == 1
    vacuum = s.Matrix([1, 0, 0, 0])
    assert (vacuum.T*defect.T*defect*vacuum)[0] == 0
    vec = s.Matrix([s.Rational(3, 5), 0, 0, s.Rational(4, 5)])
    state = lambda b: (vec.T*b*vec)[0]
    p = state(pmat)
    tau = state(theta(a))/p
    eta = state((s.eye(4)-pmat)*alpha(a)*(s.eye(4)-pmat))/(1-p)
    complement = p if mutation == 'mixture_weight' else 1-p
    assert state(alpha(a)) == p*tau+complement*eta, 'state mixture failed'
    assert abs(state(alpha(a))-tau) == 2*(1-p) == s.Rational(32, 25)
    v2 = 2*(1-s.sqrt(p))
    assert (1+s.sqrt(p))*v2 == 2*(1-p)
    assert alpha(a)*w == w*a
    return 'p=9/25; sharp drift=32/25; vacuum defect^2=4/5; CP norm defect=1'


def central_check(mutation=None):
    m, c, cs, shift, l0 = s.symbols('m c cs shift l0')
    actual = 2*m*(l0-shift)+(m**3*cs-m*c)/12
    sign = -1 if mutation == 'central_shift' else 1
    expected = 2*m*l0+(m**3*cs-m*(c+sign*24*shift))/12
    assert s.expand(actual-expected) == 0, 'linear central coefficient shift'
    # Fourier monomials for [f,g]_* = f'g-fg', A=iT; n=-m.
    integral_over_2pi = s.I*(-m**3+m)
    defect_from_integral = -s.I*c*integral_over_2pi/12
    assert s.expand(defect_from_integral+c*(m**3-m)/12) == 0
    return 'c_linear -> c_linear+24a; cubic fixed; skew Fourier cocycle sign'


def ward_check(mutation=None):
    a0, a1, a2, z1, z2, dz1, dz2 = s.symbols(
        'a0 a1 a2 z1 z2 dz1 dz2', commutative=False)
    w1 = dz1+a1*z1-z1*a0
    w2 = dz2+a2*z2-z2*a1
    sewn = dz2*z1+z2*dz1+a2*z2*z1-z2*z1*a0
    assert s.expand(w2*z1+z2*w1-sewn) == 0
    return 'Ward residual propagates by product rule without commutativity'


def main():
    print('D6 exact formula checks; no continuum-existence claim')
    print('Python', platform.python_version(), 'SymPy', s.__version__)
    print('producer_sha256', hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    groups = [algebra_check, corner_check, central_check, ward_check]
    for fn in groups:
        print('PASS', fn.__name__, ':', fn())
    mutations = [(algebra_check, 'syzygy_sign'), (algebra_check, 'gauge_sign'),
                 (corner_check, 'mixture_weight'), (central_check, 'central_shift')]
    for fn, mutation in mutations:
        try:
            fn(mutation)
        except AssertionError as exc:
            print('RED mutation rejected:', mutation, ':', exc)
        else:
            raise AssertionError('mutation escaped: '+mutation)
    for fn in groups:
        fn()
    print('RESTORED PASS: 4 groups; 4 mutations rejected; largest array 32 x 16')


if __name__ == '__main__':
    main()
