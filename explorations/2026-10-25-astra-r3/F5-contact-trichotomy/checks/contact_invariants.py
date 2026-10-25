"""Exact finite invariants and deliberate regressions for the F5 scan."""
from itertools import combinations, product
import numpy as np
import scipy.sparse as sp
from contact_fibres import Fibres, build, scalar, sector_indices


def close(A, B, message):
    assert np.max(np.abs(np.asarray(A)-np.asarray(B)), initial=0) < 2e-10, message


def caught(name, check):
    try:
        check()
    except AssertionError as exc:
        print(f"RED CAUGHT {name}: {exc}")
    else:
        raise AssertionError(f"mutation {name} escaped its invariant")


def tensor_square_oracle(L, data, alpha):
    """Independent full Vec, X=C^2 chain oracle, then exact P<=2 compression.

    Only L=4 is used; the large scans never construct tensor-product chains.
    """
    assert data.dims == (1, 2, 4) and L == 4
    eps = 1/L
    xx, x0, zero = np.zeros((4, 9)), np.zeros((2, 9)), np.zeros((1, 9))
    ox = np.zeros((2, 9))
    zero[0, 0] = 1
    for a in range(2):
        x0[a, 3*(a+1)] = 1
        ox[a, a+1] = 1
        for b in range(2):
            xx[2*a+b, 3*(a+1)+b+1] = 1
    dh, db, dv = x0-ox, xx-np.sqrt(eps)*data.B@x0, xx-eps*data.V@zero
    tile = dh.T@dh/eps**2 + data.lam*db.T@db/eps + data.kap*dv.T@dv/eps
    tile += (alpha-data.lam-data.kap)/eps * xx.T@xx
    full = np.zeros((3**L, 3**L))
    for j in range(L-1):
        full += np.kron(np.kron(np.eye(3**j), tile), np.eye(3**(L-j-2)))
    full += np.diag([sum(x != 0 for x in word) for word in product(range(3), repeat=L)])
    _, confs, _ = build(L, alpha, data)
    selected = []
    for c in confs:
        for colors in product(range(1, 3), repeat=len(c)):
            word = dict(zip(c, colors))
            selected.append(sum(word.get(j, 0)*3**(L-j-1) for j in range(L)))
    return full[np.ix_(selected, selected)]


def squeezed_and_schur():
    """Principal deletion keeps the outgoing kinetic diagonal (N1 squeeze)."""
    L = 8
    for n in (2, 3):
        configs = list(combinations(range(L), n)); index = {c: j for j, c in enumerate(configs)}
        graph = np.zeros((len(configs), len(configs)))
        for c, j in index.items():
            for site in c:
                if site+1 < L and site+1 not in c:
                    d = tuple(sorted(set(c)-{site} | {site+1})); k = index[d]
                    graph[j, j] += L**2; graph[k, k] += L**2
                    graph[j, k] -= L**2; graph[k, j] -= L**2
        q = [j for c, j in index.items() if all(b-a >= 2 for a, b in zip(c, c[1:]))]
        principal = graph[np.ix_(q, q)]
        m = L-n+1
        path = 2*L**2*(1-np.cos(np.pi*np.arange(m)/m))
        expected = sorted(sum(path[j] for j in js) for js in combinations(range(m), n))
        close(np.linalg.eigvalsh(principal), expected, f"N={n} squeezed fermionic spectrum")
        print(f"GREEN squeezed first-layer deletion: L={L},N={n},m={m}, "
              f"Qdim={len(q)}, ground={expected[0]:.10f}, full spectrum exact")
        if n != 2:
            continue
        d = [j for j in range(len(configs)) if j not in q]
        deep = graph.copy(); deep[d, d] -= L**6
        A = deep[np.ix_(q, q)]
        B = deep[np.ix_(q, d)]
        D = deep[np.ix_(d, d)]
        rA = np.linalg.inv(A-1j*np.eye(len(q)))
        gap = min(abs(np.linalg.eigvalsh(D)-1j))
        r, b = np.linalg.norm(rA, 2), np.linalg.norm(B, 2)
        delta = r*b*b/gap
        assert delta < 1, "Schur perturbation estimate needs delta<1"
        bound = 1/gap + (r*r*b*b/gap+2*r*b/gap+r*b*b/gap**2)/(1-delta)
        target = np.zeros(deep.shape, complex); target[np.ix_(q, q)] = rA
        resolvent = np.linalg.inv(deep-1j*np.eye(len(configs)))
        error = np.linalg.norm(resolvent-target, 2)
        assert error <= bound, "deep Schur resolvent bound failed"
        wrong_A = A-np.diag(-np.sum(B, axis=1))
        wrong_target = np.zeros(deep.shape, complex)
        wrong_target[np.ix_(q, q)] = np.linalg.inv(wrong_A-1j*np.eye(len(q)))
        caught("rebuilding reflecting diagonal after deleting collision layer",
               lambda: schur_bound(resolvent, wrong_target, bound))
        print(f"GREEN deep Schur: L={L} gap={gap:.8e}, coupling_norm={b:.8e}, "
              f"resolvent_norm_error={error:.8e} <= bound={bound:.8e}")


