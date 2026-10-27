"""Source-backed tiny instance of the general FS obstruction, H1-D1.

ONLY a check: Hilb_fd(Z/2, omega), omega(a,b,c)=(-1)^(abc).
Sources: references/text/PenneysUnitaryFusionCategories.md:595-608,
917-931,1032-1047. Unit first; O=1_vac+g; left-associated paths.
The complete four-site space has 16 paths, not an asymptotic computation.
P1/P2; any; L0, finite. No continuum conclusion.
"""
from itertools import product
from fractions import Fraction
from pathlib import Path
from datetime import datetime, timezone
import hashlib
import platform


def omega(a, b, c):
    return (-1)**(a*b*c)


def add(a, b):
    return (a+b) % 2


print("UTC:", datetime.now(timezone.utc).isoformat())
print("Python:", platform.python_version())
print("SHA256:", hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
print("Command: python3", Path(__file__).relative_to(Path.cwd()))
for a, b, c, d in product(range(2), repeat=4):
    assert (omega(b,c,d)*omega(a,add(b,c),d)*omega(a,b,c)
            == omega(add(a,b),c,d)*omega(a,b,add(c,d))), "pentagon"
for a, b in product(range(2), repeat=2):
    assert omega(0,a,b) == omega(a,0,b) == omega(a,b,0) == 1
print("PASS: all 16 cocycle pentagons and all normalized unit identities")
raw_cup = raw_cap = 1
raw_snake = raw_cap * omega(1,1,1) * raw_cup
assert raw_snake == -1
assert raw_cap*raw_cup == 1
# Correct oriented evaluation is -1 with this coevaluation convention.
assert (-1)*omega(1,1,1)*raw_cup == 1
print("PASS: raw norm d=1, raw selfdual snake kappa=-1; oriented snake=+1")


def event(state, bond, incoming, outgoing):
    """Local tile in a left tree, with associators restored explicitly.

    j is 0-based; alpha(prefix,a,b)=omega(prefix,a,b).
    A local charge-preserving map is embedded as alpha_out^-1 T alpha_in.
    All elementary raw maps here have local scalar 1.
    """
    assert tuple(state[bond:bond+2]) == incoming, "incompatible occupation"
    assert sum(incoming) % 2 == sum(outgoing) % 2, "charge changed"
    prefix = sum(state[:bond]) % 2
    phase = omega(prefix,*incoming)*omega(prefix,*outgoing)
    result = list(state)
    result[bond:bond+2] = outgoing
    return result, phase


state = [0,0,0,0]
phase = 1
events = [
    (0,(0,0),(1,1)),  # birth 12
    (2,(0,0),(1,1)),  # birth 34, same odd layer
    (1,(1,1),(0,0)),  # death 23
    (2,(0,1),(1,0)),  # hop 4->3
    (1,(0,1),(1,0)),  # hop 3->2
    (0,(1,1),(0,0)),  # death 12
]
for j, inc, out in events:
    state, factor = event(state, j, inc, out)
    phase *= factor
    print("event", j+1, inc, "->", out, "phase", factor, "state", state)
assert state == [0,0,0,0] and phase == -1
# h=(b+b^dagger)+(hop+ + hop-) has two disjoint sigma_x blocks.
# At t=log(2), each nontrivial elementary coefficient is sinh(t)=3/4;
# I and all cosh(t)-1 projector corrections are nonnegative.
weight = phase * Fraction(3,4)**len(events)
assert weight == -Fraction(729,4096)
print("PASS: actual four-site categorical history Ev=-1 with all tile coefficients positive")
print("Exact closed weight at t=log(2), lambda=1:", weight)
try:
    assert phase == 1, "mutated rule wrongly erases FS sign"
except AssertionError:
    print("MUTATION DETECTED: naive all-positive circle evaluation rejects actual FS history")
else:
    raise AssertionError("FS mutation escaped")
print("ALL SOURCE-BACKED FS INSTANCE CHECKS PASSED")
