#!/usr/bin/env python3
"""Independent raw-square oracle for NOTE T3, with complex reactions.

No imports from author code. The matrix is assembled by applying each local
square functional to every spectator configuration and only then compressing.
Sources: CONVENTIONS (aw); NOTE.md:53-57, 628-739 (T3); CA-94:80-89.
Calibration only: scalar fibre (Vec, X=1); any/open, L0+declared data,
off-ladder z=2. No assertion of general-category fidelity or infinite limit.
Box normalization is eps^(n/2); inner product is linear in slot two.
Parameters deliberately differ from the original tests: t=1.7, mu=.8,
lambda=.6, kappa=1.2, b=.5+.4i, v=-.3+.7i, nonconstant Neumann u1.
Run: OPENBLAS_NUM_THREADS=1 python3 -B this_file.py
"""
from itertools import combinations
import hashlib
from pathlib import Path
import sys
from time import perf_counter
import numpy as np
import scipy
import scipy.sparse as sp

T, MU, LAM, KAP = 1.7, .8, .6, 1.2
B, V = .5+.4j, -.3+.7j
BETA, NU = LAM*B, KAP*V
QB, GAMMA = LAM*abs(B)**2, KAP*abs(V)**2


def square_matrix(L, wrong_dagger=False):
    eps = 1/L
    configs = [()]+[(j,) for j in range(L)]+list(combinations(range(L), 2))
    ix = {c: i for i, c in enumerate(configs)}
    rows, cols, vals = [], [], []
    def add_square(terms, weight):
        # Missing output occupations are zero inputs to this square, not
        # a reason to discard its surviving lower diagonal.
        terms = [(ix[c], z) for c, z in terms if c in ix]
        for i, ci in terms:
            for k, ck in terms:
                rows.append(i); cols.append(k)
                vals.append(weight*(ci if wrong_dagger else np.conj(ci))*ck)
    for j in range(L-1):
        others = [k for k in range(L) if k not in (j,j+1)]
        for n in range(3):
            for spectators in combinations(others, n):
                left = tuple(sorted(spectators+(j,)))
                right = tuple(sorted(spectators+(j+1,)))
                pair = tuple(sorted(spectators+(j,j+1)))
                add_square([(left, 1), (right, -1)], T/eps**2)
                add_square([(pair, 1), (left, -np.sqrt(eps)*B)], LAM/eps)
                add_square([(pair, 1), (spectators, -eps*V)], KAP/eps)
    H = sp.coo_matrix((vals,(rows,cols)),shape=(len(configs),len(configs))).tocsr()
    adjacent = np.array([len(c)==2 and c[1]==c[0]+1 for c in configs])
    H += sp.diags([MU*len(c) for c in configs])
    H -= sp.diags((LAM+KAP)*adjacent/eps)
    return H, configs, adjacent


def u1(x):
    return .8+.2*np.cos(np.pi*x)+1j*(.3+.1*np.cos(2*np.pi*x))


def u1dd(x):
    return -.2*np.pi**2*np.cos(np.pi*x)-.4j*np.pi**2*np.cos(2*np.pi*x)


def bump(x, radius, center=0):
    z = (np.asarray(x)-center)/radius
    p = np.maximum(1-z*z, 0)
    return p**6, -12*z*p**5/radius, 12*p**4*(11*z*z-1)/radius**2


def upper(x,y):
    s, r = (x+y)/2, y-x
    g, _, gss = bump(s, .25, .5)
    h, hr, hrr = bump(r, .4)
    phase = 1+.3j
    return phase*r*g*h, phase*(.5*r*gss*h+2*g*(2*hr+r*hrr)), phase*g*h, phase*g


def vectors(L, configs, alpha, mutation=None):
    eps, u0 = 1/L, .6-.2j
    corrected = np.zeros(len(configs),complex)
    base, source = corrected.copy(), corrected.copy()
    corrected[0]=base[0]=u0; source[0]=GAMMA*u0
    for k,c in enumerate(configs[1:],1):
        x=(c[0]+.5)*eps
        if len(c)==1:
            corrected[k]=base[k]=np.sqrt(eps)*u1(x)
            source[k]=np.sqrt(eps)*(-T*u1dd(x)+(MU+QB+GAMMA)*u1(x))
            continue
        y=(c[1]+.5)*eps
        value, lap, G, g = upper(x,y)
        Sbar=BETA*(u1(x)+u1(y))/2+NU*u0
        mesh = 0 if mutation=='omit mesh correction' else eps
        f=value+(2*T/alpha-mesh)*G+Sbar/alpha
        if c[1]==c[0]+1:
            S=BETA*u1((x+y)/2)+NU*u0
            sign=-1 if mutation=='reverse outward flux' else 1
            f=(sign*2*T*g+S)/alpha
        corrected[k]=eps*f; base[k]=eps*value
        source[k]=eps*(-T*lap+(2*MU+2*QB+GAMMA)*value)
    return corrected,base,source


def main():
    started=perf_counter()
    print('COMMAND: OPENBLAS_NUM_THREADS=1 python3 -B '+str(Path(__file__)))
    print('VERSIONS',sys.version.split()[0],'NumPy',np.__version__,'SciPy',scipy.__version__)
    print('SHA256',hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    print('PARAMETERS',dict(t=T,mu=MU,lam=LAM,kap=KAP,b=B,v=V))
    small,_,_=square_matrix(4)
    assert sp.linalg.norm(small-small.conj().T)<1e-12
    mutant,_,_=square_matrix(4,wrong_dagger=True)
    try:
        assert sp.linalg.norm(mutant-mutant.conj().T)<1e-12, 'ordinary transpose lost the dagger'
    except AssertionError as exc:
        print('RED CAUGHT',exc,'Hermitian defect=',sp.linalg.norm(mutant-mutant.conj().T))
    else:
        raise AssertionError('dagger mutation escaped')
    records={name:[] for name in ('negative -4tL','slow negative -sqrtL','slow positive sqrtL',
                                 'deep alternating','reverse outward flux','omit mesh correction')}
    for L in (24,49,96):
        H,configs,adj=square_matrix(L)
        assert sp.linalg.norm(H-H.conj().T)<1e-10
        for name in records:
            mutation=name if name in ('reverse outward flux','omit mesh correction') else None
            if name=='negative -4tL': alpha=-4*T*L
            elif name=='slow negative -sqrtL': alpha=-np.sqrt(L)
            elif name=='slow positive sqrtL': alpha=np.sqrt(L)
            else: alpha=(-1.)**L*L**5 if name=='deep alternating' else -float(L)**5
            v,base,source=vectors(L,configs,alpha,mutation)
            residual=H@v+(alpha*L*adj)*v-source
            err=float(np.linalg.norm(residual)); records[name].append(err)
            print(f'{name:25s} L={L:3d} alpha={alpha:+.6e} residual={err:.9e} '
                  f'correction={np.linalg.norm(v-base):.9e} endpoint_rows='
                  f'{abs(residual[configs.index((0,1))]):.3e},'
                  f'{abs(residual[configs.index((L-2,L-1))]):.3e}')
    for name,errors in records.items():
        if name in ('reverse outward flux','omit mesh correction'):
            try:
                assert errors[-1]<.8*errors[0], 'graph-core regression violates residual decrease'
            except AssertionError as exc:
                print('RED CAUGHT',name,errors,exc)
            else:
                raise AssertionError(name+' escaped')
        else:
            assert errors[-1]<.8*errors[0], (name,errors)
    print(f'ALL GREEN: complex reaction and nonconstant-source core calibration; seconds={perf_counter()-started:.3f}')


if __name__=='__main__':
    main()
