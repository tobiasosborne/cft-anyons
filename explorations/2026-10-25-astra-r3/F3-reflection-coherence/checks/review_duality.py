"""Independent exact audit of A4, C, D, E, F; no author imports.
Sources: PenneysUnitaryFusionCategories.md:398-430,682-708,992-1030;
CA-92:83-87. This is a unit-multiplicity calibration, not a universal proof.
Conventions: row-major ordered tensor coordinates, inner product x.H*y.
A chosen dual uses Q: standard dual -> chosen dual, coev=(I tensor Q)vec(I),
ev=vec(I).T (Q.H tensor I). Double dual has an independent gauge R.
Mutation --mutate-dual drops conjugation from D(psi) and must fail E1.
"""
import sys
import sympy as S


def eq(a, b):
    return all(S.simplify(x) == 0 for x in a-b)


def check(condition, label):
    assert condition, label
    print('PASS', label)


def cup(n):
    return S.Matrix([int(i == j) for i in range(n) for j in range(n)])


def flip(n):
    p = S.zeros(n*n)
    for i in range(n):
        for j in range(n):
            p[j*n+i, i*n+j] = 1
    return p


def main():
    print('Python', sys.version.split()[0], 'SymPy', S.__version__)
    n = 2
    I = S.eye(n)
    P = flip(n)
    Q = S.Matrix([[3*S.I, -4*S.I], [4, 3]])/5
    R = S.Matrix([[0, S.I], [1, 0]])
    psi = S.Matrix([[0, 1], [S.I, 0]])
    check(all(eq(v.H*v, I) for v in [Q, R, psi]), 'three complex unitaries')
    u = S.kronecker_product(I, Q)*cup(n)
    ev = cup(n).T*S.kronecker_product(Q.H, I)
    v = ev.H
    ud = S.kronecker_product(I, R)*cup(n)
    j = S.kronecker_product(u.H, I)*S.kronecker_product(I, ud)
    check(eq(j, R*Q.conjugate()), 'pivotal comparison from its cup formula')
    check(eq(S.kronecker_product(I, ev)*S.kronecker_product(u, I), I)
          and eq(S.kronecker_product(ev, I)*S.kronecker_product(I, u), I),
          'both oriented snakes in complex dual gauge')
    check(eq(P*u, v), 'canonical symmetric seam cup equation')
    t = S.kronecker_product(I, ev)*S.kronecker_product(P, I)*S.kronecker_product(v, I)
    check(eq(t, I), 'A4 cup correction in complex gauge')
    Dpsi = R*(psi if '--mutate-dual' in sys.argv else psi.conjugate())*Q.H
    seam_psi = S.kronecker_product(psi, j.H*Dpsi)
    check(eq(seam_psi.H*seam_psi, S.eye(4)), 'E1 remains unitary even in mutation')
    check(eq(seam_psi*u, v), 'E1 cup equation needs conjugate dual')
    D = lambda a: Q*a.conjugate()*Q.H
    D2 = lambda a: R*D(a).conjugate()*R.H
    rho = lambda a: psi.H*D(a)*psi
    z = psi.H*Q*psi.T*Q.conjugate()
    bend = lambda a: S.kronecker_product(I, I, u.H)*S.kronecker_product(I, a, I)*S.kronecker_product(v, I, I)
    unbend = lambda a: S.kronecker_product(u.H, I, I)*S.kronecker_product(I, a, I)*S.kronecker_product(I, I, v)
    K = lambda a: P.H*bend(a)
    sharp = lambda a: unbend(P*K(a).H)
    for row in range(n):
        for col in range(n):
            a = S.zeros(n); a[row, col] = 1
            assert eq(D2(a), j*a*j.H), ('double dual', row, col)
            assert eq(rho(rho(a)), z*a*z.H), ('square defect', row, col)
    check(True, 'C2 and D2 on all four site matrix units with complex gauges')
    for row in range(n*n):
        for col in range(n*n):
            a = S.zeros(n*n); a[row, col] = 1
            assert eq(unbend(bend(a)), a), ('inverse bend', row, col)
            assert eq(bend(unbend(a)), a), ('inverse other direction', row, col)
            assert eq(K(sharp(a)), K(a).H), ('adjoint', row, col)
            assert eq(sharp(sharp(a)), a), ('involution', row, col)
    check(True, 'F2 both inverse identities and F1 on all 16 tile matrix units')
    check(eq(K(S.eye(4)), u*u.H), 'rank-one identity kernel in complex gauge')
    # Independent homogeneous Z3 example: evaluate the mixed seam by cup
    # contraction and transport the adjoint back with the inverse bend.
    w = (-1+S.sqrt(3)*S.I)/2
    pow3 = lambda k: [S.Integer(1), w, S.conjugate(w)][k % 3]
    for a in range(3):
        for b in range(3):
            for c in range(3):
                assert S.simplify(pow3(a*(b+c))-pow3(a*b)*pow3(a*c)) == 0
                assert S.simplify(pow3((a+b)*c)-pow3(a*c)*pow3(b*c)) == 0
    check(True, 'both strict Z3 hexagons for the constructed braiding')
    braiding = S.zeros(4)
    for a in range(2):
        for b in range(2):
            braiding[2*b+a, 2*a+b] = pow3(-a*b)
    twist = S.diag(1, w)
    sc = braiding*S.kronecker_product(twist, I)
    u0 = cup(2)
    ev0 = u0.T
    check(eq(sc.H*sc, S.eye(4)) and eq(sc*u0, u0), 'nontrivial braided canonical seam')
    t4 = S.kronecker_product(I, ev0)*S.kronecker_product(braiding.H, I)*S.kronecker_product(u0, I)
    check(eq(t4, twist), 'A4 fixes positive twist sign in non-symmetric braiding')
    rot = lambda a: S.kronecker_product(I, I, ev0)*S.kronecker_product(I, a, I)*S.kronecker_product(u0, I, I)
    unrot = lambda a: S.kronecker_product(ev0, I, I)*S.kronecker_product(I, a, I)*S.kronecker_product(I, I, u0)
    sharp3 = lambda a: unrot(sc*(sc.H*rot(a)).H).applyfunc(S.simplify)
    A = S.zeros(4); A[1, 2] = 1
    B = A.T
    charges = [0, 1, 1, 2]
    check(all(m[a,b] == 0 or charges[a] == charges[b]
              for m in [A,B] for a in range(4) for b in range(4)),
          'composition witnesses are categorical morphisms')
    P10 = S.zeros(4); P10[2, 2] = 1
    check(eq(sharp3(A), A) and eq(sharp3(B), pow3(2)*B)
          and eq(sharp3(A*B), P10), 'independent braided composition witness')
    check(not eq(sharp3(A*B), sharp3(A)*sharp3(B))
          and not eq(sharp3(A*B), sharp3(B)*sharp3(A)), 'neither composition variance')
    print('twist =', twist, '; sharp(AB) =', sharp3(A*B))


if __name__ == '__main__':
    main()