def schur_bound(resolvent, target, bound):
    assert np.linalg.norm(resolvent-target, 2) <= bound, "principal outgoing kinetic diagonal was lost"


def run_invariants():
    squeezed_and_schur()
    L = 6
    plain = scalar(reactions=False)
    H, cs, ix = build(L, 0, plain, mu=0)
    si = sector_indices(cs, ix, plain.dims, 2)
    ones = np.ones(len(si))
    close(H[si][:, si]@ones, 0, "critical graph must annihilate constants")
    bad = build(L, 0, plain, mu=0, missing_critical=True)[0]
    caught("missing critical -2t", lambda: close(bad[si][:, si]@ones, 0,
           "missing -2t destroys the Neumann constant kernel"))
    # Exact killed exclusion spectrum: antisymmetric products of path cosines.
    killed = bad[si][:, si].toarray()
    path = 2*L**2*(1-np.cos(np.pi*np.arange(L)/L))
    oracle = sorted(path[m]+path[n] for m in range(L) for n in range(m+1, L))
    close(np.linalg.eigvalsh(killed), oracle, "killed graph fermionic spectrum")
    caught("killed graph replaced by reflecting graph", lambda: close(
           np.linalg.eigvalsh(H[si][:, si].toarray()), oracle,
           "Dirichlet/killed spectrum differs from Neumann graph"))
    correct, cs, ix = build(L, 2)
    def pair_power(matrix):
        close(matrix[0, 0], 1.3**2*(1-1/L), "wrong pair scaling")
    def fusion_power(matrix):
        close(matrix[ix[(0, 1)], ix[(0,)]], -0.7*np.sqrt(L), "wrong fusion scaling")
    pair_power(correct); fusion_power(correct)
    caught("wrong v power", lambda: pair_power(build(L, 2, v_power=0)[0]))
    caught("wrong b power", lambda: fusion_power(build(L, 2, b_power=0)[0]))
    # Genuine non-scalar fibre test, including outgoing diagonals.
    B = np.array([[0.7, 0.1], [0.2, -0.3], [0.4, 0.8], [0.0, 0.5]])
    V = np.array([[0.3], [-0.4], [0.2], [0.6]])
    q = B.T@B
    data = Fibres((1, 2, 4), B, V, np.kron(q, np.eye(2)),
                  np.kron(np.eye(2), q), float((V.T@V)[0, 0]))
    reference = tensor_square_oracle(4, data, alpha=1.25)
    actual = build(4, 1.25, data)[0].toarray()
    close(actual, reference, "finite-fibre builder is not exact P H P")
    caught("missing outgoing diagonals", lambda: close(
           build(4, 1.25, data, outgoing=False)[0].toarray(), reference,
           "P H P retains sources whose targets lie above N=2"))
    print("GREEN invariants: graph kernel, exact killed spectrum, b/v powers, "
          "33x33 Vec(X=C^2) compression against independent 81x81 square oracle")


def examples():
    # Only fusion dimensions/allowed morphism blocks are claimed here.
    # PenneysUnitaryFusionCategories.md:610--631; RSWfinal3.tex:2441--2448.
    fib = {(0, 0): {0: 1}, (0, 1): {1: 1}, (1, 0): {1: 1},
           (1, 1): {0: 1, 1: 1}}
    ising = {(0, j): {j: 1} for j in range(3)}
    ising.update({(j, 0): {j: 1} for j in range(3)})
    ising.update({(1, 1): {0: 1, 2: 1}, (1, 2): {1: 1},
                  (2, 1): {1: 1}, (2, 2): {0: 1}})
    for name, rules, expected in (("Fibonacci", fib, [1, 1, 2, 3, 5]),
                                   ("Ising", ising, [1, 1, 2, 2, 4])):
        powers = [{0: 1}]
        for n in range(4):
            nxt = {}
            for a, multiplicity in powers[-1].items():
                for c, fusion in rules[a, 1].items():
                    nxt[c] = nxt.get(c, 0)+multiplicity*fusion
            powers.append(nxt)
        assert [sum(p.values()) for p in powers] == expected
        dim_b, dim_v = powers[2].get(1, 0), powers[2].get(0, 0)
        assert (dim_b, dim_v) == ((1, 1) if name == "Fibonacci" else (0, 1))
        print(f"INSTANCE {name}: X=simple generator; fibre multiplicities N=0..4 "
              f"{powers}; dim Hom(X,X^2)={dim_b}, dim Hom(1,X^2)={dim_v}; L<=4 only")
