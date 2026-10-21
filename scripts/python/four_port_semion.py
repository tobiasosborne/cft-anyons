"""Exact selected-lift semion four-port ansatz; LC-11 and CONVENTIONS (ai).

W=C^2 and its pair reflection are declared extra analytic data. The code
checks local functions/tensors, not a full field theory or OAR limit.
"""
from functools import lru_cache
from itertools import product
import os
import sympy as s

Z=s.symbols("z",real=True)
EPS=s.Matrix([[0,1],[-1,0]])
INDICES=list(product(range(2),repeat=4))
PAIRS=list(product(range(2),repeat=2))
MUTATION=os.environ.get("CFT_FOUR_MUTATION","")


def blocks():
    root=s.sqrt(Z*(1-Z))
    return s.Matrix([(1-Z/2)/root,Z/root])


def connection():
    return s.Matrix([[s.Rational(1,2),s.Rational(3,4)],[1,-s.Rational(1,2)]])


def channel_metric():
    return s.diag(1,s.Rational(3,4))


def tensor_data():
    e1=s.Matrix([EPS[a,b]*EPS[c,d] for a,b,c,d in INDICES])
    e2=s.Matrix([EPS[a,c]*EPS[b,d] for a,b,c,d in INDICES])
    e3=s.Matrix([EPS[a,d]*EPS[b,c] for a,b,c,d in INDICES])
    return e1,e2,e3,e1/2,(e1-2*e2)/4


def reflected_kernel(tensor):
    sign=1 if MUTATION=="reflection_sign" else -1
    return s.Matrix([[sign*sum(EPS[a,beta]*EPS[b,alpha]*tensor[INDICES.index((a,b,c,d))]
                               for a,b in PAIRS)
                      for c,d in PAIRS] for alpha,beta in PAIRS])


def bpz_residual(function):
    q=Z*(1-Z)
    return s.factor(s.cancel(s.diff(function,Z,2)+(1-2*Z)*s.diff(function,Z)/q-function/(4*q*q)))


def global_data():
    x=s.symbols("x1:5")
    q=s.prod(x[i]-x[j] for i in range(4) for j in range(i+1,4))
    log_derivatives=[-s.Rational(1,2)*sum(1/(x[i]-x[j]) for j in range(4) if j!=i)
                     for i in range(4)]
    numerators=[(x[0]-x[2])*(x[1]-x[3]),(x[0]-x[1])*(x[2]-x[3])]
    return x,q,log_derivatives,numerators


@lru_cache(None)
def global_null_residuals():
    """Differentiate first, then fix two points by affine covariance."""
    x,_,logd,numerators=global_data()
    residuals=[]
    for p in numerators:
        for i in range(4):
            second=s.diff(p,x[i],2)+2*logd[i]*s.diff(p,x[i])+(s.diff(logd[i],x[i])+logd[i]**2)*p
            others=sum(p/(4*(x[i]-x[j])**2)+(s.diff(p,x[j])+logd[j]*p)/(x[i]-x[j])
                       for j in range(4) if j!=i)
            residuals.append(s.factor(s.cancel((second-others).subs({x[1]:1,x[3]:0}))))
    return residuals


@lru_cache(None)
def global_ward_residuals():
    x,_,logd,numerators=global_data()
    residuals=[]
    for p in numerators:
        for n in (-1,0,1):
            residual=sum(x[i]**(n+1)*(s.diff(p,x[i])+logd[i]*p)
                         +(n+1)*s.Rational(1,4)*x[i]**n*p for i in range(4))
            residuals.append(s.factor(s.cancel(residual.subs({x[1]:1,x[3]:0}))))
    return residuals


@lru_cache(None)
def braid_checks():
    x,q,_,numerators=global_data()
    checks=[]
    for labels in INDICES:
        a,b,c,d=labels
        p=EPS[a,b]*EPS[c,d]*numerators[0]-EPS[a,c]*EPS[b,d]*numerators[1]
        for i in range(3):
            permuted=list(labels);permuted[i],permuted[i+1]=permuted[i+1],permuted[i]
            aa,bb,cc,dd=permuted
            new=EPS[aa,bb]*EPS[cc,dd]*numerators[0]-EPS[aa,cc]*EPS[bb,dd]*numerators[1]
            new=new.subs({x[i]:x[i+1],x[i+1]:x[i]},simultaneous=True)
            checks.append(s.expand(new+p)==0)
    for i in range(3):
        checks.append(s.expand(q.subs({x[i]:x[i+1],x[i+1]:x[i]},simultaneous=True)+q)==0)
    checks.extend([s.simplify(-1/s.I)==s.I,EPS*EPS==-s.eye(2)])
    return checks


@lru_cache(None)
def multiplicity_kernels(dim):
    """Direct contractions for the declared finite primary-multiplicity ansatz."""
    assert dim in (2,4), "finite check budget; general dimension is proved in LC-13"
    eps=s.diag(*([EPS]*(dim//2)))
    pairs=list(product(range(dim),repeat=2))
    flat=s.Matrix([eps[a,b] for a,b in pairs])
    projection=flat*flat.T/dim
    sign=1 if MUTATION=="reflection_sign" else -1
    k0=s.zeros(dim*dim);k1=s.zeros(dim*dim)
    for row,(alpha,beta) in enumerate(pairs):
        for col,(c,d) in enumerate(pairs):
            for a,b in pairs:
                contraction=sign*eps[a,beta]*eps[b,alpha]
                a0=eps[a,b]*eps[c,d]/dim
                a1=-(eps[a,b]*eps[c,d]/2+eps[a,d]*eps[b,c])/dim
                k0[row,col]+=contraction*a0
                k1[row,col]+=contraction*a1
    return projection,k0,k1,flat
