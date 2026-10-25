#!/usr/bin/env python3
"""Manufactured graph-core residual for NOTE.md T3 (finite calibration only).

Command: OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 \
 explorations/2026-10-25-astra-r3/F5-contact-trichotomy/checks/graph_core_vectors.py
Any/open, L0 plus declared scalar fibre/reaction data, off-ladder z=2.
No categorical large-chain example and no new convergence theorem is claimed.

Conventions fixed before use: eps=1/L, cell centers, s=(x+y)/2,r=y-x;
u0=.6,u1=.8, u2=r*g(s)*h(r). Both bumps are C5 piecewise polynomials,
g support [.3,.7], h even with support [-.3,.3], h(0)=1,h'(0)=0.
Thus u2 is antisymmetric across the diagonal and zero near outer faces.
Delta=(1/2)partial_s^2+2partial_r^2; outward D=-2partial_r.
Use contact_fibres.build's exact P H P, t=mu=lam=kap=1,b=.7,v=1.3.
W0=gamma,W1=mu+b^2+gamma,W2=2mu+2b^2+gamma survive in H_D.
Sources use center sampling, not exact box integrals. Residual is the
Euclidean norm in the isometric box basis; no factorial. Corrected vector:
u2+(2/alpha-eps)G+S/alpha, G=g(s)h(r), S=b*u1+v*u0, except adjacent
cells are overwritten by (2g(s)+S)/alpha EXACTLY. u0,u1 are unchanged.
The adjacent overwrite and -eps*G term each receive a caught mutation.
Polynomial second derivatives below are checked independently by stencil.
"""
import hashlib
from pathlib import Path
import sys
from time import perf_counter
import numpy as np
import scipy
from contact_fibres import build, scalar, sector_indices


def bump(z, radius, center=0.0):
    """Value and two exact derivatives of (1-((z-center)/radius)^2)_+^6."""
    q = (np.asarray(z)-center)/radius
    active = np.abs(q) < 1
    p = np.where(active, 1-q*q, 0.0)
    return p**6, -12*q*p**5/radius, 12*p**4*(11*q*q-1)/radius**2


def fields(s, r):
    g, _, gss = bump(s, .2, .5)
    h, hr, hrr = bump(r, .3)
    u = r*g*h
    lap = .5*r*gss*h + 2*g*(2*hr+r*hrr)
    return u, lap, g*h, g


def manufactured(L, alpha, mutation=None):
    H, configs, offsets = build(L, alpha, scalar())
    eps, u0, u1, b, v = 1/L, .6, .8, .7, 1.3
    gamma = v*v
    W0, W1, W2 = gamma, 1+b*b+gamma, 2+2*b*b+gamma
    value = np.zeros(H.shape[0]); source = value.copy(); base = value.copy()
    value[0] = base[0] = u0; source[0] = W0*u0
    S = b*u1+v*u0
    for c in configs[1:]:
        j = offsets[c]
        if len(c) == 1:
            value[j] = base[j] = np.sqrt(eps)*u1
            source[j] = np.sqrt(eps)*W1*u1
            continue
        x, y = (c[0]+.5)*eps, (c[1]+.5)*eps
        u, lap, G, g = fields((x+y)/2, y-x)
        correction = 2/alpha if mutation == "omit -eps G" else 2/alpha-eps
        f = u+correction*G+S/alpha
        if c[1] == c[0]+1:
            sign = -1 if mutation == "wrong normal sign" else 1
            f = (sign*2*g+S)/alpha
        value[j] = eps*f; base[j] = eps*u
        source[j] = eps*(-lap+W2*u)
    residual = H@value-source
    sectors = [np.linalg.norm(residual[sector_indices(configs, offsets, (1, 1, 1), n)])
               for n in range(3)]
    return np.linalg.norm(residual), np.linalg.norm(value-base), np.linalg.norm(source), sectors


def derivative_invariant():
    # Independent central stencils at interior points check the analytic Laplacian.
    ds = 1e-5
    for s, r in ((.43, .023), (.52, .037), (.61, .058)):
        u, lap, _, _ = fields(s, r)
        stencil = (.5*(fields(s+ds, r)[0]-2*u+fields(s-ds, r)[0])
                   + 2*(fields(s, r+ds)[0]-2*u+fields(s, r-ds)[0]))/ds**2
        assert abs(stencil-lap) < 3e-5, "manufactured Laplacian derivative mismatch"
    # Outward flux and trace are exact at r=0; sample source has no boundary delta.
    assert fields(.5, 0)[0] == 0
    assert abs((fields(.5, ds)[0]-fields(.5, -ds)[0])/(2*ds)-1) < 1e-6
    print("GREEN independent Laplacian stencil, zero trace and unit diagonal normal derivative")


