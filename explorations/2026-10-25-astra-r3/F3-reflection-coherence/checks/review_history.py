"""Independent all-insertion OS forms for the whole identity history, NOTE I.
Source grammar: CA-86:61-93; pairing: CA-80:70-95; finite OS: CA-92:181-192.
Conventions: x-major configurations; unnormalised positive torus sum; unit
multiplicity site; reflections x -> N-1-x and r -> M-1-r; full half-history
indicator functions. No imported transfer matrices or author code.
--mutate-history removes the vertical constraints of column zero; it must
fail the temporal OS-form invariant. Largest enumeration: 2^16 histories.
"""
import itertools as it
import sys
import sympy as S


def check(ok, label):
    assert ok, label
    print('PASS', label)


def base_index(word, d):
    result = 0
    for letter in word:
        result = d*result+letter
    return result


def forms(d, N, M, mutation):
    V = d**(N*M//2)
    qs, qt = S.zeros(V), S.zeros(V)
    for flat in it.product(range(d), repeat=N*M):
        val = lambda x, r: flat[x*M+r]
        weight = all(val(x, r) == val(x, (r+1) % M)
                     for x in range(N) for r in range(M)
                     if not (mutation and x == 0))
        if not weight:
            continue
        plus_s = [val(x, r) for x in range(N//2) for r in range(M)]
        minus_s = [val(N-1-x, r) for x in range(N//2) for r in range(M)]
        plus_t = [val(x, r) for x in range(N) for r in range(M//2)]
        minus_t = [val(x, M-1-r) for x in range(N) for r in range(M//2)]
        qs[base_index(plus_s, d), base_index(minus_s, d)] += 1
        qt[base_index(plus_t, d), base_index(minus_t, d)] += 1
    vs = S.Matrix([int(all(word[x*M+r] == word[x*M] for x in range(N//2)
                          for r in range(M)))
                   for word in it.product(range(d), repeat=N*M//2)])
    dt = [int(all(word[x*(M//2)+r] == word[x*(M//2)] for x in range(N)
                  for r in range(M//2)))
          for word in it.product(range(d), repeat=N*M//2)]
    return qs, qt, vs, S.diag(*dt)


def main():
    print('Python', sys.version.split()[0], 'SymPy', S.__version__)
    for d, N, M in [(2, 2, 2), (2, 4, 2), (2, 4, 4)]:
        qs, qt, vs, dt = forms(d, N, M, '--mutate-history' in sys.argv)
        check(qt == dt, 'temporal OS form from exact contraction')
        check(qs == vs*vs.T, 'spatial OS form from exact contraction')
        # These exact factorizations prove PSD and compute ranks without
        # diagonalising the 256-by-256 case or using numeric tolerances.
        rs = int(any(vs))
        rt = sum(dt.diagonal())
        check(rs == 1 and rt == d**N, 'distinct OS quotient dimensions')
        check(sum(qs) == sum(qt) == d**N, 'same closed history contraction')
        column = list(it.product(range(d), repeat=M))
        v = S.Matrix([int(all(s[r] == s[(r+1) % M] for r in range(M)))
                      for s in column])
        Tx = v*v.T
        Tt = S.eye(d**N)
        check(S.trace(Tx**N) == S.trace(Tt**M) == d**N,
              'independent column transfer reproduces enumerated partition sum')
        print('d,N,M =', (d, N, M), '; OS ranks =', (rt, rs),
              '; raw transfer dimensions =', (Tt.rows, Tx.rows))
    print('PASS both RP forms, their actual radicals, and rank obstruction')


if __name__ == '__main__':
    main()
