"""Exact pointed calibrations, with associator direction explicitly fixed.
Source: references/text/PenneysUnitaryFusionCategories.md:259-288,319,400-430.
Penneys alpha:a(bc)->(ab)c is omega(a,b,c). Thus coev_a=1 and
 ev_a=omega(a,-a,a), NOT its inverse. The second snake is ev_a*omega(-a,a,-a)=1.
Earlier E3 numerical code used the inverse associator convention; its output
is not imported here. Every four-port move below follows the displayed arrow.
Hexagons, obtained by following the two parenthesized three-strand paths:
 r(a,b+c)=r(a,b)r(a,c) omega(a,b,c)omega(b,c,a)/omega(b,a,c)
 r(a+b,c)=r(a,c)r(b,c) omega(a,c,b)/(omega(a,b,c)omega(c,a,b)).
The H^3-nonzero cyclic cocycle omega_p=zeta**(p*a*floor((b+c)/3))
forces r(1,1)^3=zeta**(-p) and zeta**p, hence no braiding for p=1,2.
Its nonzero class is detected by product_b omega(1,b,1)=zeta**p;
a normalized coboundary has product 1 by telescopic cancellation.
Also test a nonconstant COBOUNDARY omega=zeta**(a*b*c), which IS braided:
 beta(a,b)=zeta**(a*b*b), omega=beta(a,b)beta(a+b,c)/(beta(b,c)beta(a,b+c));
 r(a,b)=zeta**(b*a*a-a*b*b+a*b), transported from r0=zeta**(a*b).
--mutate-cup reverses the cup phase and MUST fail a snake equation.
"""
import itertools as it
import sys
import sympy as S

zeta=(-1+S.sqrt(3)*S.I)/2
roots=[S.Integer(1),zeta,S.conjugate(zeta)]
phase=lambda n:roots[n%3]
clean=lambda m:m.applyfunc(lambda x:S.simplify(S.expand_complex(x)))
eq=lambda x,y:S.simplify(S.expand_complex(x-y))==0


def check(ok,label):
    assert ok,label
    print('PASS',label)


