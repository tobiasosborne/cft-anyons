"""Exact category calibrations for NOTE; no external F tables or network.

Source: references/text/PenneysUnitaryFusionCategories.md:277-294,321-323
defines graded Hilbert and unitary representation categories. All particular
group, intertwiner and recoupling data below are constructed and checked here.
Orthonormal isometries use CONVENTIONS (b), not Penneys' raw vertex basis.
Largest operator matrix (the four-leg cup contraction) is 81x81; arithmetic
is exact. Character counts below need no imported character table: on Hom
spaces, the group average of X -> rho_target(g) X rho_source(g)^dagger is
an idempotent (by the checked group closure). Its image is precisely Hom_G.
Its trace is the displayed character average and equals its rank. This
proves the multiplicity counts; commutant dimension one proves irreducibility
since every unitary invariant subspace has a commuting orthogonal projector.
"""
from collections import Counter
import sys
import sympy as S
from check_seams import kernel, bent_kernel, swap, cup


def clean(m):
    return m.applyfunc(lambda x: S.simplify(S.expand_complex(x)))


def vec_z3():
    # O=1+g, g^3=1, bar g=g^2 != g. Associator and pivotal maps are identities.
    grades = [0, 1]
    total = [(a+b) % 3 for a in grades for b in grades]
    wgrades = [(a-b) % 3 for a in grades for b in grades]
    t = S.eye(4)+S.Rational(1, 2)*swap(2)
    assert all(t[i,j] == 0 for i in range(4) for j in range(4) if total[i] != total[j])
    k = kernel(t, 2)
    assert k == bent_kernel(t, 2)
    assert all(k[i,j] == 0 for i in range(4) for j in range(4) if wgrades[i] != wgrades[j])
    assert k == cup(2)*cup(2).H+S.eye(4)/2
    blocks = [k.extract([i for i,g in enumerate(wgrades) if g == a],
                        [i for i,g in enumerate(wgrades) if g == a]) for a in range(3)]
    assert blocks[0] == S.Matrix([[S.Rational(3,2),1],[1,S.Rational(3,2)]])
    assert blocks[1] == blocks[2] == S.Matrix([[S.Rational(1,2)]])
    print('PASS Vec_Z3: non-self-dual O=1+g; F=1, dual g^2; K blocks=', blocks)


