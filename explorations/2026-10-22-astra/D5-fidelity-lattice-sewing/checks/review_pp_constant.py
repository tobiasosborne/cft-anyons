"""Reviewer check (REVIEW.md, D5-F <1>1): Pimsner-Popa constants of finite
type-I inclusions are NOT commutant-invariant.

PP constant lambda(E) = best lambda with E(x) >= lambda x for all x >= 0.
Inclusion (i):  C*1 subset M_n, E = normalized trace.            lambda = 1/n
Inclusion (ii): its commutant on C^n (x) C^n:  1 (x) M_n subset M_n (x) M_n,
                E = tr (x) id.                                       lambda = 1/n^2
For rank-one x=|psi><psi| the binding constraint is
lambda <= 1 / <psi, E(x)^+ psi>; a maximally entangled psi attains 1/n^2 in (ii).
Exact SymPy, n = 2 and n = 3. No category data used.
"""
import sympy as s


def psd(m):
    return all(ev >= 0 for ev in s.Matrix(m).eigenvals(multiple=True))


def case_scalar(n):
    # E(x) = tr(x)/n * 1.  Rank-one projector p: E(p) = 1/n.  lambda = 1/n.
    p = s.zeros(n); p[0, 0] = 1
    lam = s.Rational(1, n)
    assert psd(s.eye(n) * p.trace() / n - lam * p), "1/n must be admissible on p"
    assert not psd(s.eye(n) * p.trace() / n - (lam + s.Rational(1, 100)) * p)
    # admissible on all positives: tr(x)/n >= ||x||/n >= x/n  (eigenvalue argument)
    return lam


def ptrace_first(x, n):
    # (tr (x) id)(x), normalized trace on the first factor, returned as 1 (x) y
    y = s.zeros(n)
    for i in range(n):
        for j in range(n):
            y[i, j] = sum(x[a*n+i, a*n+j] for a in range(n)) / n
    return s.kronecker_product(s.eye(n), y)


def case_commutant(n):
    psi = s.zeros(n*n, 1)
    for a in range(n):
        psi[a*n+a] = 1
    psi = psi / s.sqrt(n)
    x = psi * psi.H
    ex = ptrace_first(x, n)
    lam = s.Rational(1, n*n)
    assert psd(ex - lam * x), "1/n^2 admissible on the entangled witness"
    assert not psd(ex - (s.Rational(1, n) ) * x), "1/n fails: commutant constant is smaller"
    return lam


if __name__ == "__main__":
    for n in (2, 3):
        a, b = case_scalar(n), case_commutant(n)
        print(f"n={n}: PP(C<M_n)={a} -> index {1/a};  PP(commutant)={b} -> index {1/b}")
        assert 1/a != 1/b
    print("PP-constant index is not commutant-invariant for finite type I inclusions.")