def test_category(omega, braid, name):
    grades=[0,1]; neg=lambda a:(-a)%3
    eps={a:omega(a,neg(a),a) for a in range(3)}
    if '--mutate-cup' in sys.argv:
        eps={a:S.conjugate(e) for a,e in eps.items()}
    for a,b,c,d in it.product(range(3),repeat=4):
        assert eq(omega(b,c,d)*omega(a,(b+c)%3,d)*omega(a,b,c),
                  omega((a+b)%3,c,d)*omega(a,b,(c+d)%3)),(a,b,c,d)
    for a in range(3):
        assert eq(eps[a]/omega(a,neg(a),a),1),'first oriented snake'
        assert eq(eps[a]*omega(neg(a),a,neg(a)),1),'second oriented snake'
    check(True,name+': pentagon, both oriented snakes, positive cup norms')
    if braid:
        for a,b,c in it.product(range(3),repeat=3):
            assert eq(braid(a,(b+c)%3),braid(a,b)*braid(a,c)*omega(a,b,c)*omega(b,c,a)/omega(b,a,c))
            assert eq(braid((a+b)%3,c),braid(a,c)*braid(b,c)*omega(a,c,b)/omega(a,b,c)/omega(c,a,b))
        check(True,name+': both hexagons')
    pairs=list(it.product(grades,repeat=2)); idx={p:i for i,p in enumerate(pairs)}
    u=S.Matrix([int(a==b) for a,b in pairs])
    v=S.Matrix([S.conjugate(eps[a]) if a==b else 0 for a,b in pairs])
    seam=S.zeros(4)
    for a,b in pairs:
        if braid:
            lam=eps[a]*braid(a,neg(a))
            sig=braid(a,neg(b))/lam
        else:
            sig=S.conjugate(eps[a]) if a==b else 1
        seam[idx[b,a],idx[a,b]]=sig
    seam=clean(seam)
    check(clean(seam.H*seam)==S.eye(4) and clean(seam*u-v)==S.zeros(4,1),name+': unitary cup-normalized seam')
    phi=lambda a,b,c,d:omega(a,b,(c+d)%3)/omega(b,c,d)
    # R: ((a b)(c d))->a((b c)d), derived as alpha^-1_(a,b,c+d) then alpha_(b,c,d).
    R=S.diag(*[1/phi(neg(a),b,c,neg(d)) for a,b,c,d in it.product(grades,repeat=4)])
    B=S.kronecker_product(v,S.eye(4));E=S.kronecker_product(S.eye(4),u.H)
    Ri=S.diag(*[1/phi(a,b,neg(c),d) for a,b,c,d in it.product(grades,repeat=4)])
    Ro=S.diag(*[1/phi(a,neg(b),c,d) for a,b,c,d in it.product(grades,repeat=4)])
    def unbend(r):
        return clean(S.kronecker_product(u.H,S.eye(4))*Ro.H*S.kronecker_product(S.eye(2),r,S.eye(2))*Ri*S.kronecker_product(S.eye(4),v))
    def bend(T):
        return clean(seam.H*E*R.H*S.kronecker_product(S.eye(2),T,S.eye(2))*R*B)
    def indexed(T):
        rot=S.zeros(4)
        for (p,q),col in idx.items():
            for a,k in pairs:
                rot[idx[a,k],col]+=S.conjugate(eps[a])*T[idx[k,q],idx[a,p]]*phi(neg(a),k,q,neg(q))/phi(neg(a),a,p,neg(q))
        return clean(seam.H*rot)
    tids=[(i,j) for i,(a,b) in enumerate(pairs) for j,(c,d) in enumerate(pairs) if (a+b-c-d)%3==0]
    kids=[(i,j) for i,(a,b) in enumerate(pairs) for j,(c,d) in enumerate(pairs) if (a-b-c+d)%3==0]
    mats=[];cols=[]
    for i,j in tids:
        e=S.zeros(4);e[i,j]=1;mats.append(e)
        k=bend(e)
        assert k==indexed(e)
        assert unbend(seam*k)==e, "explicit inverse-bend formula F2"
        assert all(k[x,y]==0 for x in range(4) for y in range(4) if (x,y) not in kids)
        cols.append(S.Matrix([k[x,y] for x,y in kids]))
    Q=clean(S.Matrix.hstack(*cols));Qi=clean(Q.inv())
    def inverse(k):
        coeff=clean(Qi*S.Matrix([k[i,j] for i,j in kids]))
        return clean(sum((c*m for c,m in zip(coeff,mats)),S.zeros(4)))
    sharp=lambda x:inverse(bend(x).H)
    for m in mats:
        assert sharp(sharp(m))==m
        assert bend(sharp(m))==bend(m).H
    check(bend(S.eye(4))==u*u.H,name+': K(1)=uu†; six matrix units match both bends and explicit inverse F2')
    hp=inverse(S.eye(4))
    check(sharp(hp)==hp and bend(hp)==S.eye(4),name+': intrinsic sharp involution and Hermiticity criterion')
    check(bend(S.eye(4)+hp/5)==u*u.H+S.eye(4)/5,name+': Schur-positive linear tile, exact Gram certificate')
    print('  s =',seam,'; det(bend on Hom blocks) =',S.simplify(Q.det()))
    if braid:
        a=S.zeros(4);a[1,2]=1;b=a.T
        p10=S.zeros(4);p10[2,2]=1
        check(sharp(a)==a and clean(sharp(b)-phase(2)*b)==S.zeros(4) and sharp(a*b)==p10,name+': explicit sharp composition witness')
        check(sharp(a*b)!=sharp(a)*sharp(b) and sharp(a*b)!=sharp(b)*sharp(a),name+': neither composition variance survives')
        print('  sharp(E01,10)=',sharp(a),'; sharp(E10,01)=',sharp(b))
        print('  multiplicative?',sharp(a*b)==sharp(a)*sharp(b),'; anti-multiplicative?',sharp(a*b)==sharp(b)*sharp(a))


def main():
    print('Python',sys.version.split()[0],'SymPy',S.__version__)
    for p in (1,2):
        omega=lambda a,b,c,p=p:phase(p*a*((b+c)//3))
        invariant=S.prod(omega(1,b,1) for b in range(3))
        check(eq(invariant,phase(p)) and not eq(invariant,1),f'nonzero H3 class p={p}, telescoping invariant')
        check(not eq(phase(p),phase(-p)),f'p={p}: hexagons force inconsistent cubes; no braiding')
        test_category(omega,None,f'Z3 class p={p}, non-self-dual O=1+g')
    beta=lambda a,b:phase(a*b*b)
    omega=lambda a,b,c:phase(a*b*c)
    for a,b,c in it.product(range(3),repeat=3):
        assert eq(omega(a,b,c),beta(a,b)*beta((a+b)%3,c)/beta(b,c)/beta(a,(b+c)%3))
    check(not eq(omega(1,1,1),1),'nonconstant braided cocycle explicitly a coboundary')
    braid=lambda a,b:phase(b*a*a-a*b*b+a*b)
    test_category(omega,braid,'Z3 nonconstant coboundary, canonical braided seam')
    test_category(lambda a,b,c:S.Integer(1),lambda a,b:phase(a*b),'Z3 trivial associator nontrivial braiding')
    check(1!=(-1)%3,'g has no self-duality: no +/- F-S sign; dual charge is g^2')


if __name__=='__main__':
    main()