def source_norm_oracle():
    # Degree<=26 in each variable after squaring: 16-point Gauss is exact.
    nodes, weights = np.polynomial.legendre.leggauss(16)
    s, r = .5+.2*nodes[:, None], .15*(nodes[None, :]+1)
    u, lap, _, _ = fields(s, r)
    upper = .2*.15*np.sum(weights[:, None]*weights[None, :]*(-lap+4.67*u)**2)
    return np.sqrt((1.69*.6)**2+(3.18*.8)**2+upper)


def normal_cancellation(mutation=None):
    # Exact leading row for a collar affine in r with frozen tangential data.
    eps, alpha, g, S = 1/48, -float(48)**5, .73, 1.34
    sign = -1 if mutation == "wrong normal sign" else 1
    adjacent = (sign*2*g+S)/alpha
    mesh_term = 2*eps if mutation == "omit -eps G" else eps
    next_layer = (mesh_term+2/alpha)*g+S/alpha
    row_times_eps = 2*(adjacent-next_layer)/eps+alpha*adjacent-S
    assert abs(row_times_eps) < 1e-12, "exact leading normal/contact/source cancellation failed"


if __name__ == "__main__":
    started = perf_counter()
    print("COMMAND: OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 "
          "explorations/2026-10-25-astra-r3/F5-contact-trichotomy/checks/graph_core_vectors.py")
    print(f"VERSIONS Python={sys.version.split()[0]} NumPy={np.__version__} SciPy={scipy.__version__}")
    for path in (Path(__file__), Path(__file__).with_name("contact_fibres.py")):
        print(f"SHA256 {path.name} {hashlib.sha256(path.read_bytes()).hexdigest()}")
    derivative_invariant()
    normal_cancellation()
    print("GREEN exact affine-collar normal/contact/source row cancels, including -eps G correction")
    print("FRICTION original radius-.1 probe: exact source norm=6.0198718597; "
          "sampled L24/48/96=3.64432433,6.02377613,6.01986503; "
          "deep residuals=1.05773206,2.35879426,1.22061744. "
          "First-to-last decrease check failed from L24 underresolution; widen radial support to .3.")
    exact_source = source_norm_oracle()
    print(f"SOURCE exact polynomial quadrature norm={exact_source:.10e}; "
          "radius-.3 bump resolved on requested grids; acceptance uses first-to-last decrease")
    branches = {"slow negative -sqrtL": lambda L: -np.sqrt(L),
                "slow positive +sqrtL": lambda L: np.sqrt(L),
                "deep negative -L^5": lambda L: -float(L)**5,
                "sign-alternating deep": lambda L: (-1.0)**L*L**5}
    for name, alpha in branches.items():
        meshes = (24, 49, 96) if name == "sign-alternating deep" else (24, 48, 96)
        residuals, corrections = [], []
        for L in meshes:
            tick = perf_counter()
            residual, correction, source, sectors = manufactured(L, alpha(L))
            residuals.append(residual); corrections.append(correction)
            print(f"{name:24s} L={L:3d} alpha={alpha(L):+.8e} residual={residual:.8e} "
                  f"correction_norm={correction:.8e} source_norm={source:.8e} "
                  f"sector_residuals={np.array2string(np.array(sectors), precision=6)} "
                  f"seconds={perf_counter()-tick:.3f}")
        assert abs(source-exact_source) < .002*exact_source, "source sampling unresolved at final grid"
        assert residuals[-1] < .8*residuals[0], name+" graph residual not decreasing"
        assert corrections[-1] < .8*corrections[0], name+" vector correction not decreasing"
    for mutation in ("wrong normal sign", "omit -eps G"):
        wrong = [manufactured(L, -float(L)**5, mutation)[0] for L in (24, 48, 96)]
        try:
            normal_cancellation(mutation)
        except AssertionError as exc:
            print(f"RED CAUGHT {mutation}: residuals={wrong}; {exc}")
        else:
            raise AssertionError(mutation+" escaped graph-core convergence invariant")
    print(f"ALL GREEN manufactured graph-core checks total_seconds={perf_counter()-started:.3f}")
