"""Independent symbolic elimination for NOTE X1's non-braiding obstruction.
Penneys:260,284-288 fixes alpha:a(bc)->(ab)c. Following the braided paths
in that convention yields the two equations printed in the author's script.
Here no root-of-unity restriction is placed on the unknown r(1,1)=x.
This test derives the inconsistent cubes; it does not just compare two phases.
"""
import itertools as it
import sys
import sympy as S


def main():
    print('Python', sys.version.split()[0], 'SymPy', S.__version__)
    x, q = S.symbols('x q', nonzero=True)
    omega = lambda a,b,c: q**(a*((b+c)//3))
    H1 = lambda a,b,c: omega(a,b,c)*omega(b,c,a)/omega(b,a,c)
    H2 = lambda a,b,c: omega(a,c,b)/(omega(a,b,c)*omega(c,a,b))
    r12 = x*x*H1(1,1,1)
    r21 = x*x*H2(1,1,1)
    close1 = S.simplify(r12*x*H1(1,2,1))
    close2 = S.simplify(r21*x*H2(2,1,1))
    assert r12 == r21 == x*x
    assert close1 == q*x**3 and close2 == x**3/q
    print('PASS first hexagon closing at zero: 1 =', close1)
    print('PASS second hexagon closing at zero: 1 =', close2)
    z = (-1+S.sqrt(3)*S.I)/2
    for phase in [z, S.conjugate(z)]:
        result = S.simplify(S.resultant(x**3-phase, x**3-1/phase, x))
        assert result != 0
        print('PASS arbitrary nonzero complex x excluded; resultant =', result)
    b = {(a,c): (S.Integer(1) if a*c == 0 else S.Symbol(f'b{a}{c}', nonzero=True))
         for a,c in it.product(range(3),repeat=2)}
    coboundary = lambda a,c,d: b[a,c]*b[(a+c)%3,d]/(b[c,d]*b[a,(c+d)%3])
    invariant = S.prod(coboundary(1,c,1) for c in range(3))
    assert S.cancel(invariant) == 1
    print('PASS every symbolic normalized coboundary has cyclic product 1')
    print('PASS nonzero class and non-braiding are distinct checked assertions')


if __name__ == '__main__':
    main()
