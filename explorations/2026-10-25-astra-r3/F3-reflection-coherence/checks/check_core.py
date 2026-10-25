"""Exact finite checks for NOTE, run from the repository root.
Sources: PenneysUnitaryFusionCategories.md:219-237,682-708,992-1030;
CA-92:153-177 (unit-multiplicity kernel, flip Hermiticity).
Conventions: row-major vec; dagger=conjugate transpose; inner product x.H*y.
The unit multiplicity corner exists in every unitary fusion category.
--mutate-dagger intentionally confuses conjugation with dagger and MUST fail.
"""
import sys
import sympy as S


def check(ok, label):
    assert ok, label
    print('PASS', label)


def swap(n):
    return S.Matrix(n*n,n*n,lambda a,b:int(a//n==b%n and a%n==b//n))


def kernel(t, n):
    return S.Matrix(n*n,n*n,lambda a,b:t[(a//n)*n+b%n,(a%n)*n+b//n])


def vec(t):
    return S.Matrix(list(t))


def main():
    print('Python', sys.version.split()[0], 'SymPy', S.__version__)
    n=2; P=swap(n); I=S.eye(n)
    Y=S.Matrix([[0,-S.I],[S.I,0]]); Z=S.diag(1,-1)
    h=S.kronecker_product(Y,Z)-S.kronecker_product(Z,Y)
    rho=lambda x:P*x.conjugate()*P
    sharp=lambda x:P*(x.conjugate() if '--mutate-dagger' in sys.argv else x.H)*P
    check(h.H==h and rho(h)==h,'canonical conjugate-dual fixes Hermitian witness')
    k=kernel(h,n)
    check(k.H==-k and k!=S.zeros(4),'its canonical braided kernel is nonzero anti-Hermitian')
    print('K(h) =', k)
    for i in range(4):
        for j in range(4):
            e=S.zeros(4);e[i,j]=1
            check(kernel(sharp(e),n)==kernel(e,n).H, f'kernel adjoint equation E{i}{j}')
    g=S.kronecker_product(Y,I)+S.kronecker_product(I,Y)
    check(kernel(g,n).H==kernel(g,n) and rho(g)==-g,'reverse implication fails too')
    U=S.Matrix([[S.Rational(3,5),-S.Rational(4,5)],[S.Rational(4,5),S.Rational(3,5)]])
    z=U.H*U.T
    check(z==S.Matrix([[-7,24],[-24,-7]])/25,'arbitrary self-duality square computed exactly')
    check(z*Z*z.H!=Z,'square acts nontrivially on categorical observable Z')
    print('z =',z, '; z Z z.H - Z =',z*Z*z.H-Z)
    U3=S.diag(1,U);eta=S.Matrix([1,0,0]);Z3=S.diag(0,Z)
    z3=U3.H*U3.T
    check(U3*eta==eta and z3*Z3*z3.H!=Z3,'same obstruction with a vacuum-preserving pointed self-duality')
    u=vec(I); s=S.kronecker_product(U,U.conjugate())
    check(s.H*s==S.eye(4) and s*u==u,'arbitrary psi supplies cup-normalized unitary s_psi')
    # Mirror Gram identity for a genuinely complex, nonorthonormal basis.
    V=S.Matrix([[1,S.I],[0,2]]); G=V.H*V
    check(V*G.inv()*V.H==I,'inverse Gram identity')
    check(V.conjugate()*G.conjugate().inv()*V.T==I,'conjugate-dual transports sewing Gram inverse')
    # A two-form OS pair with no initial contraction bound.
    G=S.diag(1,0); tau=S.Matrix([[3,0],[5,7]]); G1=G*tau
    check(G1==S.diag(3,0),'compatible positive translated form without upper bound')
    check(tau*S.Matrix([0,1])==S.Matrix([0,7]),'Hermiticity forces null descent')
    check((G-G1)[0,0]<0,'q1 <= q0 is not necessary before finite normalization')
    print('OS quotient T=[3], normalized T=[1]; null direction removed exactly')
    # Identity history on N independent vertical lines, M periodic rows.
    d=2;N=M=2
    Tt=S.eye(d**N)
    v=S.Matrix([1,0,0,1]);Tx=v*v.H
    check(S.trace(Tt**M)==S.trace(Tx**N)==d**N,'whole identity history agrees in both contraction directions')
    check(Tt.rank()==4 and Tx.rank()==1,'whole equal-size directional transfers cannot be unitarily related')
    print('identity history N=M=2: temporal spectrum',Tt.eigenvals(),'spatial spectrum',Tx.eigenvals())


if __name__=='__main__':
    main()
