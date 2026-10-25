"""Exact self-dual non-pointed calibration; no imported category tables.
Source: references/text/PenneysUnitaryFusionCategories.md:290-294,321-323
constructs Rep^dagger(G); :919-941,1032-1047 gives real/pseudoreal sign.
We construct the finite quaternion group and its two-dimensional unitary
irreducible V directly. The representation-category associator is the usual
rebracketing; braiding is flip. Standard oriented dual has coev=vec(I), ev=coev.H.
The self-duality U:V->barV is real antisymmetric and unitary. After identifying
barV with V the cup is vec(U) and the cap is -vec(U).H (FS=-1).
--mutate-fs intentionally drops that minus sign and MUST fail the zigzag.
"""
import sys
import sympy as S
from check_core import check,kernel,swap,vec


def main():
    print('Python',sys.version.split()[0],'SymPy',S.__version__)
    I=S.eye(2);Z=S.diag(1,-1);U=S.Matrix([[0,1],[-1,0]])
    A=S.I*Z
    G=[eps*g for g in [I,A,U,A*U] for eps in [1,-1]]
    keys={tuple(g) for g in G}
    check(len(keys)==8 and all(tuple(g*h) in keys for g in G for h in G),'Q8 constructed: order eight and closure')
    check(all(g.H*g==I for g in G),'unitary representation matrices')
    # Averaging conjugation is an idempotent onto the commutant. Its trace
    # average |chi(g)|^2 is its rank; rank one proves irreducibility.
    commdim=S.simplify(sum(S.trace(g)*S.conjugate(S.trace(g)) for g in G)/8)
    check(commdim==1,'V irreducible, dimension 2: category is non-pointed')
    check(U.H*U==I and U.T==-U and all(U*g==g.conjugate()*U for g in G),'unitary antisymmetric self-duality, FS=-1')
    cup=vec(U)
    cap=cup.H if '--mutate-fs' in sys.argv else -cup.H
    check(S.kronecker_product(I,cap)*S.kronecker_product(cup,I)==I,'FS-correct identified zigzag')
    check(S.kronecker_product(cap,I)*S.kronecker_product(I,cup)==I,'second FS-correct identified zigzag')
    check(cup.H*cup==S.Matrix([[2]]) and swap(2)*cup==-cup,'positive raw cup norm with negative FS symmetry')
    # Source and target self-duality factors cancel on Hom(V,V), a 1-d cut.
    J=lambda f:U.H*f.conjugate()*U
    check(J(I)==I and J(J(S.I*I))==S.I*I,'cut square on Hom(V,V) is +1 despite FS(V)=-1')
    check(U.H*U.T==-I,'underlying carrier square is -I')
    spsi=S.kronecker_product(U,U.conjugate());P=swap(2)
    kpsi=lambda t:spsi.H*P*kernel(t,2)
    rho=lambda t:S.kronecker_product(U.H,U.H)*P*t.conjugate()*P*S.kronecker_product(U,U)
    for i in range(4):
        for j in range(4):
            e=S.zeros(4);e[i,j]=1
            assert kpsi(rho(e))==kpsi(e).H,(i,j)
    check(True,'simple pseudoreal psi-seam Hermiticity intertwining on all 16 ambient matrix units')
    # Connected site O=1+V and a genuinely categorical Hermitian counterexample.
    W=S.diag(1,U);R=[S.diag(1,g) for g in G];P=swap(3)
    b=S.zeros(9,1);b[0]=1
    v=S.zeros(9,1);v[5]=1;v[7]=-1
    h=S.I*(b*v.H-v*b.H)
    check(h.H==h and all(S.kronecker_product(g,g)*h==h*S.kronecker_product(g,g) for g in R),'O=1+V: h is a categorical self-adjoint tile')
    rho=lambda t:S.kronecker_product(W.H,W.H)*P*t.conjugate()*P*S.kronecker_product(W,W)
    check(rho(h)==h,'non-pointed conjugate-dual reflection fixes h')
    kh=kernel(h,3)
    check(kh.H==-kh and kh!=S.zeros(9),'canonical braided seam gives non-Hermitian K(h)')
    check(W.H*W.T==S.diag(1,-1,-1),'connected site has mixed FS defect')
    check(all((W.H*W.T)*g==g*(W.H*W.T) for g in R),'defect equals central Q8 element on the physical carrier')
    print('FS(V)=-1; FS defect on O=1+V is diag(1,-1,-1); Hom(V,V) square +1')
    print('non-pointed witness rank(h)=',h.rank(),'rank(K)=',kh.rank(),'; K†=-K')


if __name__=='__main__':
    main()
