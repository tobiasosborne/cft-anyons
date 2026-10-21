"""Exact Virasoro Gram and one-block Ward probes through grade four.

Sources: Schottenloher 9.3--9.7 and LC-8. These do not construct the full
categorical carrier or check four-port sewing. All arithmetic is rational.
"""
from functools import lru_cache
import os
import sympy as s

MUTATION=os.environ.get("CFT_SMALL_MUTATION","")


def plus(*states):
    result={}
    for state in states:
        for word,value in state.items():
            result[word]=s.expand(result.get(word,0)+value)
            if result[word]==0: del result[word]
    return result


def times(value,state):
    return {w:s.expand(value*a) for w,a in state.items() if s.expand(value*a)!=0}


def partitions(grade,ceiling=None,minimum=1):
    if grade==0: return [()]
    ceiling=grade if ceiling is None else min(grade,ceiling)
    return [(k,)+tail for k in range(ceiling,minimum-1,-1)
            for tail in partitions(grade-k,k,minimum)]


class Virasoro:
    def __init__(self,c,h,vacuum=False):
        self.c,self.h=s.sympify(c),s.sympify(h)
        self.vacuum=vacuum
        assert not vacuum or self.h==0

    @lru_cache(None)
    def normalize(self,word):
        for i in range(len(word)-1):
            p,q=word[i:i+2]
            if p<q:
                swapped=word[:i]+(q,p)+word[i+2:]
                merged=word[:i]+(p+q,)+word[i+2:]
                return plus(self.normalize(swapped),times(q-p,self.normalize(merged)))
        if self.vacuum and word and word[-1]==1: return {}
        return {word:s.Integer(1)}

    def prepend(self,k,state):
        return plus(*(times(a,self.normalize((k,)+w)) for w,a in state.items()))

    @lru_cache(None)
    def act(self,n,word):
        if n<0: return self.normalize((-n,)+word)
        if n==0: return times(self.h+sum(word),{word:s.Integer(1)})
        if not word: return {}
        k,rest=word[0],word[1:]
        answer=plus(self.prepend(k,self.act(n,rest)),times(n+k,self.act(n-k,rest)))
        if n==k:
            factor=s.Rational(1,24) if MUTATION=="virasoro_central" else s.Rational(1,12)
            answer=plus(answer,times(factor*self.c*(n**3-n),{rest:s.Integer(1)}))
        return answer

    def apply(self,n,state):
        return plus(*(times(a,self.act(n,w)) for w,a in state.items()))

    def inner(self,left,right):
        state={right:s.Integer(1)}
        for n in left: state=self.apply(n,state)
        assert not any(w for w in state), (left,right,state)
        return state.get((),s.Integer(0))

    def basis(self,grade):
        assert 0<=grade<=4, "explicit laptop budget: grade <= 4"
        return partitions(grade,minimum=2 if self.vacuum else 1)

    def gram(self,grade):
        basis=self.basis(grade)
        return s.Matrix([[self.inner(a,b) for b in basis] for a in basis])


def exchange(c,h,max_grade=4):
    """Solve vacuum-channel coefficients by Gram pairing with Ward descendants."""
    assert 0<=max_grade<=4
    c,h=s.sympify(c),s.sympify(h)
    vac=Virasoro(c,0,vacuum=True)
    vectors={0:{():s.Integer(1)}}
    for grade in range(1,max_grade+1):
        basis=vac.basis(grade)
        if not basis:
            vectors[grade]={}
            continue
        rhs=[]
        for word in basis:
            remaining,value=grade,s.Integer(1)
            for n in word:
                weight=n+1 if MUTATION=="ward_weight" else n-1
                value*=remaining-n+weight*h
                remaining-=n
            rhs.append(value)
        coefficients=vac.gram(grade).inv()*s.Matrix(rhs)
        vectors[grade]={w:s.factor(a) for w,a in zip(basis,coefficients) if a!=0}
    return vectors


def null_selection(h_in,h_insert,h_out):
    h_in,h_insert,h_out=map(s.sympify,(h_in,h_insert,h_out))
    exponent=h_out-h_in-h_insert
    return s.expand(h_in+2*h_insert-h_out-exponent*(exponent-1))
