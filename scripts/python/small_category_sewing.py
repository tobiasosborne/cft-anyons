"""Exact categorical binary sewing probes; sources and gauges in (ah), LC-6.

The simple object x is not assigned an ordinary vector-space dimension.
All matrices act on fusion multiplicity spaces. No numerical rank tolerance.
"""
from itertools import product
import os
import sympy as s

R=s.symbols("r",positive=True)
MODULUS=R**4-R**2-1
MUTATION=os.environ.get("CFT_SMALL_MUTATION","")
if MUTATION not in ("","fib_product","semion_F","virasoro_central","ward_weight"):
    raise ValueError(f"Unknown mutation {MUTATION}")


def canon(value):
    """Reduce exactly in Q(r); symbolic coefficient parameters are permitted."""
    numerator,denominator=s.fraction(s.cancel(value))
    inverse=s.invert(denominator,MODULUS,R)
    return s.expand(s.rem(numerator*inverse,MODULUS,R))


class Category:
    def __init__(self,name):
        assert name in ("VecZ2","Semion","Fib")
        self.name=name

    def fusion(self,a,b):
        assert a in (0,1) and b in (0,1)
        if a==0: return (b,)
        if b==0: return (a,)
        return (0,1) if self.name=="Fib" else (0,)

    def F(self,a,b,c,total,left,right):
        if left not in self.fusion(a,b) or total not in self.fusion(left,c):
            return s.Integer(0)
        if right not in self.fusion(b,c) or total not in self.fusion(a,right):
            return s.Integer(0)
        if a==b==c==1:
            if self.name!="Fib":
                return s.Integer(-1 if self.name=="Semion" and MUTATION!="semion_F" else 1)
            if total==1:
                return {(0,0):R**-2,(0,1):R**-1,
                        (1,0):R**-1,(1,1):-R**-2}[left,right]
        return s.Integer(1)


def parameters(cat):
    if cat.name=="Fib":
        return R, (R if MUTATION=="fib_product" else 1/R)
    return s.Integer(1),s.Integer(0)


def multiplication(cat,alpha=None,beta=None):
    a0,b0=parameters(cat)
    alpha=a0 if alpha is None else s.sympify(alpha)
    beta=b0 if beta is None else s.sympify(beta)
    def m(a,b,c):
        if c not in cat.fusion(a,b): return s.Integer(0)
        if a==b==1: return alpha if c==0 else beta
        return s.Integer(1)
    return m


def assoc_residuals(cat,alpha=None,beta=None):
    m=multiplication(cat,alpha,beta)
    residuals=[]
    for a,b,c,total in product((0,1),repeat=4):
        left=[e for e in cat.fusion(a,b) if total in cat.fusion(e,c)]
        right=[f for f in cat.fusion(b,c) if total in cat.fusion(a,f)]
        for e in left:
            residual=m(a,b,e)*m(e,c,total)-sum(
                cat.F(a,b,c,total,e,f)*m(b,c,f)*m(a,f,total) for f in right)
            residuals.append(canon(residual))
    return residuals


def frobenius_blocks(cat,total,alpha=None,beta=None):
    """Both F-move presentations of (id*m)(m^dagger*id) and its adjoint.

    Tested candidates are real. For symbolic phase calculations LC-6 keeps
    conjugate alpha/beta separately; no complex coefficient is silently real.
    """
    m=multiplication(cat,alpha,beta)
    pairs=[(a,b) for a,b in product((0,1),repeat=2) if total in cat.fusion(a,b)]
    row=s.Matrix([[m(a,b,total) for a,b in pairs]])
    mmstar=row.T*row
    left=s.zeros(len(pairs));right=s.zeros(len(pairs))
    for j,(a,b) in enumerate(pairs):
        for i,(u,v) in enumerate(pairs):
            for k in (0,1):
                if a in cat.fusion(u,k) and v in cat.fusion(k,b):
                    left[i,j]+=m(u,k,a)*cat.F(u,k,b,total,a,v)*m(k,b,v)
                if b in cat.fusion(k,v) and u in cat.fusion(a,k):
                    right[i,j]+=m(k,v,b)*cat.F(a,k,v,total,u,b)*m(a,k,u)
    return left.applyfunc(canon),right.applyfunc(canon),mmstar.applyfunc(canon),row


def cohomology_data():
    """Low-degree maps and separability scalars in the LC-7 source bases."""
    alpha,beta=parameters(Category("Fib"))
    p,q,d=R**-2,R**-1,R**4
    d1=s.Matrix([2*alpha,beta])
    d2=s.Matrix([[0,0],[p-1,2*beta*q],[q,-2*beta*(p+1)]])
    h2=s.Matrix([[beta/d,beta/d]])
    separability=[(1+alpha**2)/d-1,alpha**2*p/d-1/d,
                  alpha*beta*q/d-beta/d,2+beta**2-d]
    return d1,d2,h2,separability
