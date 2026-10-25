"""Finite-fibre N<=2 Galerkin matrices; no category-specific chain compiler.

Conventions: NOTE.md, CONVENTIONS (aw), CA-94:90--110. eps=1/L,
H=t eps^-2 graph + D1 squares + (alpha-a) eps^-1 P_adj + mu N.
Thus total contact is alpha/eps and c=-2t+eps*alpha relative to the
number-counterterm/killed-hop convention. No outer penalty. Fibres carry
orthonormal bases; matrices act on columns. Qb1,Qb2 are the two outgoing
b-dagger-b insertions on E2 and gamma is v-dagger-v (scalar on lower fibres).
Compression is P H P, never P (H-i)^-1 P. Outgoing reaction diagonals remain.
"""
from dataclasses import dataclass
from itertools import combinations
import numpy as np
import scipy.sparse as sp


@dataclass
class Fibres:
    dims: tuple
    B: np.ndarray
    V: np.ndarray
    Qb1: np.ndarray
    Qb2: np.ndarray
    gamma: float
    lam: float = 1.0
    kap: float = 1.0

    def validate(self):
        d0, d1, d2 = self.dims
        assert d0 in (0, 1), "one fixed-charge block has E0=0 or C"
        assert self.B.shape == (d2, d1) and self.V.shape == (d2, d0)
        for q in (self.Qb1, self.Qb2):
            assert q.shape == (d2, d2)
            assert np.allclose(q, q.conj().T, atol=1e-13)
            assert d2 == 0 or np.linalg.eigvalsh(q)[0] >= -1e-13
        assert min(self.gamma, self.lam, self.kap) >= 0
        if d0:
            assert np.allclose(self.V.conj().T @ self.V, self.gamma, atol=1e-13)


def scalar(b=0.7, v=1.3, reactions=True):
    z = 1.0 if reactions else 0.0
    return Fibres((1, 1, 1), np.array([[b]]), np.array([[v]]),
                  np.array([[b*b]]), np.array([[b*b]]), v*v, z, z)


def build(L, alpha, data=None, t=1.0, mu=1.0, b_power=0.5,
          v_power=1.0, outgoing=True, missing_critical=False):
    """Expand the exact squares, retaining maps to omitted sectors as Q terms."""
    assert isinstance(L, int) and L >= 3 and t > 0
    data = scalar() if data is None else data
    data.validate()
    eps = 1.0/L
    configs = [()] + [(j,) for j in range(L)] + list(combinations(range(L), 2))
    offsets, n = {}, 0
    for c in configs:
        offsets[c] = n
        n += data.dims[len(c)]
    rows, cols, values = [], [], []

    def block(c, d, A, weight=1.0):
        A = np.asarray(A)
        assert A.shape == (data.dims[len(c)], data.dims[len(d)])
        ii, jj = np.nonzero(A)
        rows.extend((offsets[c]+ii).tolist())
        cols.extend((offsets[d]+jj).tolist())
        values.extend((weight*A[ii, jj]).tolist())

    for c in configs:
        count, occupied = len(c), set(c)
        eye = np.eye(data.dims[count])
        block(c, c, eye, mu*count)
        # Each unoriented legal exclusion edge contributes |u(c)-u(d)|^2.
        for j in c:
            if j+1 < L and j+1 not in occupied:
                d = tuple(sorted(occupied-{j} | {j+1}))
                block(c, c, eye, t/eps**2)
                block(d, d, eye, t/eps**2)
                block(c, d, eye, -t/eps**2)
                block(d, c, eye, -t/eps**2)
        # Lower b inputs: 1->2 retained, and 2->3 outgoing remnants.
        if count == 1:
            if c[0] < L-1:
                block(c, c, data.B.conj().T @ data.B,
                      data.lam*eps**(2*b_power-1))
        if count == 2 and outgoing:
            for position, j in enumerate(c):
                if j < L-1 and j+1 not in occupied:
                    block(c, c, (data.Qb1, data.Qb2)[position],
                          data.lam*eps**(2*b_power-1))
        # Lower v inputs: every empty bond, including 1->3 and 2->4.
        if count == 0 or outgoing:
            empty = sum(j not in occupied and j+1 not in occupied
                        for j in range(L-1))
            block(c, c, eye, data.kap*eps**(2*v_power-1)*data.gamma*empty)
        if count == 2 and c[1] == c[0]+1:
            a = data.lam+data.kap
            block(c, c, eye, a/eps)
            block(c, c, eye, (alpha-a)/eps)
            if missing_critical:
                block(c, c, eye, 2*t/eps**2)
            lower = (c[0],)
            block(c, lower, data.B, -data.lam*eps**(b_power-1))
            block(lower, c, data.B.conj().T, -data.lam*eps**(b_power-1))
            block(c, (), data.V, -data.kap*eps**(v_power-1))
            block((), c, data.V.conj().T, -data.kap*eps**(v_power-1))
    H = sp.coo_matrix((values, (rows, cols)), shape=(n, n)).tocsr()
    assert sp.linalg.norm(H-H.conj().T) < 1e-10, "matrix lost self-adjointness"
    return H, configs, offsets


def sector_indices(configs, offsets, dims, sector):
    return np.array([offsets[c]+j for c in configs if len(c) == sector
                     for j in range(dims[sector])], dtype=int)


def dirichlet_box(L, configs, offsets, dims):
    """K_eps^* sqrt(2)(cos(pi*y)-cos(pi*x)); exact rectangular integrals.

    Continuum norm=1 and eigenvalue=pi^2 for -Delta, by direct integration
    and differentiation; it vanishes at x=y and has outer Neumann traces.
    """
    assert dims == (1, 1, 1)
    ans = np.zeros(sum(dims[len(c)] for c in configs))
    ints = np.diff(np.sin(np.pi*np.arange(L+1)/L))/np.pi
    for c in configs:
        if len(c) == 2:
            ans[offsets[c]] = np.sqrt(2)*(ints[c[1]]-ints[c[0]])
    return ans
