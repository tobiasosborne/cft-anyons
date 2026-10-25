#!/usr/bin/env python3
"""F5 review check: finite-fibre coordinate calibration, not a convergence proof.

Command (from repository root; BLAS budget is one thread):
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 \
 explorations/2026-10-25-astra-r3/F5-contact-trichotomy/checks/review_tuned_convergence.py

Modified from E6/checks/review_tuned_convergence.py, whose positive-square
compression is independently checked here at L=4. General finite-fibre API
and exact-family conventions live in contact_fibres.py. The tested target is
any/open, L0+declared maps, R0^c plus an off-ladder z=2 resolvent limit;
neither conformality nor category fidelity is tested. Model examples are
source-backed dimension rows, never the large-grid system.

Resolvents are (H-i)^-1. The test function sqrt(2)(cos(pi*y)-cos(pi*x)) has
unit continuum norm and eigenvalue pi^2+2mu. Exact box integrals include
the projection defect in the reported relative L2 resolvent error. A
diving Rayleigh witness is recorded separately from resolvent convergence.
All tolerances below are explicit calibration acceptance tests, not rates
claimed for the general theorem. Output includes script hashes and timing.
"""
import hashlib
import platform
from pathlib import Path
import sys
from time import perf_counter
import numpy as np
import scipy
import scipy.sparse as sp
import scipy.sparse.linalg as spl
from contact_fibres import build, dirichlet_box, scalar, sector_indices
from contact_invariants import examples, run_invariants


def embedded_error(response, box, eigenvalue):
    target = box/(eigenvalue-1j)
    defect = max(0.0, 1-float(np.vdot(box, box).real))/abs(eigenvalue-1j)**2
    return np.sqrt(np.linalg.norm(response-target)**2+defect)*abs(eigenvalue-1j)


def solve(H, rhs):
    factor = spl.splu((H-1j*sp.eye(H.shape[0], format="csc")).tocsc())
    response = factor.solve(rhs.astype(complex))
    residual = np.linalg.norm(H@response-1j*response-rhs)/max(1, np.linalg.norm(rhs))
    assert residual < 1e-8, f"linear solve residual {residual}"
    return response, residual


def nonreacting():
    print("\nNONREACTING scalar coordinate/fibre calibration; no large categorical chains")
    branches = {"finite -2": lambda L: -2.0, "finite 0": lambda L: 0.0,
                "finite +2": lambda L: 2.0, "+infinity L": lambda L: float(L),
                "negative moderate -4L": lambda L: -4.0*L,
                "negative deep -L^5": lambda L: -float(L)**5}
    records = {}
    for label, alpha in branches.items():
        errors = []
        for L in (12, 24, 48, 96):
            start = perf_counter()
            data = scalar(reactions=False)
            H, cs, ix = build(L, alpha(L), data)
            box = dirichlet_box(L, cs, ix, data.dims)
            response, residual = solve(H, box)
            err = embedded_error(response, box, np.pi**2+2)
            adj = np.array([ix[c] for c in cs if len(c) == 2 and c[1] == c[0]+1])
            boundary = np.linalg.norm(response[adj])**2/np.linalg.norm(response)**2
            witness = np.zeros(len(box)); witness[adj] = 1/np.sqrt(L-1)
            rayleigh = float(np.vdot(witness, H@witness).real)
            known = 2*L**2*(L-2)/(L-1)+alpha(L)*L+2
            assert abs(rayleigh-known) < 1e-12*max(1, abs(known))
            errors.append(err)
            print(f"{label:25s} L={L:3d} alpha={alpha(L):+.5e} "
                  f"rel_D_error={err:.8e} boundary_weight={boundary:.8e} "
                  f"pair_Rayleigh={rayleigh:+.8e} residual={residual:.2e} "
                  f"seconds={perf_counter()-start:.3f}")
        records[label] = errors
    for label in ("+infinity L", "negative deep -L^5"):
        assert records[label][-1] < records[label][0]/3, label+" did not approach Dirichlet"
        assert records[label][-1] < 0.05, label+" missed Dirichlet calibration"
    for label in ("finite -2", "finite 0", "finite +2"):
        assert records[label][-1] > 0.1, "finite Robin collapsed to Dirichlet"
    print("GREEN: positive and deeply attractive branches both approach the same "
          "Dirichlet response; spectral diving alone is not a no-limit test")
    # Mesh signs genuinely alternate; all-even L would fail to test this case.
    oscillating = []
    for L in (12, 25, 48, 97):
        alpha = (-1.0)**L*L**5
        H, cs, ix = build(L, alpha, scalar(reactions=False))
        box = dirichlet_box(L, cs, ix, (1, 1, 1))
        r, residual = solve(H, box)
        err = embedded_error(r, box, np.pi**2+2)
        oscillating.append(err)
        print(f"sign-alternating deep      L={L:3d} alpha={alpha:+.5e} "
              f"rel_D_error={err:.8e} residual={residual:.2e}")
    assert oscillating[-1] < oscillating[0]/3
    print("GREEN: |alpha| divergent sign-alternating sequence also approaches "
          "Dirichlet on this probe; alpha need not have a signed limit")