def rep_a4():
    # Signed cyclic permutation matrices preserve the four tetrahedral vertices.
    d = S.diag(1, -1, -1)
    c = S.Matrix([[0,0,1],[1,0,0],[0,1,0]])
    signs = [S.eye(3),d,c*d*c.T,c.T*d*c]
    group = [a*c**b for a in signs for b in range(3)]
    keys = {tuple(g) for g in group}
    assert len(keys) == 12
    assert all(tuple(g*h) in keys for g in group for h in group)
    vertices = [S.Matrix(x) for x in [(1,1,1),(1,-1,-1),(-1,1,-1),(-1,-1,1)]]
    assert all(any(g*v == w for w in vertices) for g in group for v in vertices)
    # Faithful order-12 rotation group of these vertices = the even permutations A4.
    chars = [S.trace(g) for g in group]
    assert sum(x*x for x in chars) == 12       # V is irreducible.
    assert sum(x**3 for x in chars)/12 == 2   # Hom(V,V tensor V) dimension.
    assert sum(x**4 for x in chars)/12 == 7   # Hom(V,V tensor V tensor V).
    w = (-1+S.sqrt(3)*S.I)/2
    cups = [S.Matrix(9,1,lambda ij,_: w**(r*(ij//3))/S.sqrt(3)
                     if ij//3 == ij % 3 else 0) for r in range(3)]
    vs, va = S.zeros(9,3), S.zeros(9,3)
    for k,(i,j) in enumerate([(1,2),(2,0),(0,1)]):
        vs[3*i+j,k] = vs[3*j+i,k] = 1/S.sqrt(2)
        va[3*i+j,k], va[3*j+i,k] = 1/S.sqrt(2), -1/S.sqrt(2)
    verts = [vs,va]
    u = S.Matrix.hstack(*cups,*verts)
    assert clean(u.H*u) == S.eye(9)
    for g in group:
        assert all(S.kronecker_product(g,g)*v == v*g for v in verts)
    # Check each one-dimensional character and its 3 x character intertwiner.
    left, right = [], []
    for r,cr in enumerate(cups):
        q = w**(-r)
        sr = S.diag(1,q,q*q)
        assert clean(S.kronecker_product(c,c)*cr-q*cr) == S.zeros(9,1)
        assert S.kronecker_product(d,d)*cr == cr
        assert clean(q*c*sr-sr*c) == S.zeros(3)
        assert d*sr == sr*d
        left.append(S.kronecker_product(cr,S.eye(3))*sr)
        right.append(S.kronecker_product(S.eye(3),cr)*sr)
    for va_ in verts:
        for vb_ in verts:
            left.append(S.kronecker_product(va_,S.eye(3))*vb_)
            right.append(S.kronecker_product(S.eye(3),va_)*vb_)
    for trees in [left,right]:
        for i,li in enumerate(trees):
            for j,lj in enumerate(trees):
                assert clean(li.H*lj) == int(i == j)*S.eye(3)
    # F converts right-tree coordinates to left-tree coordinates: F_ij = <L_i,R_j>.
    f = clean(S.Matrix(7,7,lambda i,j:S.trace(left[i].H*right[j])/3))
    if '--mutate-f' in sys.argv:
        f = f.conjugate()
    assert clean(f.H*f) == S.eye(7)
    for j in range(7):
        assert clean(sum((left[i]*f[i,j] for i in range(7)),S.zeros(27,3))-right[j]) == S.zeros(27,3)
    t = S.eye(9)+swap(3)/2
    assert clean(u.H*t*u) == S.diag(*([S.Rational(3,2)]*6+[S.Rational(1,2)]*3))
    k = kernel(t,3)
    assert k == bent_kernel(t,3) == cup(3)*cup(3).H+S.eye(9)/2
    assert clean(u.H*k*u) == S.diag(S.Rational(7,2),*[S.Rational(1,2)]*8)
    # Exercise every multiplicity matrix unit; compare independent cup and index paths.
    for a in verts:
        for b in verts:
            tile = a*b.H
            placed = S.kronecker_product(S.eye(3),tile)
            in_left = clean(S.Matrix(7,7,lambda i,j:S.trace(left[i].H*placed*left[j])/3))
            in_right = clean(S.Matrix(7,7,lambda i,j:S.trace(right[i].H*placed*right[j])/3))
            f_path = f.H  # root (ao): LEFT coordinates -> RIGHT coordinates.
            assert clean(f_path.H*in_right*f_path-in_left) == S.zeros(7)
            kc = kernel(tile,3)
            assert clean(kc-bent_kernel(tile,3)) == S.zeros(9)
            for g in [d,c]:
                action = S.kronecker_product(g,g)
                assert clean(kc*action-action*kc) == S.zeros(9)
            block = S.Matrix(2,2,lambda i,j:S.trace(verts[i].H*kc*verts[j])/3)
            for i in range(2):
                for j in range(2):
                    assert clean(verts[i].H*kc*verts[j]-block[i,j]*S.eye(3)) == S.zeros(3)
    print('PASS Rep(A4): |G|=12, irreducible dim=3, N_VV^V=2, triple multiplicity=7')
    print('F_RtoL (rows left, columns right; order chars 0,1,2 then ++,+-,-+,--):',f)
    print('PASS 7x7 F unitary, full tree reconstruction and F_path^dagger D F_path placements for four multiplicity units')
    print('PASS K charge blocks: 7/2, 1/2, 1/2, (1/2) I_2; temporal T>0')


def noncommuting_grades():
    # Explicit failure of W_+ ~= W_- in Vec_S3.
    mul = lambda a,b: tuple(a[b[i]] for i in range(3))
    inv = lambda a: tuple(a.index(i) for i in range(3))
    e,g,h = (0,1,2),(1,0,2),(1,2,0)
    o = [e,g,h]
    plus = Counter(mul(a,inv(b)) for a in o for b in o)
    minus = Counter(mul(inv(a),b) for a in o for b in o)
    assert plus != minus and plus[e] == minus[e] == 3
    assert plus[(2,1,0)] == 2 and minus[(2,1,0)] == 0
    assert minus[(0,2,1)] == 2 and plus[(0,2,1)] == 0
    print('PASS Vec_S3 obstruction: W+ grades',dict(plus),'W- grades',dict(minus))


if __name__ == '__main__':
    print('Python',sys.version.split()[0],'SymPy',S.__version__)
    vec_z3()
    rep_a4()
    noncommuting_grades()
