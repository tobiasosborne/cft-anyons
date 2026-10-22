"""Exact checks for NOTE (1)-(6); run from the repository root.

No model data are imported. Unit-multiplicity witnesses exist in every C.
PenneysUnitaryFusionCategories.md:398-430,1010-1030 supplies typed duality.
Ordinary tensor-coordinate cups use the canonical basis, squared norm n.
"""
import sys
import sympy as S


def kernel(tensor, n):
    """K[(i,k),(j,l)] = T[(i,l),(k,j)] for the specified flip pairing."""
    if '--mutate-reshuffle' in sys.argv:
        return S.Matrix(n*n, n*n, lambda a, b:
                        tensor[(a//n)*n+b//n, (a % n)*n+b % n])
    return S.Matrix(n*n, n*n, lambda a, b:
                    tensor[(a//n)*n+b % n, (a % n)*n+b//n])


def swap(n):
    return S.Matrix(n*n, n*n, lambda i, j:
                    int(i//n == j % n and i % n == j//n))


def cup(n):
    return S.Matrix(n*n, 1, lambda i, j: int(i//n == i % n))


def bent_kernel(tensor, n):
    eye = S.eye(n)
    return (swap(n).H * S.kronecker_product(eye, eye, cup(n).H)
            * S.kronecker_product(eye, tensor, eye)
            * S.kronecker_product(cup(n), eye, eye))


def run():
    n = 2
    for p in range(4):
        for q in range(4):
            e = S.zeros(4)
            e[p, q] = 1
            assert kernel(e, n) == bent_kernel(e, n), (p, q)
    print("PASS 16 matrix units: index reshuffle = typed cup/cap composition")
    z = S.diag(1, -1)
    h = -S.kronecker_product(z, z)
    zvec = S.Matrix([1, 0, 0, -1])
    t = S.Rational(1, 3)
    gate = S.eye(4) + t*h
    assert min(gate.eigenvals()) > 0
    assert (zvec.H*kernel(gate, 2)*zvec)[0] == -4*t
    exact = S.diag(S.exp(-t), S.exp(t), S.exp(t), S.exp(-t))
    assert S.simplify((zvec.H*kernel(exact, 2)*zvec)[0]
                      + 4*S.sinh(t)) == 0
    print("PASS self-adjoint counterexample: <Z,K(1+t h)Z>=-4t; exact=-4 sinh(t)")
    a = S.Matrix([[0, 1], [0, 0]])
    h = S.kronecker_product(a, a.H)
    assert h != h.H and h*h == S.zeros(4)
    avec = S.Matrix([0, 1, 0, 0])
    assert kernel(S.eye(4)+t*h, 2) == cup(2)*cup(2).H+t*avec*avec.H
    print("PASS non-self-adjoint counterexample: exact exponential has spatial Gram factorization")
    # Local h coefficient positivity is not necessary, even for linear tiles.
    assert kernel(-S.eye(4), 2) == -cup(2)*cup(2).H
    assert kernel(S.eye(4)-t*S.eye(4), 2) == (1-t)*cup(2)*cup(2).H
    # A positive semidefinite spatial transfer can have a genuine kernel.
    assert kernel(S.eye(4), 2).rank() == 1
    assert kernel(S.eye(4), 2).eigenvals() == {S.Integer(2): 1, S.Integer(0): 3}
    print("PASS identity offset and non-injective positive transfer obstructions")
    # Positive tangent compression is insufficient for the linear pencil.
    pencil = S.Matrix([[1, 0, t], [0, t, 0], [t, 0, 0]])
    assert pencil.det() == -t**3
    assert pencil[1:, 1:] == S.diag(t, 0)
    print("PASS small-step range obstruction: C>=0 but b outside Ran(C), det=-t^3")
    # First-order identity and order-three opposite-sweep coefficient.
    x = S.Matrix([[0, 1], [1, 0]])
    d = S.symbols('d')
    def trunc_exp(m):
        return sum((d**k*m**k/S.factorial(k) for k in range(4)), S.zeros(2))
    comm = lambda a, b: a*b-b*a
    u, v = trunc_exp(x)*trunc_exp(z), trunc_exp(z)*trunc_exp(x)
    c = comm(u, v).applyfunc(S.expand)
    assert all(c.applyfunc(lambda e: e.coeff(d, k)) == S.zeros(2) for k in range(3))
    assert c.applyfunc(lambda e: e.coeff(d, 3)) == -comm(x+z, comm(x, z))
    print("PASS commutator: linear and quadratic terms vanish; cubic is -[E+O,[E,O]]")
    # Explicit finite OS quotient and a null vector preserved by tau.
    q0 = S.diag(1, 2, 0)
    tau = S.Matrix([[1, 0, 0], [0, S.Rational(1, 2), 0], [3, 4, 5]])
    q1 = q0*tau
    assert q1 == q1.H and q1 == S.diag(1, 1, 0)
    assert q0-q1 == S.diag(0, 1, 0)
    assert q0*tau*S.Matrix([0, 0, 1]) == S.zeros(3, 1)
    print("PASS finite OS: 0<=q1<=q0 and null descent; quotient T=diag(1,1/2)")


if __name__ == '__main__':
    print('Python', sys.version.split()[0], 'SymPy', S.__version__)
    run()
