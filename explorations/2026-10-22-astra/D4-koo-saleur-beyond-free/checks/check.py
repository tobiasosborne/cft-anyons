"""Small exact checks for NOTE.md; not an interacting continuum certificate.

Run from repo root using checks/run_checks.py (path relative to this directory).
The matrix calibration uses ordinary two-state tensor sites inside this check
only. It verifies universal finite algebra identities, not category fidelity.
Largest matrix: 16 by 16. Arithmetic: exact SymPy integers/rationals/complexes.
"""
import argparse
import platform
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument("--mutation", default="none", choices=[
    "none", "fourier_sign", "leakage_sign", "central_shift",
    "regularity_power", "ope_index"])
mutation = parser.parse_args().mutation
print(f"Python {platform.python_version()}; SymPy {s.__version__}; mutation={mutation}", flush=True)


def equal(actual, expected, label):
    difference = actual - expected
    if isinstance(difference, s.MatrixBase):
        assert all(s.simplify(x) == 0 for x in difference), label
    else:
        assert s.simplify(difference) == 0, label
    print(f"PASS {label}", flush=True)


def comm(a, b):
    return a * b - b * a


def bond(h, j, sites):
    """Ordered bond (j,j+1 modulo sites), leftmost bit first."""
    result = s.zeros(2**sites)
    other = (j + 1) % sites
    for col in range(2**sites):
        bits = [(col >> (sites - 1 - k)) & 1 for k in range(sites)]
        local_col = 2 * bits[j] + bits[other]
        for local_row in range(4):
            out = list(bits)
            out[j], out[other] = divmod(local_row, 2)
            row = sum(bit << (sites - 1 - k) for k, bit in enumerate(out))
            result[row, col] += h[local_row, local_col]
    return result


def placement(coarse, fine, slots):
    result = s.zeros(2**fine, 2**coarse)
    for col in range(2**coarse):
        row = sum(((col >> (coarse - 1 - j)) & 1) << (fine - 1 - slot)
                  for j, slot in enumerate(slots))
        result[row, col] = 1
    return result


# A Hermitian local tile combination, not a physical model identification.
h = s.Matrix([[1, 1+s.I, 2, 0], [1-s.I, 3, 1, 2],
              [2, 1, -1, s.I], [0, 2, -s.I, 2]])
equal(h.H, h, "Hermitian tile")
densities = [bond(h, j, 4) for j in range(4)]
currents = [s.I * comm(densities[j], densities[(j+1) % 4]) for j in range(4)]
total = sum(densities, s.zeros(16))
for j in range(4):
    equal(s.I * comm(total, densities[j]), currents[(j-1) % 4] - currents[j],
          f"continuity bond {j}")


def fourier(operators, n):
    return sum((s.I**(n*j) * op for j, op in enumerate(operators)), s.zeros(16))


m, n = 1, -1
sign = 1 if mutation == "fourier_sign" else -1
equal(comm(fourier(densities, m), fourier(densities, n)),
      sign*s.I*(s.I**n-s.I**m)*fourier(currents, m+n), "Fourier current sign")
equal((fourier(densities, 1)-fourier(currents, 1)).H,
      fourier(densities, -1)-fourier(currents, -1), "KS adjoint pairing")

# Compression on a three-site patch, inserting the middle site in |0>.
v = placement(2, 3, [0, 2])
p = v*v.H
outside = s.eye(8)-p
k1, k2 = bond(h, 0, 3), bond(h, 1, 3)
b1, b2 = v.H*k1*v, v.H*k2*v
f1, f2 = outside*k1*v, outside*k2*v
leakage = f1.H*f2-f2.H*f1
assert leakage != s.zeros(4), "calibration must detect omitted leakage"
sign = -1 if mutation == "leakage_sign" else 1
equal(v.H*comm(k1, k2)*v, comm(b1, b2)+sign*leakage,
      "compressed current leakage")
u, w, q = s.symbols("u w q", real=True)
fine_mode = u*k1+w*k2-q*s.I*comm(k1, k2)
coarse_mode = h
equal(fine_mode*v-v*coarse_mode,
      outside*fine_mode*v+v*(v.H*fine_mode*v-coarse_mode), "transport split")
equal(v.H*fine_mode*v, u*b1+w*b2-q*s.I*(comm(b1,b2)+leakage),
      "tile compression formula")

# Bare dyadic insertion and the spectator-projector support distinction.
v2 = placement(2, 4, [0, 2])
unit = s.Matrix([1, 0])
right = s.kronecker_product(s.eye(2), unit)
left = s.kronecker_product(unit, s.eye(2))
br, bl = right.H*h*right, left.H*h*left
fine_open = sum((bond(h,j,4) for j in range(3)), s.zeros(16))
equal(v2.H*fine_open*v2,
      s.kronecker_product(br,s.eye(2))+s.kronecker_product(s.eye(2),bl+br),
      "dyadic energy compresses to one-site sum")
local_stretched = s.kronecker_product(v*h*v.H, s.eye(2))
global_corner = v2*h*v2.H
assert local_stretched != global_corner, "global corner must retain spectator pin"
equal(local_stretched*v2, v2*h, "local representative covariance")
equal(global_corner, local_stretched*v2*v2.H, "global corner spectator projector")

# Central coefficients, the finite-stage trace obstruction, and OPE indexing.
m, n, c, cs, shift, dim, tr = s.symbols("m n c cs shift dim tr")
first = 2*tr+(cs-c)*dim/12
second = 4*tr+(8*cs-2*c)*dim/12
equal(second-2*first, cs*dim/2, "trace obstruction to cubic anomaly")
updated_c = c-24*shift if mutation == "central_shift" else c+24*shift
equal((m**3*cs-m*c)/12-2*m*shift,
      (m**3*cs-m*updated_c)/12, "zero-mode central-origin shift")
choose = m if mutation == "ope_index" else m+1
equal(-(m+n+2)+2*choose, m-n, "stress OPE linear mode coefficient")
equal(c*choose*(choose-1)*(choose-2)/12,
      c*(m**3-m)/12, "stress OPE central coefficient")

# A high-shell counterexample at p=1, with spare-power suppression at p=2.
r = 3
control = 2**r*s.eye(2)
tplus = s.Matrix([[0,2**r],[0,0]])
residual = comm(tplus,tplus.H)
equal(residual*control**-2, s.diag(1,-1), "p=1 residual does not shrink")
power = 1 if mutation == "regularity_power" else 2
stronger = control**power
equal(residual*stronger**-2, s.Rational(1,2**(2*r))*s.diag(1,-1),
      "spare-power residual suppression")
k = s.symbols("k", integer=True, positive=True)
equal(s.summation(k**-2,(k,1,s.oo)), s.pi**2/6, "character-growth scalar sum")
print("ALL EXACT CHECKS PASSED; no continuum estimate inferred.", flush=True)