def reactions():
    print("\nREACTIONS scalar coordinate/fibre calibration; lam=kap=mu=t=1, b=.7,v=1.3")
    records = {}
    finite_spectra = []
    for label, alpha in (("finite +2", lambda L: 2.0),
                         ("+infinity L", lambda L: float(L))):
        rows = []
        for L in (12, 24, 48, 96):
            start = perf_counter()
            data = scalar()
            H, cs, ix = build(L, alpha(L), data)
            sectors = [sector_indices(cs, ix, data.dims, n) for n in range(3)]
            vacuum = np.zeros(H.shape[0]); vacuum[0] = 1
            flat = np.zeros(H.shape[0]); flat[sectors[1]] = 1/np.sqrt(L)
            box = dirichlet_box(L, cs, ix, data.dims)
            r, residual = solve(H, np.column_stack((vacuum, flat, box)))
            mixing = np.linalg.norm(r[sectors[2], 0])
            retained0 = abs(r[0, 0]-1/(1.3**2-1j))
            omitted0 = abs(r[0, 0]-1j)
            # Limit lower potentials: Q_b per particle plus gamma per sector.
            one_error = np.linalg.norm(r[:, 1]-flat/(1+.7**2+1.3**2-1j))
            two_error = embedded_error(r[:, 2], box, np.pi**2+2+2*.7**2+1.3**2)
            low, vec = spl.eigsh(H, k=4, sigma=-1.0, which="LM", tol=1e-9)
            order = np.argsort(low); low, vec = low[order], vec[:, order]
            weights = [float(np.linalg.norm(vec[s, 0])**2) for s in sectors]
            rows.append((mixing, retained0, one_error, two_error))
            if label == "finite +2":
                finite_spectra.append(low)
            print(f"{label:12s} L={L:3d} Rvac_N2={mixing:.8e} "
                  f"vac_retained_error={retained0:.8e} vac_zero_potential_error={omitted0:.8e} "
                  f"one_retained_error={one_error:.8e} two_retained_rel_error={two_error:.8e} "
                  f"lowest={np.array2string(low, precision=6)} "
                  f"ground_N_weights={np.array2string(np.array(weights), precision=6)} "
                  f"residual={residual:.2e} seconds={perf_counter()-start:.3f}")
        records[label] = rows
    assert records["finite +2"][-1][0] > .05, "finite reaction mixing disappeared"
    differences = [float(np.max(np.abs(b-a)))
                   for a, b in zip(finite_spectra, finite_spectra[1:])]
    print(f"finite +2 successive lowest-spectrum max differences={differences}")
    assert differences[-1] < differences[0]/2.5, "finite-alpha spectra not Cauchy"
    positive = records["+infinity L"]
    assert positive[-1][0] < positive[0][0]/3, "repulsive mixing did not vanish"
    assert positive[-1][1] < positive[0][1]/3, "vacuum potential gamma was lost"
    assert positive[-1][2] < positive[0][2]/3, "one-particle lower potential was lost"
    assert positive[-1][3] < positive[0][3]/3, "two-particle lower potentials were lost"
    print("GREEN: finite-alpha number mixing persists; repulsive decoupling retains "
          "gamma and Q_b lower-sector potentials")


def metadata():
    print("COMMAND: OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 "
          "explorations/2026-10-25-astra-r3/F5-contact-trichotomy/checks/review_tuned_convergence.py")
    print(f"VERSIONS Python={sys.version.split()[0]} NumPy={np.__version__} "
          f"SciPy={scipy.__version__} platform={platform.platform()}")
    print("SOURCES: PenneysUnitaryFusionCategories.md:610-631; "
          "RSWfinal3.tex:2441-2448; CA-77:207-246; CA-94:90-110,180-193")
    root = Path(__file__).resolve().parent
    for path in sorted(root.glob("*.py")):
        print(f"SHA256 {path.name} {hashlib.sha256(path.read_bytes()).hexdigest()}")


if __name__ == "__main__":
    started = perf_counter()
    metadata()
    run_invariants()
    examples()
    nonreacting()
    reactions()
    print(f"ALL GREEN total_seconds={perf_counter()-started:.3f}")
