"""Exact quotient-Gram sewing and scalar Virasoro four-port coefficients.

Sources/claims: LC-9, LC-10, LC-12; CONVENTIONS (ai). Scalar block probes
are conditional on a highest-weight submodule, not whole category sectors.
"""
import os
import sympy as s
from small_category_stress import Virasoro

MUTATION=os.environ.get("CFT_FOUR_MUTATION","")
if MUTATION not in ("","dual_conjugation","null_drop","metric_sign","reflection_sign","block_weight"):
    raise ValueError(f"unknown four-port mutation: {MUTATION}")


def sew_quotient(gram,left,right):
    """left is a row covector, right its separately supplied sewing column.

    Descent is required on both sides; a pseudoinverse cannot silently fix
    an incompatible coupling to a null state. No positivity theorem here.
    """
    assert gram==gram.conjugate().T, "Hermitian sewing convention required"
    assert left.shape==(1,gram.rows) and right.shape==(gram.rows,1)
    nulls=gram.nullspace()
    compatible=all(s.simplify((left*n)[0])==0 and
                   s.simplify((n.conjugate().T*right)[0])==0 for n in nulls)
    if MUTATION=="null_drop" and not compatible:
        return s.simplify((left*gram.pinv()*right)[0])
    assert compatible, "sewing covectors do not annihilate the Gram radical"
    solution,parameters=gram.gauss_jordan_solve(right)
    solution=solution.subs({p:0 for p in parameters})
    assert gram*solution==right
    return s.factor((left*solution)[0])


def dual_crossing(f_cat):
    return f_cat if MUTATION=="dual_conjugation" else f_cat.inv().T


def inverse_metric_derivative(gram,change):
    sign=1 if MUTATION=="metric_sign" else -1
    return sign*gram.inv()*change*gram.inv()


def ward_pairing(word,internal,external):
    internal,external=s.sympify(internal),s.sympify(external)
    remaining,value=sum(word),s.Integer(1)
    for n in word:
        remaining-=n
        weight=n+1 if MUTATION=="block_weight" else n-1
        value*=internal+remaining+weight*external
    return s.expand(value)


def block_coefficients(c,h,internal,max_grade=4):
    assert 0<=max_grade<=4, "declared exact descendant budget is grade four"
    rep=Virasoro(c,internal,vacuum=(s.sympify(internal)==0))
    coefficients=[]
    for grade in range(max_grade+1):
        basis=rep.basis(grade)
        if not basis:
            coefficients.append(s.Integer(0))
            continue
        gram=rep.gram(grade)
        rho=s.Matrix([ward_pairing(word,internal,h) for word in basis])
        coefficients.append(sew_quotient(gram,rho.T,rho))
    return coefficients
